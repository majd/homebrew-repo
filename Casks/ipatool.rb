cask "ipatool" do
  version "1.0.4"
  sha256 "c9f55a36fee2e9df024d7d2ba01293f62340616f77279d929e43a350a78ee002"

  url "https://github.com/majd/ipatool/releases/download/v#{version}/ipatool-v#{version}.zip"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :el_capitan"

  binary "ipatool"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end
