cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "2bbd722033bbedfc00e98b9b7329c9e0c699d9ba083221672af5ef8c84bea2a1"
    url "https://github.com/majd/ipatool/releases/download/v2.1.0/ipatool-2.1.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.1.0-macos-arm64", target: "ipatool"
  else
    sha256 "137766a59e3b1b0dc287ded4049377f0a3f1f9ef95a4524bba5d1a96d7922771"
    url "https://github.com/majd/ipatool/releases/download/v2.1.0/ipatool-2.1.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.1.0-macos-amd64", target: "ipatool"
  end

  version "2.1.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end