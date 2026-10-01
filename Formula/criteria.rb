class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.38/criteria-v0.5.38-darwin-arm64.tar.gz"
      sha256 "f60de3bb48707886d411f630c1c24dfdff9ba3fdf2e3db5e16f629cbfeb102b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.38/criteria-v0.5.38-linux-amd64.tar.gz"
      sha256 "432e667cab9fade5e871455b84bb45d33df7a8e369c155b8339dd49267e2bf42"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.38/criteria-v0.5.38-linux-arm64.tar.gz"
      sha256 "e50b942076c2ab37fec6dad057e5c86db9b02239033208705d5a6ab3f476c819"
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
