class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.3.1/coppercli-v0.3.1-osx-arm64.tar.gz"
      sha256 "946b598f3dd99c9fd0089b666c4c09fabee826d1c1c76dccba8638494e75ca96"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.3.1/coppercli-v0.3.1-osx-x64.tar.gz"
      sha256 "8874174a79f185b12e9427bfa959f9d7981cf24d7cd886479da45aaf35b75f71"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.3.1/coppercli-v0.3.1-linux-x64.tar.gz"
    sha256 "d63e754ced5ad22c3f6c14da8b3a573aaccc541c75a3a482b8fc5b0d4991811d"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
