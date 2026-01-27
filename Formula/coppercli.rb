class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.2/coppercli-v0.2.2-osx-arm64.tar.gz"
      sha256 "8451b35a2162b19bff254dfdea60a2ac43d56b0c9432ee5ebfca2a2a3ef69a5c"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.2/coppercli-v0.2.2-osx-x64.tar.gz"
      sha256 "4cfcb2d15b98c2f9016fa4e124fdbd72a865e31194a3bea0ea8975f7fc29ca1d"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.2.2/coppercli-v0.2.2-linux-x64.tar.gz"
    sha256 "3055875efae0e0d7461a54f9c3cda0b471b3ed38c6ada1d7d14d7cbdc286b523"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
