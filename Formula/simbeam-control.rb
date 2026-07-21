class SimbeamControl < Formula
  desc "Stream and control a booted iOS Simulator"
  homepage "https://github.com/kei-sidorov/simbeam-control"
  url "https://github.com/kei-sidorov/simbeam-control/releases/download/v0.3.0/simbeam-control_0.3.0_darwin_universal.tar.gz"
  sha256 "fa38202fa89747d8b290b3a2bed3a3e81ffc3262c42e1d116a31987a21c90c6a"

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
