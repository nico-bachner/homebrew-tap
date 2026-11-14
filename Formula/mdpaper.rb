class Mdpaper < Formula
  desc "Markdown-to-PDF CLI with a bundled LaTeX engine"
  homepage "https://github.com/nico-bachner/projects/tree/main/packages/mdpaper"
  url "https://github.com/nico-bachner/projects/releases/download/mdpaper-v2.5.0/mdpaper-darwin-arm64.tar.gz"
  version "2.5.0"
  sha256 "0f876290744718687f6b2a73e14b2671913af8ada0cacaf20e13dc86ed7ca02f"
  license "MPL-2.0"

  head do
    url "https://github.com/nico-bachner/projects.git", branch: "main"
    depends_on "bun" => :build
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    if build.head?
      system "bun", "ci"
      system "bun", "run", "--cwd", "packages/mdpaper", "build"
      bin.install "packages/mdpaper/dist/mdpaper"
    else
      bin.install "mdpaper"
    end
  end

  test do
    assert_match "Usage: mdpaper build", shell_output("#{bin}/mdpaper --help")
  end
end
