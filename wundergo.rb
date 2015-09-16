class Wundergo < Formula
  desc "golang wunderlist client"
  homepage "https://github.com/robdimsdale/wundergo"
  version "0.8.0"
  url "https://github.com/robdimsdale/wundergo/releases/download/v#{version}/wl-darwin-amd64-#{version}"
  sha256 "07d9f1131f9d626ed9534e14cfe82b7796b117dcdd68347bb5686e3e250c613b"

  depends_on :arch => :x86_64

  def install
    bin.install "wl-darwin-amd64-#{version}"
    mv bin/"wl-darwin-amd64-#{version}", bin/"wl"
  end

  test do
    system "#{bin}/wl", "--version"
  end
end
