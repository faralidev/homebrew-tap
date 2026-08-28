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
      sha256 "add93f1093b075e594111c02fa519c588d0b5299cbd982a38205c693ce9b8187"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.1.1/kolang-linter-darwin-amd64.tar.gz"
      sha256 "c486263ccf6ccb9ab9787b02c610791854a0949ae795cbbc2a1598934f23544d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.1.1/kolang-linter-linux-arm64.tar.gz"
      sha256 "84b80dd35dd01adf63d4c5d37ed00f33e14262cd51155465f4445178207438fb"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.1.1/kolang-linter-linux-amd64.tar.gz"
      sha256 "c4b26adcd6b8dcde4d0209cef444954d4c38edd521c7282a2366211915b1b6b6"
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