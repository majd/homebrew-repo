cask "ipatool" do
  version "1.1.3"
  sha256 "b8bc53b7584dfb50a1689bebcb9d691a8b23f0f948b53c89533bde1623dab5af"

  url "https://github.com/majd/ipatool/releases/download/v1.1.3/ipatool-macos-v1.1.3.zip"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  binary "ipatool"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end
