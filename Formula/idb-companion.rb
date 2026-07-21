# Vendored mirror of Meta's facebook/fb/idb-companion formula.
#
# Why this exists: the simbeamd cask depends on idb_companion, but Homebrew will
# NOT auto-tap a third-party tap (facebook/fb) to satisfy a dependency — a fresh
# Mac failed with "This command requires the tap facebook/fb". By mirroring the
# formula into THIS tap (already tapped when the cask installs), the dependency
# `kei-sidorov/simbeam/idb-companion` resolves with no extra `brew tap`.
#
# Faithful copy of upstream: same prebuilt universal tarball, same pinned sha256,
# no source build. Keep url/sha256 in sync with facebook/fb on idb bumps.
# simbeam is pinned to idb 1.1.8 (see CLAUDE.md), so this rarely changes.
class IdbCompanion < Formula
  desc "Powerful Command-line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/releases/download/v1.1.8/idb-companion.universal.tar.gz"
  sha256 "3b72cc6a9a5b1a22a188205a84090d3a294347a846180efd755cf1a3c848e3e7"
  head "https://github.com/facebook/idb.git", branch: "main"

  depends_on xcode: ["13.0", :build]

  def install
    bin.install "bin/idb_companion"
    frameworks.install Dir["Frameworks/*"]
  end

  def post_install
    Dir
      .glob("#{frameworks}/**/*.dsym")
      .each do |shim|
      system "codesign", "--force", "--sign", "-", "--timestamp=none", shim
    end
  end
end
