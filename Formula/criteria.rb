class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.12/criteria-v0.5.12-darwin-arm64.tar.gz"
      sha256 "55a1c83bd2eafc3c3a364a6ef65f5e15a877f6f2686e7dd3a957eea4172a9c7b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.12/criteria-v0.5.12-linux-amd64.tar.gz"
      sha256 "b4c93ca0229daa65b772e97a34b7a7647df0f6999af0b0d238c74956a0527418"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.12/criteria-v0.5.12-linux-arm64.tar.gz"
      sha256 "ce89cc5659f94d0dfded9ff7b0ac874dab8164cb18bd8d7f5f64d40d1029aa47"
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
