class Cynative < Formula
  desc "Agentic security research across your code, cloud, and runtime (read-only)"
  homepage "https://github.com/cynative/cynative"
  version "1.9.2"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.26, whose macOS floor is 12 (Monterey), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :monterey" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "207efd60bdde681e86e08d85ca6f871c4cb785a1c278db9b34386814c5449520"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "8c55a9b2fdd5dc9b41fc3e83a4855cd8f54caab504112cb0812b5a1a77802819"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "01e071314eeb1c1f469df318c04e11079b1ee17a39f9d5ceb49fe6b5d90d1707"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "fe9ee877551bb628ebe897048800d36db8972edf61df6d0d2d8a80e5ad0f97bb"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
