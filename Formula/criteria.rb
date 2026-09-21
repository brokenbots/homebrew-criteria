class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.30/criteria-v0.5.30-darwin-arm64.tar.gz"
      sha256 "f111edf8e0ba770b2c02a6e58feb0e87a80fab884390c0c47d8e919971eecfa6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.30/criteria-v0.5.30-linux-amd64.tar.gz"
      sha256 "e575379ef381c76688713817af9584aa79d4e6b3556a5bab84e9e9863a9ad2fb"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.30/criteria-v0.5.30-linux-arm64.tar.gz"
      sha256 "8e544528bed1dc1393fc3641c5252d5d01a5dfb8dbbd4bf34968aaaecec05952"
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
