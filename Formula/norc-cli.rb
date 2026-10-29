# Homebrew formula for the norc-cli headless job scheduler (norc-cli on npm).
class NorcCli < Formula
  desc "Headless cron job scheduler for norc"
  homepage "https://norc.app/cli"
  url "https://registry.npmjs.org/norc-cli/-/norc-cli-0.3.1.tgz"
  sha256 "140258c6cebfd9163b5649702a440fea9cce314866b28f82330baa956e8cbdea"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      Run `norc pair` to connect this machine to your norc account.

      The background service is opt-in and is not installed automatically.
      To run scheduled jobs in the background, run `norc service install`.

      If you enabled the service, run `norc service uninstall` before
      `brew uninstall norc-cli` — Homebrew formulas have no uninstall hook, so this won't happen
      automatically and a stale LaunchAgent would otherwise be left behind.
    EOS
  end

  test do
    system "#{bin}/norc", "--version"
  end
end
