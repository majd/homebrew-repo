cask "ipatool" do
  version "1.1.1"
  sha256 "7da9338fcc2ca8bece6fa6c5496e6e92bc54a2870c33534250e4d77351c33dd9"

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
