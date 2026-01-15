class Ww < Formula
  desc "ww command"
  homepage "https://github.com/omihirofumi/ww"
  url "https://github.com/omihirofumi/ww/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "338337d232b0bb4e78a51526838f7ad98fb845dd5064bce69c6c69172237bc26"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "-Dversion=#{version}"
    bin.install "zig-out/bin/ww"
  end

  test do
    system "#{bin}/ww"
  end
end
