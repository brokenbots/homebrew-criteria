class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.50/criteria-v0.5.50-darwin-arm64.tar.gz"
      sha256 "3729229247b3c37a06bfcad4ba567cfe901d7928e4c71932ed921d6f0a8f4d3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.50/criteria-v0.5.50-linux-amd64.tar.gz"
      sha256 "8745493c9df30eef60f81224ecdec56365f46a3bc6d3a7ab8fbf53a7b8696cb5"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.50/criteria-v0.5.50-linux-arm64.tar.gz"
      sha256 "d9e0d571fffe867a61b7ad44477f47870f6ea402cd904adb7d22e8cacd68730c"
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
