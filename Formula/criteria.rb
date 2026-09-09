class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.18/criteria-v0.5.18-darwin-arm64.tar.gz"
      sha256 "1dd38cf45eece3b771f5845337d7313fd52b471bb84fe79a51b3c7b078325ded"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.18/criteria-v0.5.18-linux-amd64.tar.gz"
      sha256 "c7da916569066492af7214178441f06cc36ab7d99f7e1bd05b118bd7bd977630"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.18/criteria-v0.5.18-linux-arm64.tar.gz"
      sha256 "92ef899d2258d7c16a222d7ed39708b09c705e89c4759ac4a34cbda43f8526cc"
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
