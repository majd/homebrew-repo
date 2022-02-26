class ClassDump < Formula
  desc "CLI tool for examining the Objective-C runtime information in Mach-O files"
  homepage "http://stevenygard.com/projects/class-dump/"
  url "https://github.com/nygard/class-dump/archive/2c82b4ff12b2ea5d1ac23e49281d496997370841.tar.gz"
  version "3.5"
  sha256 "1a5ce4d9de3065422b1158ce27b3fdff91ac86d7d62522a9098f8867e82cce00"
  head "https://github.com/nygard/class-dump.git", branch: "master"

  depends_on xcode: :build
  depends_on macos: :yosemite

  def install
    inreplace "Source/CDLCBuildVersion.m", /PLATFORM_IOSMAC/, "PLATFORM_MACCATALYST"
    xcodebuild "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}", "ONLY_ACTIVE_ARCH=YES"
    bin.install "build/Release/class-dump"
  end

  test do
    system "#{bin}/class-dump", "--help"
  end
end
