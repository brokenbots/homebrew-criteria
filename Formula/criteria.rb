class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.47/criteria-v0.5.47-darwin-arm64.tar.gz"
      sha256 "c9e7f7faf9f3e1972663eda6778c310384d297ad921f640bb67b535e92d4703b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.47/criteria-v0.5.47-linux-amd64.tar.gz"
      sha256 "daf20cfe8b789f91b3fa0428078ae51c53932ca92c5943ea7d3dc12469458645"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.47/criteria-v0.5.47-linux-arm64.tar.gz"
      sha256 "8b72b0b93a08e1729a04be2e08a09f9b2ee3c7ec0ceb7fd9e66abd7568db7afc"
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
