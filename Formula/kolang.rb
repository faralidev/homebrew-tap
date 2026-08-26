# Homebrew Formula for Kolang (interpreter)
# Install with: brew install faralidev/tap/kolang
# Or: brew tap faralidev/tap && brew install kolang
#
# Uses a prebuilt binary from GitHub Releases — no build step.

class Kolang < Formula
  desc "Persian programming language interpreter"
  homepage "https://github.com/faralidev/kolang"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faralidev/kolang/releases/download/v0.0.1/kolang-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v0.0.1/kolang-darwin-amd64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang/releases/download/v0.0.1/kolang-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v0.0.1/kolang-linux-amd64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256"
    end
  end

  def install
    # The release archive may contain the binary either as `kolang` or
    # platform-qualified (e.g. `kolang-darwin-arm64`). Normalize to `kolang`.
    candidates = Dir["kolang*"].select { |f| File.file?(f) }
    odie "Could not find the kolang binary in the release archive" if candidates.empty?
    bin.install candidates.first => "kolang"
  end

  test do
    assert_equal "سلام\n", shell_output("#{bin}/kolang -c '«سلام» بنویس'")
  end
end