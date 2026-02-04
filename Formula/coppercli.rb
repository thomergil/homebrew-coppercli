class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.4.0a"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0a/coppercli-v0.4.0a-osx-arm64.tar.gz"
      sha256 "abda45c1d6a09aac968634e0a16565b7e7952d9b79be8b4844087c949c479c6a"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0a/coppercli-v0.4.0a-osx-x64.tar.gz"
      sha256 "8e33d8a79124183febd68c56386248006ae7af7afd5ef470a21bfab87dd80a72"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.4.0a/coppercli-v0.4.0a-linux-x64.tar.gz"
    sha256 "e27a8c2da6ae5cfdd7f51ccc6a9d8994d003de8db16008b0d44244414aef816e"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
