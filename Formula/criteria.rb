class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.53/criteria-v0.5.53-darwin-arm64.tar.gz"
      sha256 "8a4eed37b041737022f7ec8c5644f72e9ba939d683d4f30413d623d065229d3f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.53/criteria-v0.5.53-linux-amd64.tar.gz"
      sha256 "765f66d420e5bb80a2b6309dc5d5586651fb0311fe34d4398aafd6d98880c3a5"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.53/criteria-v0.5.53-linux-arm64.tar.gz"
      sha256 "4b2fe659494d80b8933ff84c041f84654a389b66c5b957876b7a563f7afc993f"
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
