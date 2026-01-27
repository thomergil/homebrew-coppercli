class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.3/coppercli-v0.2.3-osx-arm64.tar.gz"
      sha256 "0962cb5325539792e85a78ea83185ad1d6637520cab4620fd77d5384f0442f03"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.3/coppercli-v0.2.3-osx-x64.tar.gz"
      sha256 "dc2351935ccde774e011fa65efb4be9bad484156aaf6e08acce5638d8ba42667"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.2.3/coppercli-v0.2.3-linux-x64.tar.gz"
    sha256 "753a359abf44c6a2414b190a2bce171c03f8549c61e13ebf6a436c236da08b32"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
