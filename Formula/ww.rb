class Ww < Formula
  desc "ww command"
  homepage "https://github.com/omihirofumi/ww"
  url "https://github.com/omihirofumi/ww/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "1174fbf72caeac7e834bae37eabee39b8651bc199a7e94c84fdf459148cbaa8b"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "-Dversion=0.11.0"
    bin.install "zig-out/bin/ww"
  end

  test do
    system "#{bin}/ww"
  end
end
