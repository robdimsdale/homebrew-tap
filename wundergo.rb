require "language/go"

class Wundergo < Formula
  desc "golang wunderlist client"
  homepage "https://github.com/robdimsdale/wundergo"
  version "0.9.3"
  url "https://github.com/robdimsdale/wundergo/archive/v#{version}.tar.gz"
  sha256 "de9e261b3e9b56020412ba3a6509f83fc11fd40309f64a2a038e23cc414e9867"

  depends_on "go" => :build

  go_resource "gopkg.in/yaml.v2" do
      url "https://gopkg.in/yaml.v2.git", :revision => "7ad95dd0798a40da1ccdff6dff35fd177b5edf40"
  end

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/robdimsdale/"
    ln_sf buildpath, buildpath/"src/github.com/robdimsdale/wundergo"
    Language::Go.stage_deps resources, buildpath/"src"

    system "go", "build", "-o", "wl", "-ldflags", "-X main.version=#{version}", "./cmd/wl/"
    bin.install "wl"
  end

  test do
    system "#{bin}/wl", "--version"
  end
end
