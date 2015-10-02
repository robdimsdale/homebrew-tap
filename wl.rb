require "language/go"

class WL < Formula
  desc "golang wunderlist client"
  homepage "https://github.com/robdimsdale/wl"
  version "1.0.0"
  url "https://github.com/robdimsdale/wl/archive/v#{version}.tar.gz"
  sha256 "ed5cd2f9ead7b524491137a21bd1331c73029c064f0b4ab6508c2bcf762d9d25"

  depends_on "go" => :build

  go_resource "github.com/tools/godep" do
    url "https://github.com/tools/godep.git", :revision => "2c6ee5e071cf01a41359e33502b7fe79a5801b9e"
  end

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/robdimsdale/"
    ln_sf buildpath, buildpath/"src/github.com/robdimsdale/wl"
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