require 'formula'

class WlCli < Formula
  desc "Unofficial Wunderlist CLI"
  homepage "https://github.com/robdimsdale/wl-cli"
  version "2.0.0-rc.2"
  url "https://github.com/robdimsdale/wl-cli/releases/download/v#{version}/wl-darwin-amd64-#{version}"
  sha256 "0cbe645f098fc5cd6466fe7f94e82dde35408b53d153c4b43e54059b5ab0a3a6"

  depends_on :arch => :x86_64

  def install
    mv "wl-#{version}-darwin-amd64", "wl"
    bin.install "wl"
  end

  test do
    system "#{bin}/wl"
  end
end
