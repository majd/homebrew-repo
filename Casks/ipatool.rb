cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "c401b84245b74baaacd9532dc5c173a72316df82d365e44fc777c322ff8980e6"
    url "https://github.com/majd/ipatool/releases/download/v2.3.0-rc.1/ipatool-2.3.0-rc.1-macos-arm64.tar.gz"
    binary "bin/ipatool-2.3.0-rc.1-macos-arm64", target: "ipatool"
  else
    sha256 "628e94f0fce2cd73f026b797df2c6e8b0f017d340ae1a0a4431a64a5ff96d2c2"
    url "https://github.com/majd/ipatool/releases/download/v2.3.0-rc.1/ipatool-2.3.0-rc.1-macos-amd64.tar.gz"
    binary "bin/ipatool-2.3.0-rc.1-macos-amd64", target: "ipatool"
  end

  version "2.3.0-rc.1"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end