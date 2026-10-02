class Finder < Formula
  desc "Fast, modern TUI file manager — sidebar, fuzzy finder, git integration"
  homepage "https://github.com/abhskyd/finder"
  url "https://github.com/abhskyd/finder/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "94243b01f78a85d42ebac378a636d6a50d665c2335914e3ab909daa304b196cb"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "finder #{version}", shell_output("#{bin}/finder --version")
  end
end
