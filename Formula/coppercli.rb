class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.0/coppercli-v0.2.0-osx-arm64.tar.gz"
      sha256 "c79a3e85819c34142cb6d959ecea2ff76de7db827b250ba466ab37cb4fd60c4b"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.0/coppercli-v0.2.0-osx-x64.tar.gz"
      sha256 "71f4fc23c7d0571900c72645ab78ff9b26a2ff732935ed289bd21b1ccb82d61f"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.2.0/coppercli-v0.2.0-linux-x64.tar.gz"
    sha256 "a9bf224333378c4c06303596d44f291e0c9d8cc5ebac14eb7f7202d6442f2b62"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
