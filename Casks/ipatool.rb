cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "2f03bbe36def30943597164865991197c1f585a8dd19781542031c76e9f5346f"
    url "https://github.com/majd/ipatool/releases/download/v2.6.0/ipatool-2.6.0-macos-arm64.tar.gz"
    binary "bin/ipatool-2.6.0-macos-arm64", target: "ipatool"
  else
    sha256 "6b9dcb890c9dad1961fd59827a1ac88687757a6f731a0079c00f443cd1a74e01"
    url "https://github.com/majd/ipatool/releases/download/v2.6.0/ipatool-2.6.0-macos-amd64.tar.gz"
    binary "bin/ipatool-2.6.0-macos-amd64", target: "ipatool"
  end

  version "2.6.0"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/bin/ipatool"],
        must_succeed: false
  end
end
