class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.11/criteria-v0.5.11-darwin-arm64.tar.gz"
      sha256 "0a3862a6d20f1d3bceab33ace1080716b54c9ed9f8698636b7cf88d198f7cc7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.11/criteria-v0.5.11-linux-amd64.tar.gz"
      sha256 "f7af8719a9363de963dac3ce2b342c03e31a2b5977f5e64531a16ecc8711503e"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.11/criteria-v0.5.11-linux-arm64.tar.gz"
      sha256 "a8f23a9ed0fd7cd7fc1264098fe47c294cea7250cc22262f2ce0902691af03be"
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
