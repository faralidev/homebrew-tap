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
      sha256 "c48226471f3eddd17633bf69567aec640f036c176096a6321240a6b27a303cf0"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v0.1.1/kolang-darwin-amd64.tar.gz"
      sha256 "49e6eec8cb7804ee3dfd95447646056fed2386c038e99cd3467917a8db0fe387"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang/releases/download/v0.1.1/kolang-linux-arm64.tar.gz"
      sha256 "aa4cc006dd240367e917c2a3a62d2bdba2f0ebbd9fe55a64e12c9b2d769d6d87"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v0.1.1/kolang-linux-amd64.tar.gz"
      sha256 "4849768a89d1ddebab8f468c6f2a12576d03a2d7cc4c5143f0834cf4f841726e"
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