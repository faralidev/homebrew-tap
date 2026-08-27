# Homebrew Formula for Kolang (interpreter)
# Install with: brew install faralidev/tap/kolang
# Or: brew tap faralidev/tap && brew install kolang
#
# Uses prebuilt binaries from GitHub Releases — no build step.
# `livecheck` auto-detects the latest version; the bump workflow
# (kolang/.github/workflows/release.yml) updates version+sha256 on each release.

class Kolang < Formula
  desc "Persian programming language interpreter"
  homepage "https://github.com/faralidev/kolang"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/faralidev/kolang/releases/download/v1.1.0/kolang-darwin-arm64"
      sha256 "1f9c014d0fd51fd46abe794afbaf77934b4e6f45a473d30491f24112cec50ba6"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v1.1.0/kolang-darwin-amd64"
      sha256 "c92bf7ce758f695408b313e2cdf6243c8289c96b0604de6dc4874d1562d3e54c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/faralidev/kolang/releases/download/v1.1.0/kolang-linux-arm64"
      sha256 "8cd10f1d50982aa0dd942115a6f9c78591c0973c8c97e3cf6a664c1eed449ead"
    end
    on_intel do
      url "https://github.com/faralidev/kolang/releases/download/v1.1.0/kolang-linux-amd64"
      sha256 "c26d67e25672708b358f2b27a53aee665453ddd080dbea344854385bd5e59136"
    end
  end

  # Auto-detect the latest version from GitHub releases.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    # The release publishes raw binaries (no archive). The downloaded file is
    # the binary itself, possibly named with platform suffix.
    candidates = Dir["kolang*"].select { |f| File.file?(f) }
    odie "Could not find the kolang binary in the release" if candidates.empty?
    bin.install candidates.first => "kolang"
  end

  test do
    assert_equal "سلام\n", shell_output("#{bin}/kolang -c '«سلام» بنویس'")
  end
end
