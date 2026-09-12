class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.21/criteria-v0.5.21-darwin-arm64.tar.gz"
      sha256 "2bfd3cfa3e4b0bf6817ac72b0a040ba8f43fe55e0870f70e2d360f457aa09746"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.21/criteria-v0.5.21-linux-amd64.tar.gz"
      sha256 "1c820db7712dd0478a4ea125d7811305690a01bd4a163f9937b4bbbfb22e8c44"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.21/criteria-v0.5.21-linux-arm64.tar.gz"
      sha256 "33a810b4b85ea7cc6a77f014335a3582baaa21728bf09a1f18de78e5061ca789"
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
