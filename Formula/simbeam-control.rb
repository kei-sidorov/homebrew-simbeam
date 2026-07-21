class SimbeamControl < Formula
  desc "Stream and control a booted iOS Simulator"
  homepage "https://github.com/kei-sidorov/simbeam-control"
  url "https://github.com/kei-sidorov/simbeam-control/releases/download/v0.2.0/simbeam-control_0.2.0_darwin_universal.tar.gz"
  sha256 "5930609cc27f14634092d5b9c5d482bf0c4a1ca346ebb3e430768fcf17a4ba3a"

  depends_on xcode: "26.4.1"

  def install
    bin.install "simbeam-control"
  end

  def caveats
    <<~EOS
      simbeam-control uses private CoreSimulator and SimulatorKit APIs from Xcode.
      It supports iOS Simulators only and requires a full Xcode installation.
    EOS
  end

  test do
    assert_match "Usage: simbeam-control", shell_output("#{bin}/simbeam-control --help")
  end
end
