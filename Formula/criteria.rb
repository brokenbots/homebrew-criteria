class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.29/criteria-v0.5.29-darwin-arm64.tar.gz"
      sha256 "522fd3c5c8293fafeac0c87b2441d458ee16043a15655cb9dfe5cdcadab7254b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.29/criteria-v0.5.29-linux-amd64.tar.gz"
      sha256 "624a8d66db0a36ff2eaa317d52d8aba5e38d6ac3f15295c5b5bc7d17f4fe5eca"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.29/criteria-v0.5.29-linux-arm64.tar.gz"
      sha256 "b7a575e043b04a2a86fb19f7c41c2b484ffd66aae06c707a83a5dd5538d5f99a"
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
