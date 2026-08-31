cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "1b8bbf14e717ef6827a78e6dcb67bd096f3aa8ff9a13b433cd26ac0527640341"
    url "https://github.com/majd/ipatool/releases/download/v2.5.0/ipatool-2.5.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.5.0-macos-arm64", target: "ipatool"
  else
    sha256 "8d6c42230215e8a9dc939b537ae7bb2db75f5b3bec62a52b2c8bb1fe08d8d272"
    url "https://github.com/majd/ipatool/releases/download/v2.5.0/ipatool-2.5.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.5.0-macos-amd64", target: "ipatool"
  end

  version "2.5.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: :catalina

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end