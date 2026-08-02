class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.7/criteria-v0.5.7-darwin-arm64.tar.gz"
      sha256 "bf091e09473dbc8d087406744e92284c7a2a31f8a9a2f54b4810942cd3dca208"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.7/criteria-v0.5.7-linux-amd64.tar.gz"
      sha256 "cee7e824612f098b59d342cf0549656810282d6f80bb583b5d1ac743d5d718fb"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.7/criteria-v0.5.7-linux-arm64.tar.gz"
      sha256 "3471e14311a7396217f40b572533d64d2d5f1ad2fc1dd939ff6a07c2e93e7601"
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
    list = shell_output("#{bin}/criteria adapter list")
    assert_match "noop", list
    assert_match "mcp", list
  end
end
