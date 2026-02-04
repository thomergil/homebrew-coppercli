class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.4.0b"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0b/coppercli-v0.4.0b-osx-arm64.tar.gz"
      sha256 "8d8770ea47a70fe3950a63dc72f1120eeb8f2d980f5919e9f543b5b30b021b76"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.4.0b/coppercli-v0.4.0b-osx-x64.tar.gz"
      sha256 "5ffda30dad43ee3c50c29dcab43191bd51e18e26c7cdd23ce84bb47b693fa3b0"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.4.0b/coppercli-v0.4.0b-linux-x64.tar.gz"
    sha256 "dac771a50f855d29f3475b9e6049922330d9eeae4744b221240da17a2f04043b"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
