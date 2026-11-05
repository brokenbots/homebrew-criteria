class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.57/criteria-v0.5.57-darwin-arm64.tar.gz"
      sha256 "9d8f39b7fb341eefcdc9f11c2f6c8b344049bdf06957d29dbf2b901402ed37e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.57/criteria-v0.5.57-linux-amd64.tar.gz"
      sha256 "9cd24848904ae110a5962cf24d88c67dba0ed67eb6b9ee588f636950f5172869"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.57/criteria-v0.5.57-linux-arm64.tar.gz"
      sha256 "6e5e6f8b7bb931ed8436b0a610a134f8bde625c1695d1b09c33be390ed17e0e4"
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
