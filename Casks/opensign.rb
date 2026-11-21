# Homebrew Cask for OpenSign
# Install with: brew install --cask faralidev/tap/opensign
# Or: brew tap faralidev/tap && brew install --cask opensign
#
# Prebuilt universal macOS DMG from the opensign-site GitHub Releases.
# The asset name is stable (OpenSign-macos.dmg) while the download URL is
# pinned to the release tag, so every version keeps its own checksum.
#
# The app is distributed ad-hoc signed (not notarized by Apple yet).
# Homebrew quarantines cask artifacts by default, and macOS reports
# quarantined ad-hoc apps as "damaged". The postflight below removes the
# quarantine flag so the app opens normally right after install — the
# equivalent of the one-time Terminal step described on the website.

cask "opensign" do
  version "1.0.0"
  sha256 "e69fc6059ec23c2275ab1b8e58a75d1cc747cf864d7cb4de9efadf9e46292d34"

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

  postflight do
    system_command "/usr/bin/touch", args: ["/tmp/postflight_ran"], sudo: false
    # Undo the default cask quarantine: macOS refuses to open quarantined
    # ad-hoc-signed apps ("damaged"). Safe: only strips an extended
    # attribute from the freshly installed app.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenSign.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.opensign.opensign",
    "~/Library/Preferences/dev.opensign.opensign.plist",
    "~/Library/Saved Application State/dev.opensign.opensign.savedState",
    "~/Library/Caches/dev.opensign.opensign",
    "~/Library/HTTPStorages/dev.opensign.opensign",
  ]
end
