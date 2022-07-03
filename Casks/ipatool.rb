cask "ipatool" do
  version "1.1.4"
  sha256 "aeda77856305bfea52ad1fb0dc288d9c697ec37d9a400391020df80dc7beef10"

  url "https://github.com/majd/ipatool/releases/download/v1.1.4/ipatool-macos-v1.1.4.zip"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  binary "ipatool"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end
