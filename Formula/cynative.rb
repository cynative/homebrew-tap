class Cynative < Formula
  desc "Agentic security research across your code, cloud, and runtime (read-only)"
  homepage "https://github.com/cynative/cynative"
  version "1.12.2"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.27, whose macOS floor is 13 (Ventura), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :ventura" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :ventura

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "cf0e0eeb028fb171e6e303567703b5d3f20201038647890b483657b81638df61"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "62522abfde58ad943fe76881bcd8e94f30a822ca938d33105e3cd7fc9ac69286"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "e5aaebf77a9e7d52f971e657de8b781487c01ea6add7d343fe0b2060a73364fa"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "a93b47219c5e77bf0eb9420d6dfac5d6552275bd3053212b281ee75d930a875a"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
