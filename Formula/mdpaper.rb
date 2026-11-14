class Mdpaper < Formula
  desc "Markdown-to-PDF CLI with a bundled LaTeX engine"
  homepage "https://github.com/nico-bachner/projects/tree/main/packages/mdpaper"
  url "https://github.com/nico-bachner/projects/releases/download/mdpaper-v2.4.0/mdpaper-darwin-arm64.tar.gz"
  version "2.4.0"
  sha256 "225f738936f5c604a5b79fed6067325f66850d95fe648f55566c50af97834280"
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
