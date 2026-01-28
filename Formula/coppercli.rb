class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.3.0/coppercli-v0.3.0-osx-arm64.tar.gz"
      sha256 "35c97014b37751d6937778ba65e5cbcde62709abf8db893fb47f44d085c84ed6"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.3.0/coppercli-v0.3.0-osx-x64.tar.gz"
      sha256 "be24223d3eb9050fead8b5d61ac24224ced3dcdd052abe66c14b69984c0a73b2"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.3.0/coppercli-v0.3.0-linux-x64.tar.gz"
    sha256 "69fd2552382800f324e29acc0a67b6f2ae49375dc644560f5f7d9ad89321d75d"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
