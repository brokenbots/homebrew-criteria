class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.25/criteria-v0.5.25-darwin-arm64.tar.gz"
      sha256 "f914f7faa8150d9c358741ee8e8ad3be70f14d6625146bc7e62a6948a079b897"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.25/criteria-v0.5.25-linux-amd64.tar.gz"
      sha256 "497d385516bd54219fc88a5a8402b10489f469f1205d58df987f8fb35d02aec9"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.25/criteria-v0.5.25-linux-arm64.tar.gz"
      sha256 "47c10a0a4158bb4092c944d3c0512c3d8b6c8f8dae62d1d462dbebfafa3317b0"
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
