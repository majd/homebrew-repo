cask "ipatool" do
  version "1.0.6"
  sha256 "1cf6d3390783e10b0d8f17170ca014219c62818893faeacc24f328db4144873b"

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
