class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.24/criteria-v0.5.24-darwin-arm64.tar.gz"
      sha256 "41bb6af5ccf53b89c6fcc03873736cd6dfe7c3a1fe287394ec623e20f3d673b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.24/criteria-v0.5.24-linux-amd64.tar.gz"
      sha256 "6880306f06732504c043e2a95da988d1af0b5f7b08d3104ac9ae8ca28caea80c"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.24/criteria-v0.5.24-linux-arm64.tar.gz"
      sha256 "1ab7a4fe0bb209335913817fb92afbff775204ee0466c5be2b5de26e4fdd677b"
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
