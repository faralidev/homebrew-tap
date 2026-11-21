# Homebrew Cask for OpenSign
# Install with: brew install --cask faralidev/tap/opensign
# Or: brew tap faralidev/tap && brew install --cask opensign
#
# Prebuilt universal macOS DMG from the opensign-site GitHub Releases.
# The asset name is stable (OpenSign-macos.dmg) while the download URL is
# pinned to the release tag, so every version keeps its own checksum.

cask "opensign" do
  version "1.0.0"
  sha256 "86e354579b892195b2415de22ac05f8c58700326802dc17002b10d730bff6432"

  url "https://github.com/faralidev/opensign-site/releases/download/v#{version}/OpenSign-macos.dmg"
  name "OpenSign"
  desc "Sign PDFs with your Japanese My Number Card — legally binding, fully local"
  homepage "https://faralidev.github.io/opensign-site/"

  # Auto-detect the latest version from the opensign-site release tags.
  livecheck do
    url "https://github.com/faralidev/opensign-site/releases/latest"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  # Universal binary — works on both Apple Silicon and Intel Macs.
  app "OpenSign.app"

  zap trash: [
    "~/Library/Application Support/dev.opensign.opensign",
    "~/Library/Preferences/dev.opensign.opensign.plist",
    "~/Library/Saved Application State/dev.opensign.opensign.savedState",
    "~/Library/Caches/dev.opensign.opensign",
    "~/Library/HTTPStorages/dev.opensign.opensign",
  ]
end
