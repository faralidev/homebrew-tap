class Kolang < Formula
  desc "Persian programming language interpreter"
  homepage "https://github.com/faralidev/kolang"
  url "https://github.com/faralidev/kolang/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e638d7fe76b1555cedc7a471e40d46e0c50a8ddf10af91a7e110c6faa908611a"
  license "MIT"
  head "https://github.com/faralidev/kolang.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kolang"
  end

  test do
    assert_equal "سلام\n", shell_output("#{bin}/kolang -c '«سلام» بنویس'")
  end
end
