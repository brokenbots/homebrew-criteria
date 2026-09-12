class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.22/criteria-v0.5.22-darwin-arm64.tar.gz"
      sha256 "d25459e1f6638ecadfb4221e68e609bdef729d237bb4c8a3f4fcb7e20f20256c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.22/criteria-v0.5.22-linux-amd64.tar.gz"
      sha256 "8771ef6799b7e07e297ca8cca3113662a96111c96aae3e75b79581ebaf775698"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.22/criteria-v0.5.22-linux-arm64.tar.gz"
      sha256 "38119f2856db7ad38f86b20bb666c770479335ac4e031229a3e007d567529b9c"
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
