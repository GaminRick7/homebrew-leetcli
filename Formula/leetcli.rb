class Leetcli < Formula
  desc "Modern command-line tool for interacting with LeetCode"
  homepage "https://github.com/GaminRick7/leetcli"
  url "https://github.com/GaminRick7/leetcli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "6e33b0953a1a79c364428c76742b5bf1ad2e9279c51fb7d767734e702c7917c2"
  license "MIT"
  head "https://github.com/GaminRick7/leetcli.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "cpr"
  depends_on "ftxui"
  depends_on "nlohmann-json"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/leetcli"
  end

  test do
    assert_match "LeetCode CLI Tool", shell_output("#{bin}/leetcli help")
  end
end
