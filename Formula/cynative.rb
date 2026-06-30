class Cynative < Formula
  desc "Agentic security research across your code, cloud and runtime — read-only by construction"
  homepage "https://github.com/cynative/cynative"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.26, whose macOS floor is 12 (Monterey), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    depends_on macos: ">= :monterey"

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "2d179f9571a86722aee4bcba3d338721f896962ff6d8c377730d2828bbf5281c"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "c8a037deb9bf7bd6cf01bceabc6667f46862638069795f4bde236b89de18215b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "d8dc1f4691841ee45536192aa7643372fb8b07c2039fe768bf621a4d7bd874e1"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "a30326288fe3d1e9852d6c422c43adcac150aa544ba65a02e79f544a951d85ad"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
