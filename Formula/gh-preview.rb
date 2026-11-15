class GhPreview < Formula
  desc "Review GitHub pull requests with Jujutsu and Helix"
  homepage "https://github.com/omihirofumi/pr-review"
  url "https://github.com/omihirofumi/pr-review/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ae5070002904cbd96655377a31b8de6e0f513d4143a0dbaff6d0afb14deb7d3b"
  license "MIT"

  depends_on "rust" => :build
  depends_on "gh"
  depends_on "git"
  depends_on "helix"
  depends_on "jj"

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    %w[prpr gh-preview pr-review].each do |command|
      assert_match "prpr #{version}", shell_output("#{bin}/#{command} --version")
    end
    assert_match "Usage: prpr", shell_output("#{bin}/prpr --help")
    assert_match "PR URL or number", shell_output("#{bin}/prpr --help")
    assert_match "--agent", shell_output("#{bin}/prpr --help")
    assert_match "gh-preview/config.toml", shell_output("#{bin}/prpr --config-path")
  end
end
