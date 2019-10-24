class Fileicon < Formula
  desc "macOS CLI for managing custom icons for files and folders"
  homepage "https://github.com/mklement0/fileicon"
  url "https://github.com/mklement0/fileicon/archive/v0.2.2.tar.gz"
  sha256 "1725a6a693b3586617b0fc669719a15c05eb7f8e535daee511a315d9b6fc0eb3"

  def install
    bin.install "bin/fileicon"
    man1.install "man/fileicon.1"
  end

  test do
    stdout = shell_output "#{bin}/fileicon --version"
    assert_match /fileicon v#{version}/, stdout
  end
end
