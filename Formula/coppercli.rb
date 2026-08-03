class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.1/coppercli-v0.4.1-osx-arm64.tar.gz"
      sha256 "2b5a7b6ac200d4e8c3c167e81ab69a8888c18e19ced18ae7d6bfb8969c54d818"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.1/coppercli-v0.4.1-osx-x64.tar.gz"
      sha256 "915504c756b108b10dca3b0a93cebf912c6c259b1d8242df3b4dd9029c638641"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.4.1/coppercli-v0.4.1-linux-x64.tar.gz"
    sha256 "a88a06d817b4a9f4033bbfacb99317039557c914eb2218e13c0003ed6fc61f4f"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
