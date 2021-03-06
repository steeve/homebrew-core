class Xcbuild < Formula
  desc "Xcode-compatible build tool"
  homepage "https://github.com/facebook/xcbuild"
  url "https://github.com/facebook/xcbuild.git",
      :tag => "0.1.0",
      :revision => "08575f65f1c907e280ed4663b5461b7cfaf5cfaa"
  head "https://github.com/facebook/xcbuild.git", :shallow => false

  depends_on "cmake" => :build
  depends_on "libpng" => :build
  depends_on "pkg-config" => :build
  depends_on "ninja" => :run

  def install
    system "cmake", ".", "-G", "Ninja", *std_cmake_args
    system "ninja", "install"
    bin.install_symlink "#{prefix}/usr/bin/xcbuild"
  end

  test do
    system "#{bin}/xcbuild", "-showsdks"
  end
end
