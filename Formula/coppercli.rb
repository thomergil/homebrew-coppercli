class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.0/coppercli-v0.2.0-osx-arm64.tar.gz"
      sha256 "8f5fece3ee527ee312e92c0271250680a39cf184951d8ba57b4100249b128fd1"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.0/coppercli-v0.2.0-osx-x64.tar.gz"
      sha256 "33fc2c802492cebba3d4cbe35585d84a504fc7e038ab76ffccbf40c1567ab6cb"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.2.0/coppercli-v0.2.0-linux-x64.tar.gz"
    sha256 "20d3fdcd00e46e2dd103945f9dbd041db784b402eb283c9f8ad4b3bd0e433b08"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
