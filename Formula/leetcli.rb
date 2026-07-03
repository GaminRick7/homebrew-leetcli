class Leetcli < Formula
  desc "Modern command-line tool for interacting with LeetCode"
  homepage "https://github.com/GaminRick7/leetcli"
  url "https://github.com/GaminRick7/leetcli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "61b649b4c0e42bc4963aaa4e4a1755b8b8ba632c5feb790f0f3533348df4e308"
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
