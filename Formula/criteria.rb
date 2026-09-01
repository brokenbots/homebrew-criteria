class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.14/criteria-v0.5.14-darwin-arm64.tar.gz"
      sha256 "58b11f1410da7a9f192b2f3acb0af3028a3441b79b2bd388dbeb3cffba2be5ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.14/criteria-v0.5.14-linux-amd64.tar.gz"
      sha256 "f28c448d5b659047a2ba1101e469bf3f6bfab8587c9a69a1cb569a0ad0209510"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.14/criteria-v0.5.14-linux-arm64.tar.gz"
      sha256 "968fd289980213c33ac427a7f56841586020f383d6b89fb47eee898386a6dfef"
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
