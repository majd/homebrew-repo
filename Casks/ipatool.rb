cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "ae8e59408f67cd35239a35ec22316b4446757599726e771e339c938ed09effc5"
    url "https://github.com/majd/ipatool/releases/download/v2.1.5/ipatool-2.1.5-macos-arm64.tar.gz"
    binary "bin/ipatool-2.1.5-macos-arm64", target: "ipatool"
  else
    sha256 "f6d880243be0beb111ecfbe8ade43e56cb3a64cf3434c0b88c807a8b8be6a35a"
    url "https://github.com/majd/ipatool/releases/download/v2.1.5/ipatool-2.1.5-macos-amd64.tar.gz"
    binary "bin/ipatool-2.1.5-macos-amd64", target: "ipatool"
  end

  version "2.1.5"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end