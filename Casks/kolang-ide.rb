# Homebrew Cask for Kolang IDE
# Install with: brew install --cask faralidev/tap/kolang-ide
# Or: brew tap faralidev/tap && brew install --cask kolang-ide
#
# Prebuilt universal macOS dmg from GitHub Releases — no build step.
# NOTE: this file is auto-bumped by the kolang-ide update-cask.yml workflow.

cask "kolang-ide" do
  version "0.0.1"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"

  url "https://github.com/faralidev/kolang-ide/releases/download/v0.0.1/kolang-ide-0.0.1-universal.dmg"
  name "Kolang IDE"
  desc "Desktop editor for the Kolang Persian programming language"
  homepage "https://github.com/faralidev/kolang-ide"

  app "kolang-ide.app"
end