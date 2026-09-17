class Cynative < Formula
  desc "Agentic security research across your code, cloud, and runtime (read-only)"
  homepage "https://github.com/cynative/cynative"
  version "1.12.1"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.27, whose macOS floor is 13 (Ventura), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :ventura" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :ventura

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "69add05432a6d583788921ddf4fe0719ce72e644c8850c643926ab9bc0e09582"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "1fd5eed70b1743b9500a395f21e17e6f0f7a5e888e86a727c34ecfc6f4d09fc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "9ace9544c361137c907e6fc2f3b92791df13ca005ae334f51690e89e0b2d38b9"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "686746a184fcc0ed001561baa6749228b788cc00c172cca08ea698f7b15a63f8"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
