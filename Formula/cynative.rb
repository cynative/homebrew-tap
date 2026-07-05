class Cynative < Formula
  desc "Agentic security research across your code, cloud and runtime — read-only by construction"
  homepage "https://github.com/cynative/cynative"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.26, whose macOS floor is 12 (Monterey), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :monterey" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "272092b23d507d2aca9a4738cb04698e0654b34c0377cfa3eef6ca376ea8de0e"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "07f0615a897102ac6e9d2e8f23a8c48aba39b275e51849d961d0e4d204af8bcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "e6c9b62657c436d02b04db3ac7ca9e8c2d9d7b460694bfbd1f4ffd026d732e9d"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "3c1a0f9de35885001f354768b8b5c8012bc6b7a4ddf9630ce4685d8b3485c327"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
