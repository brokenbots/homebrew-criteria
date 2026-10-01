class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.37/criteria-v0.5.37-darwin-arm64.tar.gz"
      sha256 "c3a52af980f339620ba29dc558c3c95628267726e01a9742468385ddc4cbff79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.37/criteria-v0.5.37-linux-amd64.tar.gz"
      sha256 "cd6620b1aa008e814d6a27c2fec79497a37bb24d83cf2e6e47d77e1dda7742e4"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.37/criteria-v0.5.37-linux-arm64.tar.gz"
      sha256 "d37a81fb2d9f808a889fa557ab518a52ee1e5108931b28e1423560e106591581"
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
