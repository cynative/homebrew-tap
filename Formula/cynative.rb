class Cynative < Formula
  desc "Agentic security research across your code, cloud, and runtime (read-only)"
  homepage "https://github.com/cynative/cynative"
  version "1.14.4"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.27, whose macOS floor is 13 (Ventura), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :ventura" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :ventura

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "bbb429eb4318be9129f3fcdf32ce7bfefdce92f8fc0e3bffd7d6d864a3fbf8dc"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "aa5a13539381290aa88e34ee15ecc2292dddef346699267b0cc907a2c00a616b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "200697e61c2f5a0e7a563387336b2a0c1b0711ee52ce383aaa5707f8940e592a"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "ee21515c0b7ef0b43da954aaab1b02bbc2a20be9e18f247706fb2ee28962c20e"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
