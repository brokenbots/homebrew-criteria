class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.43/criteria-v0.5.43-darwin-arm64.tar.gz"
      sha256 "545f27283afba6452b2024dcd10e2a6cfcf8979a41737ae1b9fc55008fa27a3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.43/criteria-v0.5.43-linux-amd64.tar.gz"
      sha256 "99cdd7a8e12e13d4f7ebb0347cefaef24331bc62207af154d77699e5366e09ae"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.43/criteria-v0.5.43-linux-arm64.tar.gz"
      sha256 "f1c16b0acfc6a392a7c73610ca909322d307b0c4751be2b32efefacfe1683fec"
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
