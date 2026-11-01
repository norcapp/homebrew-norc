# Homebrew formula for the norc-cli headless job scheduler (norc-cli on npm).
class NorcCli < Formula
  desc "Headless cron job scheduler for norc"
  homepage "https://norc.app/cli"
  url "https://registry.npmjs.org/norc-cli/-/norc-cli-0.3.2.tgz"
  sha256 "7b372f4568385258a528e3b16817d65477ab8ca084f966c4187eddbbb36b0b17"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def post_install
    system bin/"norc", "service", "install"
    system bin/"norc", "__dupe-check"
  end

  def caveats
    <<~EOS
      Run `norc pair` to connect this machine to your norc account.

      Before running `brew uninstall norc-cli`, run `norc service uninstall`
      first — Homebrew formulas have no uninstall hook, so this won't happen
      automatically and a stale LaunchAgent would otherwise be left behind.
    EOS
  end

  test do
    system "#{bin}/norc", "--version"
  end
end
