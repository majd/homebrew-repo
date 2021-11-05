cask "ipatool" do
  version "1.0.7"
  sha256 "45dddfb58e72fe9c16ca38cb6f0cd83271e9a330d87c0e603aa315248d8b50fe"

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
