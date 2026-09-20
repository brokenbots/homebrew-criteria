class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.28/criteria-v0.5.28-darwin-arm64.tar.gz"
      sha256 "d148e921b00a23aadafd9dc24b52f2c915aa49b8b708c683d01ab525ba33274d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.28/criteria-v0.5.28-linux-amd64.tar.gz"
      sha256 "9659bf703578d5e4aa52bf904049baef371ed28ed5d683ea1438dd3ed198e3d8"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.28/criteria-v0.5.28-linux-arm64.tar.gz"
      sha256 "b6ca4006dd49792847be3dcbb2660c3979c76d3e84ab0d834d3cf7c5dd3f581c"
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
