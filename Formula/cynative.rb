class Cynative < Formula
  desc "Agentic security research across your code, cloud, and runtime (read-only)"
  homepage "https://github.com/cynative/cynative"
  version "1.14.0"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.27, whose macOS floor is 13 (Ventura), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :ventura" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :ventura

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "a537d59ce914c0dad06aceabfc729e58dc46054ab59bd7f84a7a45ec2389780e"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "ad1eeee66aba421ba4f08e8fc13fcbf53c1dc16d8666b7be2c6f2d1ac3ff297a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "3181040e4f8d79e63c29e1fca81aedbeff4752285dcc639340f2b09ed7a664af"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "d8d6eb0fafa0e8af4ae472fee221e1bc57b05a77823712f5912b6f62be895764"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
