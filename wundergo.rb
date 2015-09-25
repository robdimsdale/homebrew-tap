require "language/go"

class Wundergo < Formula
  desc "golang wunderlist client"
  homepage "https://github.com/robdimsdale/wundergo"
  version "0.13.0"
  url "https://github.com/robdimsdale/wundergo/archive/v#{version}.tar.gz"
  sha256 "941e4bb7d17750bdece724c63cc090f9741b7f31d97fce4af631ef59fef5903b"

  depends_on "go" => :build

  go_resource "github.com/tools/godep" do
    url "https://github.com/tools/godep.git", :revision => "2c6ee5e071cf01a41359e33502b7fe79a5801b9e"
  end

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/robdimsdale/"
    ln_sf buildpath, buildpath/"src/github.com/robdimsdale/wundergo"
    Language::Go.stage_deps resources, buildpath/"src"

    cd "src/github.com/tools/godep" do
      system "go", "install"
    end

    system "./bin/godep", "go", "build", "-o", "wl", "-ldflags", "-X main.version=#{version}", "./cmd/wl/"
    bin.install "wl"
  end

  test do
    system "#{bin}/wl", "--version"
  end
end
