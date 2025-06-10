cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "097907caab3bdb6e0d2f5ba60998487eceef532abfc4c95101a70b00b6ebeece"
    url "https://github.com/majd/ipatool/releases/download/v2.2.0/ipatool-2.2.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.2.0-macos-arm64", target: "ipatool"
  else
    sha256 "a76397f60146167913aa01433c6255f708cb9e87bf49a45075fb9b5d54d944d6"
    url "https://github.com/majd/ipatool/releases/download/v2.2.0/ipatool-2.2.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.2.0-macos-amd64", target: "ipatool"
  end

  version "2.2.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end