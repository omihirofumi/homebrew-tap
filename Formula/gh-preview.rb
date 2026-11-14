class GhPreview < Formula
  desc "Review GitHub pull requests with Jujutsu and Helix"
  homepage "https://github.com/omihirofumi/pr-review"
  url "https://github.com/omihirofumi/pr-review/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e8492f4c0ceb3c181b60fb4171f924fd50acf99b8fe9882ec5afa7831b1a344d"
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
    assert_match "gh-preview #{version}", shell_output("#{bin}/gh-preview --version")
    assert_match "PR URL or number", shell_output("#{bin}/gh-preview --help")
    assert_match "--agent", shell_output("#{bin}/gh-preview --help")
    assert_match "gh-preview/config.toml", shell_output("#{bin}/gh-preview --config-path")
    assert_match "gh-preview #{version}", shell_output("#{bin}/pr-review --version")
  end
end
