class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.58/criteria-v0.5.58-darwin-arm64.tar.gz"
      sha256 "b0631fe32064fd6af2705d09e9807c894aedc4a0f5507ab6c4c67d1f2bcd2e9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.58/criteria-v0.5.58-linux-amd64.tar.gz"
      sha256 "77b4a68fa16cf5030859ffd749e30cfbb6c3dd4b749671bb21949676431d7a8b"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.58/criteria-v0.5.58-linux-arm64.tar.gz"
      sha256 "20cb62ba986ce65d720d27b7d8903a037ed1ba43ea73f2627f51fcb954c05350"
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
