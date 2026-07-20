class Cynative < Formula
  desc "Agentic security research across your code, cloud, and runtime (read-only)"
  homepage "https://github.com/cynative/cynative"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.26, whose macOS floor is 12 (Monterey), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :monterey" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "14e52aae752f7e8918f27c7f4e375fe8206dd4fbcb8972e5f5bb1e0b7c6ce35b"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "30a2743e6c4759c952bd7cd45b8a2747e81837fc9b7216d98aedf0dbc2027ba8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "cfb1e680aa0d6e9abdde97bd56f192605ffb5c78c50d61db67a42daa79fdc37d"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "78f20310b99379c4e4c1da9c07d756ccb590e345295c99d738877dd81bc89566"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
