class Bgpdump < Formula
  desc "C library for analyzing MRT/Zebra/Quagga dump files"
  homepage "https://bitbucket.org/ripencc/bgpdump/wiki/Home"
  url "https://bitbucket.org/ripencc/bgpdump/get/1.5.0.tar.gz"
  sha256 "47534112b427b8107ae0fd52437927de25f5cfe0ef98eba6e08df441ae5f05c5"

  bottle do
    cellar :any
    rebuild 1
    sha256 "27ef23842184d3cb46d4bb2eb7abf30f1dcf68a4fbaa62656f3e13270dd10b6d" => :sierra
    sha256 "ce0c5b17609eb9276ee41ef5cd3298df8444920c4a0003a08a1edd2f4e2a61a7" => :el_capitan
    sha256 "f5c658fb75abcd49d2fafd0e1fb88d3b79496d0d3db091e4f17c321c4b2a4df4" => :yosemite
    sha256 "ebf2b2434f98b507c23bb1987c3a2a02f82f43c185d2d27757bfd5741a11d729" => :mavericks
  end

  depends_on "autoconf" => :build

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end

  test do
    system "#{bin}/bgpdump", "-T"
  end
end
