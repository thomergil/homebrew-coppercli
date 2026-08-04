class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.2/coppercli-v0.4.2-osx-arm64.tar.gz"
      sha256 "86bc3cc0e8f3c1ec1d77bb5e3bce5d100f53edd4c14882b5908368a5d9bad74e"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.2/coppercli-v0.4.2-osx-x64.tar.gz"
      sha256 "24ecb44a8b2d78ddde4c045ac2846f3375cf76d6e5c427f08abeba7df915bf01"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.4.2/coppercli-v0.4.2-linux-x64.tar.gz"
    sha256 "c8420773076728c28ae73126827ca741a4fe51c12f85badb260cb9967e85eb7b"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
