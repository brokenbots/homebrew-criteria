class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.56/criteria-v0.5.56-darwin-arm64.tar.gz"
      sha256 "753a05ae88da8d281e197d0180bbb68bf7b64d37e6ffb717f0d2f645b24cedb3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.56/criteria-v0.5.56-linux-amd64.tar.gz"
      sha256 "c20ecda39167136273f6d3f2e56ba922de6f73cbc1dffa2c05d17fbe181241d8"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.56/criteria-v0.5.56-linux-arm64.tar.gz"
      sha256 "253b17983bf62e612b5f5532291bb5fa476b7b189843cba35302cb05e6b95f1e"
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
