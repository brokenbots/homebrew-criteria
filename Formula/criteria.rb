class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.33/criteria-v0.5.33-darwin-arm64.tar.gz"
      sha256 "fe8d15cb5d60f5abd3e83355fc98c904d82c84897427262f6b7e96968e2d013a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.33/criteria-v0.5.33-linux-amd64.tar.gz"
      sha256 "85b135cb2122335f9549dc1c46215b08c54a2a9958bb2182323c8550bd167c13"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.33/criteria-v0.5.33-linux-arm64.tar.gz"
      sha256 "c102dfa901d679e6926456a42a8bf812d708b3575909a2447fc8107c408d0426"
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
