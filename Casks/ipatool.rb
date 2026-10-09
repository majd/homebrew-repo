cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "5ae100d4520cf4b3f4374239e5925a9ad9a8dc02abc16bae27479e7ae99aca33"
    url "https://github.com/majd/ipatool/releases/download/v2.7.0/ipatool-2.7.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.7.0-macos-arm64", target: "ipatool"
  else
    sha256 "05f48994d8b3cfefe7ea1172a0ac0b28715888e9df0af38cf3e490d2ed592263"
    url "https://github.com/majd/ipatool/releases/download/v2.7.0/ipatool-2.7.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.7.0-macos-amd64", target: "ipatool"
  end

  version "2.7.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/bin/ipatool"],
        must_succeed: false
  end
end
