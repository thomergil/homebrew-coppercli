class Coppercli < Formula
  desc "CLI tool for PCB milling with GRBL CNC machines, featuring auto-leveling"
  homepage "https://github.com/thomergil/coppercli"
  version "v0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.1/coppercli-v0.2.1-osx-arm64.tar.gz"
      sha256 "3152f61b3ae585d983dc3efdc1d806e36e27299d9ee2e7eb17cc5e5afd900a29"
    else
      url "https://github.com/thomergil/coppercli/releases/download/v0.2.1/coppercli-v0.2.1-osx-x64.tar.gz"
      sha256 "c09dc658914f105a272fddfd67360f181c9ac4b3677a49bbab7ec7a3eaf9ecd1"
    end
  end

  on_linux do
    url "https://github.com/thomergil/coppercli/releases/download/v0.2.1/coppercli-v0.2.1-linux-x64.tar.gz"
    sha256 "4d58ed5c682d66a22b827ea0b11e96e562ff8450ce83502cd3718f844607cc87"
  end

  def install
    bin.install "coppercli"
  end

  test do
    # The binary should at least show version/help without crashing
    assert_match "coppercli", shell_output("#{bin}/coppercli --help 2>&1", 1)
  end
end
