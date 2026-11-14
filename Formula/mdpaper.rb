class Mdpaper < Formula
  desc "Markdown-to-PDF CLI with a bundled LaTeX engine"
  homepage "https://github.com/nico-bachner/projects/tree/main/packages/mdpaper"
  url "https://github.com/nico-bachner/projects/releases/download/mdpaper-v2.2.0/mdpaper-darwin-arm64.tar.gz"
  version "2.2.0"
  sha256 "71cb4d00119ca805cea9c4d2c52f34d43c566a53be6322f2eb28085647a05a7e"
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
