class Ww < Formula
  desc "ww command"
  homepage "https://github.com/omihirofumi/ww"
  url "https://github.com/omihirofumi/ww/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "92fde7849e5c6e44a74ba246ba36a78688d5c7eca9bf941eb9acc3efedd0af97"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe"
    bin.install "zig-out/bin/ww"
  end

  test do
    system "#{bin}/ww"
  end
end
