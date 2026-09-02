class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.16/criteria-v0.5.16-darwin-arm64.tar.gz"
      sha256 "81a45530a7f044e4c66bcb13617401a1ae69d8885ae6f55a14799cf9722892ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.16/criteria-v0.5.16-linux-amd64.tar.gz"
      sha256 "49899478180c0708bed1dd799c8afa8d6b765414a1003d8ee2206a283fbcb8f9"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.16/criteria-v0.5.16-linux-arm64.tar.gz"
      sha256 "8858cb540d923b585405919bc22865d2b9f9f33bf3139ae3e5676fb972c272f6"
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
