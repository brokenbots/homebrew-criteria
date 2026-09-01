class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.15/criteria-v0.5.15-darwin-arm64.tar.gz"
      sha256 "b87bc3e4e5fa45c337bfa75c4b7ebb8c04037f6531fe0510f961d22a7c4b7ca7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.15/criteria-v0.5.15-linux-amd64.tar.gz"
      sha256 "42b1fbac38c8f74e948624773c77a1faf5a8295e132b0b397e40234994997ffd"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.15/criteria-v0.5.15-linux-arm64.tar.gz"
      sha256 "0cf57e6b934bb7504357c57e9dbb200c39fdb5623d2aff34cc57796cef7ab4c3"
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
