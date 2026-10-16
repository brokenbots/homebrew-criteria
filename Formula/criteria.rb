class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.54/criteria-v0.5.54-darwin-arm64.tar.gz"
      sha256 "4133febf0b40e5c829eae5848ca0fda072954f5b4fe25b6e64ff3ffe5d6a8d7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.54/criteria-v0.5.54-linux-amd64.tar.gz"
      sha256 "94e0c858654f5b87dd4eec93e65da9e9b88436c6d24424d90d7b826f1a9c2864"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.54/criteria-v0.5.54-linux-arm64.tar.gz"
      sha256 "55ad830644a86af8d7397e91ae11610ace0d950d3c5c7df7ececdcd84800af9f"
    end
  end

  def install
    libexec.mkpath
    adapters = libexec/"adapters"
    adapters.mkpath

    libexec.install "criteria"
    adapters.install Dir["criteria-adapter-*"]
    libexec.install "LICENSE"
    libexec.install "README.md"

    (bin/"criteria").write_env_script libexec/"criteria", CRITERIA_ADAPTERS: adapters
  end

  test do
    system "#{bin}/criteria", "--help"
  end
end
