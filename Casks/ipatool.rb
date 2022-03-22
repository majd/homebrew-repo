cask "ipatool" do
  version "1.1.0"
  sha256 "2f024aebfe6ba035eadbaac89ddf6f9373313b1cc99af7a2818e06fa63d136f5"

  url "https://github.com/majd/ipatool/releases/download/v#{version}/ipatool-v#{version}.zip"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  binary "ipatool"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end
