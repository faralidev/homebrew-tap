cask "kolang-ide" do
  version "0.1.0"
  sha256 "87d677ff50da9f8bdbaeb09cb0421adae1aa17152649f01980f0151a1e9f185c"

  url "https://github.com/faralidev/kolang-ide/releases/download/v#{version}/kolang-ide-#{version}-universal.dmg"
  name "Kolang IDE"
  desc "Desktop IDE for the Kolang Persian programming language"
  homepage "https://github.com/faralidev/kolang-ide"

  # Universal binary — works on both Apple Silicon and Intel Macs.
  app "kolang-ide.app"

  # The kolang interpreter + linter are bundled inside the app, so no extra
  # brew dependencies are needed to run Kolang programs.

  caveats do
    <<~EOS
      kolang-ide is currently UNSIGNED. On first launch, macOS Gatekeeper
      will block it. To open:
        1. Right-click kolang-ide.app → "Open"
        2. Confirm "Open" in the dialog
      This is a one-time step per install.
    EOS
  end

  zap trash: [
    "~/Library/Application Support/kolang-ide",
    "~/Library/Preferences/ir.kolang.ide.plist",
    "~/Library/Saved Application State/ir.kolang.ide.savedState",
  ]
end
