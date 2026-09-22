class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.32/criteria-v0.5.32-darwin-arm64.tar.gz"
      sha256 "a8d684004bcd8cb642f67fa8b9326b740aabf2dda48d0d88aef5dc1673c7eef2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.32/criteria-v0.5.32-linux-amd64.tar.gz"
      sha256 "ec75c1fcbb732935c2110c8587e8670762d274f449eab3c7de33c91cf3d976e4"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.32/criteria-v0.5.32-linux-arm64.tar.gz"
      sha256 "e2de035dfec97f2b41febc54a44e1764945249900bedfdcea4613d2d37a5e0c7"
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
