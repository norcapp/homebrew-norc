# Homebrew cask for the norc-desktop GUI (Tauri app, built from apps/desktop).
#
# Releases live in norcapp/norc-desktop (tag v<version>). The dmg is Apple Silicon only.
cask "norc-desktop" do
  version "0.3.0"
  sha256 "f326cebc2825c3a48e17e1078c37ba235a4ece7e375f63107b5800e894ce8928"

  url "https://github.com/norcapp/norc-desktop/releases/download/v#{version}/norc_#{version}_aarch64.dmg"
  name "norc"
  desc "GUI for norc's cron job scheduler"
  homepage "https://norc.app/"

  depends_on arch: :arm64
  depends_on :macos

  app "norc.app"

  uninstall quit: "dev.norc.desktop"

  zap trash: [
    "~/Library/Application Support/dev.norc.desktop",
    "~/Library/Caches/dev.norc.desktop",
    "~/Library/Saved Application State/dev.norc.desktop.savedState",
  ]
end
