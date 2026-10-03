class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.42/criteria-v0.5.42-darwin-arm64.tar.gz"
      sha256 "84a9c93c33fde1568bab16ccf66c18b26728a53fbe0c5503918c5d7e2490a281"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.42/criteria-v0.5.42-linux-amd64.tar.gz"
      sha256 "13dc3b8b5604d85c1551da9783a3304c00a2f671c0f79a3cebbeff4353275411"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.42/criteria-v0.5.42-linux-arm64.tar.gz"
      sha256 "18291a788e109144e19802c19ce5161d5ebd9a7dad103a030def07cbffde49ba"
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
