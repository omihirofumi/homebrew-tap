class GhPreview < Formula
  desc "Review GitHub pull requests with Jujutsu and Helix"
  homepage "https://github.com/omihirofumi/pr-review"
  url "https://github.com/omihirofumi/pr-review/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "173afce26c8ea92c52666263b73ba5d948b5c74bf687b7915dd04864c5f7bb18"
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
