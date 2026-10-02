class Finder < Formula
  desc "Fast, modern TUI file manager — sidebar, fuzzy finder, git integration"
  homepage "https://github.com/abhskyd/finder"
  url "https://github.com/abhskyd/finder/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a8aad4c8f2a07aa6a00c73b2dac99c37897ae9065f84aebaef05740d3b6b00ae"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "finder #{version}", shell_output("#{bin}/finder --version")
  end
end
