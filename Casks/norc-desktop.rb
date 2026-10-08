# Homebrew cask for the norc-desktop GUI (Tauri app, built from apps/desktop).
#
# Releases live in norcapp/norc-desktop (tag v<version>). The dmg is Apple Silicon only.
cask "norc-desktop" do
  version "0.2.2"
  sha256 "7db0f0bfc63be49213f7c537422ed940c5409de062ec857bf21882f94c4f10fd"

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
