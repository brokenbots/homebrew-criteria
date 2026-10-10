class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.46/criteria-v0.5.46-darwin-arm64.tar.gz"
      sha256 "acc50ab0cf908e267ec8eb02ab3818bef103b9680ffc790ba1a5fadc91a3d57b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.46/criteria-v0.5.46-linux-amd64.tar.gz"
      sha256 "46e4834e74668b98db6e597e2de724ebcef60fb850b32585ceef865f411751d5"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.46/criteria-v0.5.46-linux-arm64.tar.gz"
      sha256 "de30aa291eda409850f3bd19553c41acd8a9a6b2c906f41c5320b70200f823f8"
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
