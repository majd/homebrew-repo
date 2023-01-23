cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "a525fd055cec6e487fcfbd74a68988c650730ebc9e475cc7c27c20f171d2b8d3"
    url "https://github.com/majd/ipatool/releases/download/v2.0.2/ipatool-2.0.2-macos-arm64.tar.gz"
    binary "bin/ipatool-2.0.2-macos-arm64", target: "ipatool"
  else
    sha256 "dae96cd2a811d7b7cd6f0d85fefc198da2ad1bba6f1fc2f00c6e2d535a3dc9e8"
    url "https://github.com/majd/ipatool/releases/download/v2.0.2/ipatool-2.0.2-macos-amd64.tar.gz"
    binary "bin/ipatool-2.0.2-macos-amd64", target: "ipatool"
  end

  version "2.0.2"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end