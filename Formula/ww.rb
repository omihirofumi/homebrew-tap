class Ww < Formula
  desc "ww command"
  homepage "https://github.com/omihirofumi/ww"
  url "https://github.com/omihirofumi/ww/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "6fd00e2b57d803af4b0b2050c2d9a274fad159498377ba019f95882164eadb21"
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
