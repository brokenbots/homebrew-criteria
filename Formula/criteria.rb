class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.44/criteria-v0.5.44-darwin-arm64.tar.gz"
      sha256 "34cf5a176d291e14049815c8f5c78df6df228049ddcca26ff046ec8aefac1e23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.44/criteria-v0.5.44-linux-amd64.tar.gz"
      sha256 "b670a7d5c4d5f85d27701e563916bbb01403c6618b6897e67064e06cf2e3546c"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.44/criteria-v0.5.44-linux-arm64.tar.gz"
      sha256 "b787e5b23c3488df9dc93f116f21b3b600abb33214800ae2b15861829e2da21f"
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
