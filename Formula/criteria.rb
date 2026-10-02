class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.41/criteria-v0.5.41-darwin-arm64.tar.gz"
      sha256 "8058afd7dde01d8d4d21e01deb66f523613d9f29c38066f95864bb88f293708b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.41/criteria-v0.5.41-linux-amd64.tar.gz"
      sha256 "94181605ed310455b698c8ffc8af1463d215bb8c48b091fc4a3604151187b35b"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.41/criteria-v0.5.41-linux-arm64.tar.gz"
      sha256 "7ecd39d69b90b3b43155ff2dddf460781a0a18b7ad550e0b02ccf0cea3def6e6"
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
