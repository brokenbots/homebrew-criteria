class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.48/criteria-v0.5.48-darwin-arm64.tar.gz"
      sha256 "9bdc8cbcae38839d91d87063e47044ba746ea115bb2aa01b4e3a1dc82eef185d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.48/criteria-v0.5.48-linux-amd64.tar.gz"
      sha256 "18d250dc051cf73eba86f70dbea83a419f5acba679587f940fb4992116b47ee5"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.48/criteria-v0.5.48-linux-arm64.tar.gz"
      sha256 "ca3249b797f0e8d159b5b4fd4de41cf8cba3a43d2ed435ca783a1620b5489a11"
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
