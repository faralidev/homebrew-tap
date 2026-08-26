# Homebrew Formula for Kolang Linter
# Install with: brew install faralidev/tap/kolang-linter
# Or: brew tap faralidev/tap && brew install kolang-linter
#
# Uses a prebuilt binary from GitHub Releases — no build step.

class KolangLinter < Formula
  desc "Linter for the Persian Kolang programming language"
  homepage "https://github.com/faralidev/kolang-linter"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.0.1/kolang-linter-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.0.1/kolang-linter-darwin-amd64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.0.1/kolang-linter-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
    on_intel do
      url "https://github.com/faralidev/kolang-linter/releases/download/v0.0.1/kolang-linter-linux-amd64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
  end

  def install
    # The release archive may contain the binary either as `kolang-linter` or
    # platform-qualified (e.g. `kolang-linter-darwin-arm64`). Normalize to
    # `kolang-linter`.
    candidates = Dir["kolang-linter*"].select { |f| File.file?(f) }
    odie "Could not find the kolang-linter binary in the release archive" if candidates.empty?
    bin.install candidates.first => "kolang-linter"
  end

  test do
    (testpath/"t.kolang").write "«سلام» بنویس\n"
    assert_match "diagnostics", shell_output("#{bin}/kolang-linter t.kolang")
  end
end