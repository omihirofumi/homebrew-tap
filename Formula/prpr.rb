class Prpr < Formula
  desc "Review GitHub PRs and local Jujutsu changes"
  homepage "https://github.com/omihirofumi/prpr"
  url "https://github.com/omihirofumi/prpr/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "fe35d2091598f9462f5a03e0da3795f5965fbae474e5c404556b450e5b6ffbff"
  license "MIT"
  revision 1

  depends_on "rust" => :build

  link_overwrite "bin/prpr"

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "prpr #{version}", shell_output("#{bin}/prpr --version")
    assert_match "Usage: prpr", shell_output("#{bin}/prpr --help")
    assert_match "PR URL or number", shell_output("#{bin}/prpr --help")
    assert_match "--agent", shell_output("#{bin}/prpr --help")
    assert_match "--revision", shell_output("#{bin}/prpr diff --help")
    assert_match "--reply-to", shell_output("#{bin}/prpr session comment add --help")
    assert_match "prpr/config.toml", shell_output("#{bin}/prpr --config-path")
    assert_match "[keybindings]", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
  end
end
