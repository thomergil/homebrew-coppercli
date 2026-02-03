class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0/coppercli-v0.4.0-osx-arm64.tar.gz"
      sha256 "90a1e4d6fcb0d1238495bb72eeefadbc3eb0ed7c369e7094649bbb4f89a404b9"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0/coppercli-v0.4.0-osx-x64.tar.gz"
      sha256 "6fbac0fbf4ed442bf76e035178ebebaf21bea17689faca131d9a3ea2682636a5"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.4.0/coppercli-v0.4.0-linux-x64.tar.gz"
    sha256 "6c7adc802f6169cd02ebd724f2296c1d374335ac7f5ffcec0dc41cf6c54fbc46"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
