class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.17/criteria-v0.5.17-darwin-arm64.tar.gz"
      sha256 "d816706658cf95422dead9341b7e8003a0566d0bed6765f373d093411c365ae1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.17/criteria-v0.5.17-linux-amd64.tar.gz"
      sha256 "f9a196b6208a81e1e43f2de70c5418ed888cf35b3c9f1ed9181d5ffb56f16f63"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.17/criteria-v0.5.17-linux-arm64.tar.gz"
      sha256 "6c462b09adf5dac84b842b8841c9d9318a1e5071360a4f5e40f85e834325a05c"
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
