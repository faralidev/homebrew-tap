# Homebrew Formula for Kolang Linter
# Install with: brew install faralidev/tap/kolang-linter
# Or: brew tap faralidev/tap && brew install kolang-linter
#
# Uses prebuilt binaries from GitHub Releases — no build step.
# `livecheck` auto-detects the latest version; the bump workflow
# (kolang-linter/.github/workflows/release.yml) updates version+sha256 on each release.

class KolangLinter < Formula
  desc "Linter for the Persian Kolang programming language"
  homepage "https://github.com/faralidev/kolang-linter"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faralidev/kolang-linter/releases/download/v1.0.0/kolang-linter-darwin-arm64"
      sha256 "0b3cd5fd954cdf8b700123233ec3f6fe8d8f56f2a6f4d844440669d03ee45339"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v1.0.0/kolang-linter-darwin-amd64"
      sha256 "cc5f1b19431a6b20f717023b7ecb9c32c68d9d744177b0ec1a835010407a26bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang-linter/releases/download/v1.0.0/kolang-linter-linux-arm64"
      sha256 "1219f46525c462290340f66a777b03ba5cb1b1f3c379781fa16179e258ebf5e3"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v1.0.0/kolang-linter-linux-amd64"
      sha256 "7bcf707ae8365674be9a8aed38a01effbb328d058ba6539196d136c71a8833d6"
    end
  end

  # Auto-detect the latest version from GitHub releases.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    candidates = Dir["kolang-linter*"].select { |f| File.file?(f) }
    odie "Could not find the kolang-linter binary in the release" if candidates.empty?
    bin.install candidates.first => "kolang-linter"
  end

  test do
    (testpath/"t.kolang").write "«سلام» بنویس\n"
    assert_match "diagnostics", shell_output("#{bin}/kolang-linter t.kolang")
  end
end
