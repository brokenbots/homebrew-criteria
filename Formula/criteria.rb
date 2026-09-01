class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.13/criteria-v0.5.13-darwin-arm64.tar.gz"
      sha256 "e71c7ccf5bbb9aab22a64caefd7ffbc0e79557b14fbdc5b307b16bfc0a86b599"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.13/criteria-v0.5.13-linux-amd64.tar.gz"
      sha256 "a26aca812eb4b29ae25f75bd8750320efb233f17ee96e4c209dd27398eb949c9"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.13/criteria-v0.5.13-linux-arm64.tar.gz"
      sha256 "6dc971f142f52e5f65f20576e0f4c88e1c27444b284c8f8ab167cdff7da36a48"
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
