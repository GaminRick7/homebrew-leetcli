class Leetcli < Formula
  desc "Modern command-line tool for interacting with LeetCode"
  homepage "https://github.com/GaminRick7/leetcli"
  url "https://github.com/GaminRick7/leetcli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "ffa1c4f946e350d079dff1e2f853ce04268097ea57725435bb0ead3cff9740bb"
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
