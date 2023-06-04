cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "62a78be8d00d82f02051fa00ee5e04994e9946a37ef8c41e6102aed7cd6a9855"
    url "https://github.com/majd/ipatool/releases/download/v2.1.2/ipatool-2.1.2-macos-arm64.tar.gz"
    binary "bin/ipatool-2.1.2-macos-arm64", target: "ipatool"
  else
    sha256 "6e0803280551cd881164084e21b34a3b3fb85880ed3a28ac497ad4e70939afa2"
    url "https://github.com/majd/ipatool/releases/download/v2.1.2/ipatool-2.1.2-macos-amd64.tar.gz"
    binary "bin/ipatool-2.1.2-macos-amd64", target: "ipatool"
  end

  version "2.1.2"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end