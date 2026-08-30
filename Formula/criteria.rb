class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.10/criteria-v0.5.10-darwin-arm64.tar.gz"
      sha256 "cc50730125037ef4781ea77c85174e04c78c69e9f275e2434fe4764f8fb5d97e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.10/criteria-v0.5.10-linux-amd64.tar.gz"
      sha256 "8cff599108156b0d2462030188b4add985e419b7c69f59b65c7d90dcb7aa19e5"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.10/criteria-v0.5.10-linux-arm64.tar.gz"
      sha256 "f9dfd709e9ac0b5f5e5a2f8f02712287d98464e8f85ae5ded880543546572be2"
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
