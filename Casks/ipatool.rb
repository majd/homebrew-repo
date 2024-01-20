cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "0f64e868c6ee0996c066262d9d652606a80ab78708e03460296f504bd6bb906f"
    url "https://github.com/majd/ipatool/releases/download/v2.1.4/ipatool-2.1.4-macos-arm64.tar.gz"
    binary "bin/ipatool-2.1.4-macos-arm64", target: "ipatool"
  else
    sha256 "657a8e53ddb5188418dfe5a55003d6703a5b6622f2d987544de1b28ee48502be"
    url "https://github.com/majd/ipatool/releases/download/v2.1.4/ipatool-2.1.4-macos-amd64.tar.gz"
    binary "bin/ipatool-2.1.4-macos-amd64", target: "ipatool"
  end

  version "2.1.4"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: ">= :catalina"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end