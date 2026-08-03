class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.4.1a"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.1a/coppercli-v0.4.1a-osx-arm64.tar.gz"
      sha256 "3118da7933bb4175cf6eeff42b5f295dcd36d4d6a8c34f8212c368641c1f656f"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.1a/coppercli-v0.4.1a-osx-x64.tar.gz"
      sha256 "d82e7dd5df06ab87f549b8f6794173a2ac5613fa04b7b2d80351f5d891037557"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.4.1a/coppercli-v0.4.1a-linux-x64.tar.gz"
    sha256 "e9f2cba247717e785bc15e0b8db0154943406d24db196a5c3ecec538aca5ad75"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
