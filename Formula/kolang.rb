# Homebrew Formula for Kolang (interpreter)
# Install with: brew install faralidev/tap/kolang
# Or: brew tap faralidev/tap && brew install kolang
#
# Uses prebuilt binary archives (.tar.gz) from GitHub Releases — no build step.
# `livecheck` auto-detects the latest version; the bump workflow
# (kolang/.github/workflows/release.yml) updates version+sha256 on each release.

class Kolang < Formula
  desc "Persian programming language interpreter"
  homepage "https://github.com/faralidev/kolang"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faralidev/kolang/releases/download/v0.1.1/kolang-darwin-arm64.tar.gz"
      sha256 "5767d4891898cb28130aa5ca4a88722b95c47ae35e18d39f7f44a6df3a9dcf86"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v0.1.1/kolang-darwin-amd64.tar.gz"
      sha256 "2982302bdcf856ca9420638a4472c7bff9afc126dce5e2cdf4a496049bf4529a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang/releases/download/v0.1.1/kolang-linux-arm64.tar.gz"
      sha256 "374f732735836a0d77b61a218c80f25e0bb2bd37ab10cbc6faec042af0c7b360"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v0.1.1/kolang-linux-amd64.tar.gz"
      sha256 "f6d6d94dcfff827eb751817a8d5b26f9382951687af90e33b14e3ce9c7dd465f"
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
    bin.install "kolang"
  end

  test do
    assert_equal "سلام\n", shell_output("#{bin}/kolang -c '«سلام» بنویس'")
  end
end