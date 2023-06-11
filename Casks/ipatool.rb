cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "765be4cb074a1b6f215b564387b550a7fcc1401a361aab95802d93d87241e903"
    url "https://github.com/majd/ipatool/releases/download/v2.1.3/ipatool-2.1.3-macos-arm64.tar.gz"
    binary "bin/ipatool-2.1.3-macos-arm64", target: "ipatool"
  else
    sha256 "346a13321c9e45142fafb678ca4fcb174cfcf351884f4c49695815780f6041d0"
    url "https://github.com/majd/ipatool/releases/download/v2.1.3/ipatool-2.1.3-macos-amd64.tar.gz"
    binary "bin/ipatool-2.1.3-macos-amd64", target: "ipatool"
  end

  version "2.1.3"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end