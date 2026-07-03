class Leetcli < Formula
  desc "Modern command-line tool for interacting with LeetCode"
  homepage "https://github.com/GaminRick7/leetcli"
  url "https://github.com/GaminRick7/leetcli/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "34f1d4e245f09b1eb8e558a9bd38528bc49c19587b11e5245f6fd65a578dcb08"
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
    assert_match "Usage", shell_output("#{bin}/leetcli help")
  end
end
