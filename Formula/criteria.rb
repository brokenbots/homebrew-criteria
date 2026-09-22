class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.31/criteria-v0.5.31-darwin-arm64.tar.gz"
      sha256 "55f9615d4c4f229e22433bf900a0a0c829ec33df7282dc7aafb3316c04991569"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.31/criteria-v0.5.31-linux-amd64.tar.gz"
      sha256 "142d7f1b17b7df53a1ae2d5b51c4589b7d1a0a1b3298448cc0470289a5bf3f11"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.31/criteria-v0.5.31-linux-arm64.tar.gz"
      sha256 "62d63adcd5a51fee76b2e101850a9ae43b311ff50dfeac4a7dd8dc9d91037c4c"
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
