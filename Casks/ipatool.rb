cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "849c99c9d3a0289422445635916614eca4b13f0444c79f8b4b100ba9b6073d68"
    url "https://github.com/majd/ipatool/releases/download/v2.0.0/ipatool-2.0.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.0.0-macos-arm64", target: "ipatool"
  else
    sha256 "8169c467d6c78596e791ea91216d680f110219132cdc8b2f12aa602ae5989048"
    url "https://github.com/majd/ipatool/releases/download/v2.0.0/ipatool-2.0.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.0.0-macos-amd64", target: "ipatool"
  end

  version "2.0.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end