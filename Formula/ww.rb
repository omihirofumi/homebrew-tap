class Ww < Formula
  desc "ww command"
  homepage "https://github.com/omihirofumi/ww"
  url "https://github.com/omihirofumi/ww/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "95db838c7fedff0539b04f8234c58e5afe8b98568fd939930b770e6c0d8ae186"
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
