class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.52/criteria-v0.5.52-darwin-arm64.tar.gz"
      sha256 "d1b3f90df62307e70a9539820307e03e925f70f93bda1f9a4775d59b8881be51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.52/criteria-v0.5.52-linux-amd64.tar.gz"
      sha256 "8641e76b9bd3a8646197023e09f1985a9dc1c47e2c92dd0dfebb73f0b84ca931"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.52/criteria-v0.5.52-linux-arm64.tar.gz"
      sha256 "721080c15098eb99784302a5a0a40da883befcd88d214aaa3198ada29ae0a1e6"
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
