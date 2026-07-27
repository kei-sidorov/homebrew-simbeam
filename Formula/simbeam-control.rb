class SimbeamControl < Formula
  desc "Stream and control a booted iOS Simulator"
  homepage "https://github.com/kei-sidorov/simbeam-control"
  url "https://github.com/kei-sidorov/simbeam-control/releases/download/v0.5.0/simbeam-control_0.5.0_darwin_universal.tar.gz"
  sha256 "fbb1ce74ee4d2e335ac1792575bb62aa977c0ef65ba94a367f851aca0e8725a8"

  depends_on :xcode

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
