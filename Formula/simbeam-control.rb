class SimbeamControl < Formula
  desc "Stream and control a booted iOS Simulator"
  homepage "https://github.com/kei-sidorov/simbeam-control"
  url "https://github.com/kei-sidorov/simbeam-control/releases/download/v0.1.0/simbeam-control_0.1.0_darwin_universal.tar.gz"
  sha256 "a16f145a9f33443b8d821e595f30f414a5bcbf0c4fd641564aab6a46c96e43c4"

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
