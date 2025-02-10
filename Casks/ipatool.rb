cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "97a68ceef24681a0213871e015b1edb3ef941865764a3f2b95f3640d5ca2cc24"
    url "https://github.com/majd/ipatool/releases/download/v2.1.6/ipatool-2.1.6-macos-arm64.tar.gz"
    binary "bin/ipatool-2.1.6-macos-arm64", target: "ipatool"
  else
    sha256 "2e1c0890686b685e7b46c8997b9f00b392f3e9b2044673fe2472916b0232a050"
    url "https://github.com/majd/ipatool/releases/download/v2.1.6/ipatool-2.1.6-macos-amd64.tar.gz"
    binary "bin/ipatool-2.1.6-macos-amd64", target: "ipatool"
  end

  version "2.1.6"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end