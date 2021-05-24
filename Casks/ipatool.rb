cask "ipatool" do
  version "1.0.2"
  sha256 "da7a31c424c07083d33fed7b84e36b79c1854ebd4b04001f591e9b10d111425c"

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
