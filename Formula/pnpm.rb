class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.4.8.tgz"
  sha256 "37f21833de8cd16b1289fa8ec755902676c99334fda6ed98caa83408499fa09e"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "13059e30f3c5860526da9500f4660525029258dc7f2638027711de1ef4af4eb8" => :catalina
    sha256 "9171af6e64b71e973350913b564c7b205b404a4647b6223cb6326e40c500126a" => :mojave
    sha256 "60e8e93adb290ead83f9bb6e033e4fd5ecff34ef0b4680d02a4a23e99294f62a" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
