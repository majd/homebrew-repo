cask "ipatool" do
  version "1.1.2"
  sha256 "c9919bf415bf4b6e8f5bd34a890d28508d75b8947c4ed12067c7e1cf6442e8b6"

  url "https://github.com/majd/ipatool/releases/download/v1.1.2/ipatool-macos-v1.1.2.zip"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  binary "ipatool"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end
