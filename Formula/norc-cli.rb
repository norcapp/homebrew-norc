# Homebrew formula for the norc-cli headless job scheduler (norc-cli on npm).
class NorcCli < Formula
  desc "Headless cron job scheduler for norc"
  homepage "https://norc.app/cli"
  url "https://registry.npmjs.org/norc-cli/-/norc-cli-0.1.0.tgz"
  sha256 "500ebbd2d7173e1db9338a1100cbc6db1d64130cdd4069e0c87c6b7c13ce7ce6"
  # license: repo has no LICENSE file/field yet — add here once one exists.

  depends_on "node"

  def install
    system "npm", "install", *std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def post_install
    system bin/"norc", "service", "install"
    system bin/"norc", "__dupe-check"
  end

  def caveats
    <<~EOS
      norc-cli needs NORC_SUPABASE_URL and NORC_SUPABASE_ANON_KEY set before
      `norc login` / `norc pair` / the background service can reach your
      account. Run `norc pair` once after setting those to connect this
      machine.

      Before running `brew uninstall norc-cli`, run `norc service uninstall`
      first — Homebrew formulas have no uninstall hook, so this won't happen
      automatically and a stale LaunchAgent would otherwise be left behind.
    EOS
  end

  test do
    system "#{bin}/norc", "--version"
  end
end
