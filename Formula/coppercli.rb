class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.2.3a"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.3a/coppercli-v0.2.3a-osx-arm64.tar.gz"
      sha256 "3f946bcc7381430b3bb8ab0a5523af56832f7b707f3f6fceaa3e337f32817941"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.3a/coppercli-v0.2.3a-osx-x64.tar.gz"
      sha256 "89372464c10a07a0f8f48af22aada0e4d882d4e8ad8cdef0ef359d67bebf1d21"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.2.3a/coppercli-v0.2.3a-linux-x64.tar.gz"
    sha256 "d04a7c9582e714cdfaa902d8b42ff74a9d150ffbc224d1b187cbadc0fd558a6e"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
