class Finder < Formula
  desc "Fast, modern TUI file manager — sidebar, fuzzy finder, git integration"
  homepage "https://github.com/abhskyd/finder"
  version "0.1.1"
  license "MIT"

  # Apple Silicon: prebuilt binary — installs instantly, no toolchain.
  on_arm do
    url "https://github.com/abhskyd/finder/releases/download/v0.1.1/finder-aarch64-apple-darwin.tar.gz"
    sha256 "85a9cf085b1fd34c77648e0c6d1cfb7ed1502d26a6ec560e26172d8690f44f3f"
  end

  # Intel macs and Linux: build from source (Rust is a build dependency).
  on_intel do
    url "https://github.com/abhskyd/finder/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "94243b01f78a85d42ebac378a636d6a50d665c2335914e3ab909daa304b196cb"
    depends_on "rust" => :build
  end

  on_linux do
    url "https://github.com/abhskyd/finder/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "94243b01f78a85d42ebac378a636d6a50d665c2335914e3ab909daa304b196cb"
    depends_on "rust" => :build
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "finder"
    else
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end

  test do
    assert_match "finder #{version}", shell_output("#{bin}/finder --version")
  end
end
