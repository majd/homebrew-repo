cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "440a06010073de66296e0cc51387c4c8629f52608bfe2527e5fdd1293d27d3c3"
    url "https://github.com/majd/ipatool/releases/download/v2.3.0/ipatool-2.3.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.3.0-macos-arm64", target: "ipatool"
  else
    sha256 "e4386e117cb12e22b41f025b2cce35126a8eb33f4dc6dca6717cfb9d24cec069"
    url "https://github.com/majd/ipatool/releases/download/v2.3.0/ipatool-2.3.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.3.0-macos-amd64", target: "ipatool"
  end

  version "2.3.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end