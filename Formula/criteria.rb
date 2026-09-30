class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.36/criteria-v0.5.36-darwin-arm64.tar.gz"
      sha256 "ce217c3a9c0df351dc15aee35076bba287710dfa6f885d139e708430f7d1f04c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.36/criteria-v0.5.36-linux-amd64.tar.gz"
      sha256 "06b71efb83358969d6468ede71615cd0902981333b976fef6175d9ef6c017291"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.36/criteria-v0.5.36-linux-arm64.tar.gz"
      sha256 "9ba91b89265b9c22f69f4e6e3f8f8a1bdb4f0f444e822c17a9e0cd04a05d3531"
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
