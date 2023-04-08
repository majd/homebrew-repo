cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "291a1d187a22a848070e011228391645be1bb06fc26eecd47d5a940cc6bb295f"
    url "https://github.com/majd/ipatool/releases/download/v2.0.3/ipatool-2.0.3-macos-arm64.tar.gz"
    binary "bin/ipatool-2.0.3-macos-arm64", target: "ipatool"
  else
    sha256 "308e307ea6ab351908ab998f40744f3d52569f2b2d02aa3b14fd379562e66f9e"
    url "https://github.com/majd/ipatool/releases/download/v2.0.3/ipatool-2.0.3-macos-amd64.tar.gz"
    binary "bin/ipatool-2.0.3-macos-amd64", target: "ipatool"
  end

  version "2.0.3"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end