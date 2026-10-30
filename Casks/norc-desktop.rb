# Homebrew cask for the norc-desktop GUI (Tauri app, built from apps/desktop).
#
# Releases live in norcapp/norc-desktop (tag v<version>). The dmg is Apple Silicon only.
cask "norc-desktop" do
  version "0.3.1"
  sha256 "c2ec08881603535b1195132d2a5aee8cea4b0d1d29f57917452313241e4efd93"

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
