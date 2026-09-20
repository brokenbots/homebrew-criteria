class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.27/criteria-v0.5.27-darwin-arm64.tar.gz"
      sha256 "66e69dcfefa8add8881518983733e6f63da43251d9ff2f6f6cc79896b9bcc138"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.27/criteria-v0.5.27-linux-amd64.tar.gz"
      sha256 "a81e6e727ac20b96edf96445f00e96efbd0de716e8ab4a9100b27a88225462d0"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.27/criteria-v0.5.27-linux-arm64.tar.gz"
      sha256 "9e161f21d0fa22a2428c7ca5c6ba883b72f4e0409e82182a0d5212ac18b2977a"
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
