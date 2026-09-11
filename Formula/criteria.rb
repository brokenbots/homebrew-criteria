class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.19/criteria-v0.5.19-darwin-arm64.tar.gz"
      sha256 "e63b3c5f51f4877cd3b1908b468cd27f01026929d4aa6d4ba82a0e68759f0e49"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.19/criteria-v0.5.19-linux-amd64.tar.gz"
      sha256 "819c79edd2817a4f953b948ec7e3b8e15ce3b439ff89b7ba5746ae42bb750f5c"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.19/criteria-v0.5.19-linux-arm64.tar.gz"
      sha256 "59e07ceddaffa05e0b461e7738cc44a59c474c57f31569c0309358b3b0e544fa"
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
