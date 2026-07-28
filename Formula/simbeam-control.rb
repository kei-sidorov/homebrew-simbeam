class SimbeamControl < Formula
  desc "Stream and control a booted iOS Simulator"
  homepage "https://github.com/kei-sidorov/simbeam-control"
  url "https://github.com/kei-sidorov/simbeam-control/releases/download/v0.6.0/simbeam-control_0.6.0_darwin_universal.tar.gz"
  sha256 "272e83646ac46abb7f12ef8ad33ee8d20cc5ba804858c4e000a8cb18dd580041"

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
