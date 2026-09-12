class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.23/criteria-v0.5.23-darwin-arm64.tar.gz"
      sha256 "7a7b7052db2093611a0e448b5e38568f85e6e090d2764f8a71868d8d69b062db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.23/criteria-v0.5.23-linux-amd64.tar.gz"
      sha256 "4efc2f904b40d16c57d778be3d62c801c0dfe0e5ec2bc748508a7ba888fe693a"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.23/criteria-v0.5.23-linux-arm64.tar.gz"
      sha256 "c5bb4f3096de92780be8485760e9cccd0c72b9d833549b0cffe1840b8250f3cb"
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
