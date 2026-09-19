class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.26/criteria-v0.5.26-darwin-arm64.tar.gz"
      sha256 "11eb54ac409143267d4128ea291818bf695486f6cd048b850060aeac1b8e2d76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.26/criteria-v0.5.26-linux-amd64.tar.gz"
      sha256 "afef71f9f1ece4788bfd151417f096e8b37b55ed3ce8a1dcb7d84d3fae172f44"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.26/criteria-v0.5.26-linux-arm64.tar.gz"
      sha256 "547520c16e1aa2174d47ee35b29c5430fef2a9b28d3277f714da0580f19647a0"
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
