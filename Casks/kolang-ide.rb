# Homebrew Cask for Kolang IDE
# Install with: brew install --cask faralidev/tap/kolang-ide
# Or: brew tap faralidev/tap && brew install --cask kolang-ide
#
# Prebuilt universal macOS dmg from GitHub Releases — no build step.
# `livecheck` auto-detects the latest version; the bump workflow
# (kolang-ide/.github/workflows/release.yml) updates version+sha256 on each release.

cask "kolang-ide" do
  version "0.1.2"
  sha256 "1eb98d84615bdad06adcec02fb7cd084d4e57209e22776eee0f216da2a679be2"

  url "https://github.com/faralidev/kolang-ide/releases/download/v0.1.2/kolang-ide-0.1.2-universal.dmg"
  name "Kolang IDE"
  desc "Desktop editor for the Kolang Persian programming language"
  homepage "https://github.com/faralidev/kolang-ide"

  # Auto-detect the latest version from GitHub releases.
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  app "kolang-ide.app"

  zap trash: [
    "~/Library/Application Support/kolang-ide",
    "~/Library/Preferences/com.faralidev.kolang-ide.plist",
    "~/Library/Saved Application State/com.faralidev.kolang-ide.savedState",
  ]
end
