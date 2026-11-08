cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "7c8477d92ba2b686de3234048beb9126e4774cfa36fd43b4c14ec389b8a13a84"
    url "https://github.com/majd/ipatool/releases/download/v2.8.0/ipatool-2.8.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.8.0-macos-arm64", target: "ipatool"
  else
    sha256 "4e5e0b9b54a041a4c9fc90de6f8f69a36bda9c5a69a772ecc1a577c1dcb237cc"
    url "https://github.com/majd/ipatool/releases/download/v2.8.0/ipatool-2.8.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.8.0-macos-amd64", target: "ipatool"
  end

  version "2.8.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/bin/ipatool"],
        must_succeed: false
  end
end
