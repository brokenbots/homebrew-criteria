class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.55/criteria-v0.5.55-darwin-arm64.tar.gz"
      sha256 "b9c9f556a51f3b85b73504cb8b410aff013ddbabcf8d891050061a5c9bf252f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.55/criteria-v0.5.55-linux-amd64.tar.gz"
      sha256 "63f82746f42eddf4f5b0c3ec1450653e4a269d95a1432fbea330cd4d9a3cf2f3"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.55/criteria-v0.5.55-linux-arm64.tar.gz"
      sha256 "264698b4c6250c820322e550526bf6b3c3926447f9aba4b3b166ed4bdafd3bc7"
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
