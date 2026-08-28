# Homebrew Formula for Kolang Linter
# Install with: brew install faralidev/tap/kolang-linter
# Or: brew tap faralidev/tap && brew install kolang-linter
#
# Uses prebuilt binary archives (.tar.gz) from GitHub Releases — no build step.
# `livecheck` auto-detects the latest version; the bump workflow
# (kolang-linter/.github/workflows/release.yml) updates version+sha256 on each release.

class KolangLinter < Formula
  desc "Linter for the Persian Kolang programming language"
  homepage "https://github.com/faralidev/kolang-linter"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.1.1/kolang-linter-darwin-arm64.tar.gz"
      sha256 "411985353ce75dc3a0ec8eb423d4075bdd1ce15f379bd9a52efde8ad77ffbc7c"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.1.1/kolang-linter-darwin-amd64.tar.gz"
      sha256 "72f3c12cb551d7568cca1749ec6d9a6fe52907dc718fd2a9ab58a411a2ff214e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.1.1/kolang-linter-linux-arm64.tar.gz"
      sha256 "6e4fb213795cf1e83cf2e0c0eaf1a58d0fccdff145bcfcf7949738c11aa405c7"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.1.1/kolang-linter-linux-amd64.tar.gz"
      sha256 "b153c1c2a01a5983e28d138a4afdb4fced5923b86976e01e961e9b91201be9f1"
    end
  end

  # Auto-detect the latest version from GitHub releases.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    # The release publishes archives (.tar.gz) containing the top-level binary.
    # Homebrew auto-extracts the archive into the build directory.
    bin.install "kolang-linter"
  end

  test do
    (testpath/"t.kolang").write "«سلام» بنویس\n"
    assert_match "diagnostics", shell_output("#{bin}/kolang-linter t.kolang")
  end
end