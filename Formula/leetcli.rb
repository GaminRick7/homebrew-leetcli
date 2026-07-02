class Leetcli < Formula
  desc "Modern command-line tool for interacting with LeetCode"
  homepage "https://github.com/GaminRick7/leetcli"
  url "https://github.com/GaminRick7/leetcli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8a1293d939153455f2e1b60df341fbfd115c23d43ddf63f69a757184e76a69b5"
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
    assert_match "Usage", shell_output("#{bin}/leetcli 2>&1", 1)
  end
end
