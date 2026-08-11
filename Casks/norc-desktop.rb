# Homebrew cask for the norc-desktop GUI (Tauri app, built from apps/desktop).
#
# ponytail: `version`/`sha256` are placeholders until the first tagged
# desktop release publishes a .dmg via GitHub Releases.
cask "norc-desktop" do
  version "0.0.1"
  sha256 "REPLACE_WITH_SHA256_AFTER_FIRST_RELEASE"

  url "https://github.com/redcoatasher/norc/releases/download/desktop-v#{version}/norc_#{version}_universal.dmg"
  name "norc"
  desc "GUI for norc's cron job scheduler"
  homepage "https://norc.app"

  app "norc.app"

  uninstall quit: "dev.norc.desktop"

  zap trash: [
    "~/Library/Application Support/dev.norc.desktop",
    "~/Library/Caches/dev.norc.desktop",
    "~/Library/Saved Application State/dev.norc.desktop.savedState",
  ]
end
