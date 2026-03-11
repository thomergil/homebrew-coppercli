class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.4.0d"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0d/coppercli-v0.4.0d-osx-arm64.tar.gz"
      sha256 "1259ac7b219f1917db96567fc960626d88724673104bf39f2a87b9927a3c16c4"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0d/coppercli-v0.4.0d-osx-x64.tar.gz"
      sha256 "62ad45ccce5e728cd4cde96be3d4c88c4aa70ec70f8600a76f7ef64c44158090"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.4.0d/coppercli-v0.4.0d-linux-x64.tar.gz"
    sha256 "52e65a3dc1b5e7adaf7a35e7efb09b3989d4bcefaeeb975ac2a12ec0f9fa77cc"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
