require 'formula'

class Wl < Formula
  desc "golang wunderlist client"
  homepage "https://github.com/robdimsdale/wl"
  version "1.2.4"
  url "https://github.com/robdimsdale/wl/archive/v#{version}.tar.gz"
  sha256 "171683552d044f0fe343aadb64467e07c1d086be78b33715a26dc1ecbf9be8c5"

  depends_on :arch => :x86_64

  def install
    mv "wl-darwin-amd64-#{version}", "wl"
    bin.install "wl"
  end

  test do
    system "#{bin}/wl"
  end
end
