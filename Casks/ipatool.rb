cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "7c5a35a532de21240fcd0d5a4f3204c97dcb4b1e43df05b2487ad12378c0c044"
    url "https://github.com/majd/ipatool/releases/download/v2.3.2/ipatool-2.3.2-macos-arm64.tar.gz"
    binary "bin/ipatool-2.3.2-macos-arm64", target: "ipatool"
  else
    sha256 "d1861a0e00ae78ca1982530b7732b3e105dc789eed99a767b4038b6b9473424e"
    url "https://github.com/majd/ipatool/releases/download/v2.3.2/ipatool-2.3.2-macos-amd64.tar.gz"
    binary "bin/ipatool-2.3.2-macos-amd64", target: "ipatool"
  end

  version "2.3.2"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: :catalina

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end