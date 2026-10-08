# Homebrew cask for the norc-desktop GUI (Tauri app, built from apps/desktop).
#
# Releases live in norcapp/norc-desktop (tag v<version>). The dmg is Apple Silicon only.
cask "norc-desktop" do
  version "0.2.1"
  sha256 "eff7c60761d32e31597355b9258effeaa5735beda83cb2affe05f28bd68a4c41"

  url "https://github.com/norcapp/norc-desktop/releases/download/v#{version}/norc_#{version}_aarch64.dmg"
  name "norc"
  desc "GUI for norc's cron job scheduler"
  homepage "https://norc.app"

  depends_on arch: :arm64

  app "norc.app"

  uninstall quit: "dev.norc.desktop"

  zap trash: [
    "~/Library/Application Support/dev.norc.desktop",
    "~/Library/Caches/dev.norc.desktop",
    "~/Library/Saved Application State/dev.norc.desktop.savedState",
  ]
end
