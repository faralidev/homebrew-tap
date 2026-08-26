# Homebrew Formula for kolang-linter
# Install with: brew install faralidev/tap/kolang-linter
# Or: brew tap faralidev/tap && brew install kolang-linter

class KolangLinter < Formula
  desc "Standalone linter for the Kolang (كلنگ) Persian programming language"
  homepage "https://github.com/faralidev/kolang-linter"
  url "https://github.com/faralidev/kolang-linter/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "35a29e593fe1f5e1160996a34fe57d4e1ab942be29c357e56b24c8f382c95596"
  license "MIT"
  head "https://github.com/faralidev/kolang-linter.git", branch: "main"

  depends_on "go" => :build

  # kolang-linter depends on github.com/faralidev/kolang (a published Go module
  # fetched automatically by the Go toolchain — no extra Homebrew dep needed).

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    # Valid Kolang source yields an empty diagnostics array.
    assert_equal '{"diagnostics":[]}',
                 shell_output("#{bin}/kolang-linter -format json <<'KOLANG'\n«سلام» بنویس\nKOLANG").strip
  end
end
