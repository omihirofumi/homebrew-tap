class Prpr < Formula
  desc "Review GitHub PRs and local Jujutsu changes"
  homepage "https://github.com/omihirofumi/prpr"
  url "https://github.com/omihirofumi/prpr/archive/refs/tags/v0.26.1.tar.gz"
  sha256 "fb6cd47fe62b63e79a316bc8641f236b8a7ad0b4283f9974188cd9ca046793df"
  license "MIT"

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
    assert_match "Show AI Guide", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "--start-column", shell_output("#{bin}/prpr session mark add --help")
    assert_match "Reload the review", shell_output("#{bin}/prpr session --help")
    assert_match "ai_review", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "toggle_split", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "toggle_chat", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "Check out the PR in this repository", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "--watch", shell_output("#{bin}/prpr diff --help")
    assert_match "--notes", shell_output("#{bin}/prpr diff --help")
    assert_match "toggle_wrap", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "stop_ai", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "search_next", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "file_picker", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "Next change", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
    assert_match "reply_thread", shell_output("#{bin}/prpr --config /dev/null --print-keybindings")
  end
end
