# Homebrew Cask for Kolang IDE
# Install with: brew install --cask faralidev/tap/kolang-ide
# Or: brew tap faralidev/tap && brew install --cask kolang-ide
#
# Prebuilt universal macOS dmg from GitHub Releases — no build step.
# `livecheck` auto-detects the latest version; the bump workflow
# (kolang-ide/.github/workflows/release.yml) updates version+sha256 on each release.

cask "kolang-ide" do
  version "0.1.2"
  sha256 "7b9df16e885f631b533669423f668784b4f36413264c0e9712734d702ef03da3"

  url "https://github.com/faralidev/kolang-ide/releases/download/v#{version}/kolang-ide_#{version}_universal.dmg"
  name "Kolang IDE"
  desc "Desktop editor for the Kolang Persian programming language"
  homepage "https://github.com/faralidev/kolang-ide"

  # Auto-detect the latest version from GitHub releases.
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  # Universal binary — works on both Apple Silicon and Intel Macs.
  app "kolang-ide.app"

  zap trash: [
    "~/Library/Application Support/kolang-ide",
    "~/Library/Preferences/com.faralidev.kolang-ide.plist",
    "~/Library/Saved Application State/com.faralidev.kolang-ide.savedState",
  ]
end
