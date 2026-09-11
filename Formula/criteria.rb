class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.20/criteria-v0.5.20-darwin-arm64.tar.gz"
      sha256 "bfd076868314a856ed23bf2a93bb0b39b0ab183cfb5d923a0a2476bc64922b01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.20/criteria-v0.5.20-linux-amd64.tar.gz"
      sha256 "28d51643139bef6a6aa8fbf1a531e0317a8d486d9e916612623a0dda2fa52f11"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.20/criteria-v0.5.20-linux-arm64.tar.gz"
      sha256 "422700ee5ca62bac8701da6e8e57c284ce442fce4f896ab5e7e0b8cc7d94632b"
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
