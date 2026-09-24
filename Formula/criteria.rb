class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.34/criteria-v0.5.34-darwin-arm64.tar.gz"
      sha256 "bddfa0b4925e5d73c69abc2188ada8e458311c52f08f08760547a3c6fff59b37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.34/criteria-v0.5.34-linux-amd64.tar.gz"
      sha256 "4da32a37954bddd996152b700bc7805fa8d1d8097e62be171f729d361d8a9c19"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.34/criteria-v0.5.34-linux-arm64.tar.gz"
      sha256 "323885737b98bb83b0a310f56b9acd1a9d1ff39962e14874303bafd80a48be5f"
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
