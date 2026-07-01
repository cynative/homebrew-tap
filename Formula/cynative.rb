class Cynative < Formula
  desc "Agentic security research across your code, cloud and runtime — read-only by construction"
  homepage "https://github.com/cynative/cynative"
  version "1.4.1"
  license "Apache-2.0"

  on_macos do
    # cynative is built with Go 1.26, whose macOS floor is 12 (Monterey), so gate
    # installs there — unsupported hosts fail before downloading an unrunnable binary.
    # A bare symbol means ">= that release"; the ">= :monterey" string form is
    # deprecated and errors on current brew ("unknown or unsupported macOS version").
    depends_on macos: :monterey

    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_arm64.tar.gz"
      sha256 "6484d2da2fb92812317f5224a3d72fe6fa1c5edf9ef4f3577a2578d61dc8d1dd"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_x86_64.tar.gz"
      sha256 "22c3521a41d85e1b8ebc9d966b8d0f2f8777594dce30f22949129b783125cab5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_arm64.tar.gz"
      sha256 "d027d64fad33f712c4199172d27d3e502b9c8814a1125a650858f457154d55f4"
    end

    on_intel do
      url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Linux_x86_64.tar.gz"
      sha256 "560b5dad069921f2c0d311863d70a8cf412662f3dbe5842b66eb6aa3aee98214"
    end
  end

  def install
    bin.install "cynative"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cynative --version")
  end
end
