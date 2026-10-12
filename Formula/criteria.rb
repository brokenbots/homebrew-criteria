class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.51/criteria-v0.5.51-darwin-arm64.tar.gz"
      sha256 "d036cce3f3719b62581b90ff1340f028b9dbda61ad3d06cefb571d951f44dee9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.51/criteria-v0.5.51-linux-amd64.tar.gz"
      sha256 "1d22df30611ac507fcc0b0dff8cb2be6e021bb7f5a50546f29025aa1b406a0c8"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.51/criteria-v0.5.51-linux-arm64.tar.gz"
      sha256 "ce737fe142119a64150b46992e6cbd13a8176747952d66ed242447c1d71f35e8"
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
