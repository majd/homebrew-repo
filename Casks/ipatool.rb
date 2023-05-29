cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "29685e08cd708531a96c53e727b09a5a8bb6d41265e0bb3702962bf39e5106e6"
    url "https://github.com/majd/ipatool/releases/download/v2.1.1/ipatool-2.1.1-macos-arm64.tar.gz"
    binary "bin/ipatool-2.1.1-macos-arm64", target: "ipatool"
  else
    sha256 "3c460690ca4f15d25f6429e638107db3e3dd092f59ada683c79169765cd78a57"
    url "https://github.com/majd/ipatool/releases/download/v2.1.1/ipatool-2.1.1-macos-amd64.tar.gz"
    binary "bin/ipatool-2.1.1-macos-amd64", target: "ipatool"
  end

  version "2.1.1"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end