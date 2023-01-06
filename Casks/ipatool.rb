cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "95d179d691ec773773fbfa2a45101a5a527b4e93a067f3b69ec5fe62f93786c2"
    url "https://github.com/majd/ipatool/releases/download/v2.0.1/ipatool-2.0.1-macos-arm64.tar.gz"
    binary "bin/ipatool-2.0.1-macos-arm64", target: "ipatool"
  else
    sha256 "1dbd9fdf7497c5328749e08b6a6fdbdf8b85face6678f9d858eedbbb2c5aa4d7"
    url "https://github.com/majd/ipatool/releases/download/v2.0.1/ipatool-2.0.1-macos-amd64.tar.gz"
    binary "bin/ipatool-2.0.1-macos-amd64", target: "ipatool"
  end

  version "2.0.1"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end