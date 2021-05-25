cask "ipatool" do
  version "1.0.3"
  sha256 "0caec00b7b62c36c2916b256d999e0c52ca45d5f18c38fbe800e3289523f6d97"

  url "https://github.com/majd/ipatool/releases/download/v#{version}/ipatool"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :el_capitan"

  binary "ipatool"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end
