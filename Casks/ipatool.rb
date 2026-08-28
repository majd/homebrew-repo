cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "93bed6eaab47a8dfb0c1eb20860588bcfdf9f999dedcbe65938730aae68ee9d7"
    url "https://github.com/majd/ipatool/releases/download/v2.4.0/ipatool-2.4.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.4.0-macos-arm64", target: "ipatool"
  else
    sha256 "37efaab18f1a9bb69c9966afd0535c8c0e91db27d5dc0432d2fa67be213ea023"
    url "https://github.com/majd/ipatool/releases/download/v2.4.0/ipatool-2.4.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.4.0-macos-amd64", target: "ipatool"
  end

  version "2.4.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: :catalina

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end