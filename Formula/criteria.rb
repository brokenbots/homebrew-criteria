class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.40/criteria-v0.5.40-darwin-arm64.tar.gz"
      sha256 "8864fb53c2c36688dfbf7527a9faf18017bfd82e6db10096773ff7aa64017f75"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.40/criteria-v0.5.40-linux-amd64.tar.gz"
      sha256 "d9e698872f395309e92db0a6f0c11971332f0a2a66f42f93e1baa54187ded1e4"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.40/criteria-v0.5.40-linux-arm64.tar.gz"
      sha256 "3928c3afecaa8ca57a9a689c2fe2ac438269c4829ad93683f8808c02b1730f5d"
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
