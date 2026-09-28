class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.35/criteria-v0.5.35-darwin-arm64.tar.gz"
      sha256 "fdd81c98f64f8acd0b4b190d662c479502c222bcfcb13c89f3274c13f80b2ac0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.35/criteria-v0.5.35-linux-amd64.tar.gz"
      sha256 "2a4ff0380fb9db6ff5bc5ef1684a091a59289abbd628181aee50ce4225779281"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.35/criteria-v0.5.35-linux-arm64.tar.gz"
      sha256 "9fc2e56b390b481f98e89315d8612b8fdfcb215656d4d1382261d11ff6dae011"
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
