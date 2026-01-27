class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.1/coppercli-v0.2.1-osx-arm64.tar.gz"
      sha256 "b676752fdaff27a448cd391aed97c5affd5ea8b4a9f5131939eaf3cb45af0a22"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.1/coppercli-v0.2.1-osx-x64.tar.gz"
      sha256 "6de2d82bfb3d982f6611f35bb51b6e9169964cfaf60c76ce6ba2201439b36c4d"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.2.1/coppercli-v0.2.1-linux-x64.tar.gz"
    sha256 "67571d1db3220d2cf37b4d2fbbe80ade2429ec3524aab2e7ceb796c52548a39a"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
