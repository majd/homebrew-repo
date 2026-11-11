cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "3ad673375ea6bc479df0340df03950c3f6669ab554466b05e4bb99b3369d0dd2"
    url "https://github.com/majd/ipatool/releases/download/v2.8.1/ipatool-2.8.1-macos-arm64.tar.gz"
    binary "bin/ipatool-2.8.1-macos-arm64", target: "ipatool"
  else
    sha256 "8d1d93c1f72724cec01e72dab30ecb8eb3faf4c783f71d2310c2db3c7976efbb"
    url "https://github.com/majd/ipatool/releases/download/v2.8.1/ipatool-2.8.1-macos-amd64.tar.gz"
    binary "bin/ipatool-2.8.1-macos-amd64", target: "ipatool"
  end

  version "2.8.1"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/bin/ipatool"],
        must_succeed: false
  end
end
