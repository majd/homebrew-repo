cask "ipatool" do
  if Hardware::CPU.arm?
    sha256 "f2e58e9d3ece196654e7b9dfcc2748cfdfbee4c5009c7f3d840640d8a1136500"
    url "https://github.com/majd/ipatool/releases/download/v2.3.1/ipatool-2.3.1-macos-arm64.tar.gz"
    binary "bin/ipatool-2.3.1-macos-arm64", target: "ipatool"
  else
    sha256 "43a4b0206af94fab2e4a4bf344ff16ac3825b6c733692fcfc0cfd81af93d9df3"
    url "https://github.com/majd/ipatool/releases/download/v2.3.1/ipatool-2.3.1-macos-amd64.tar.gz"
    binary "bin/ipatool-2.3.1-macos-amd64", target: "ipatool"
  end

  version "2.3.1"
  name "IPATool"
  desc "CLI tool for searching and downloading iOS app packages from the App Store"
  homepage "https://github.com/majd/ipatool"

  depends_on macos: :catalina

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{HOMEBREW_PREFIX}/bin/ipatool"
  end
end