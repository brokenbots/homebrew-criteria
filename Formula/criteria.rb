class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.9/criteria-v0.5.9-darwin-arm64.tar.gz"
      sha256 "601e34d98812635ab026810768ad63b39e0e9b22f06ee9cec1840390c27548c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.9/criteria-v0.5.9-linux-amd64.tar.gz"
      sha256 "636d15a288339a1108de0079a1784debe39920530e999a83c29439ee74f4c8c6"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.9/criteria-v0.5.9-linux-arm64.tar.gz"
      sha256 "3b650e2f856f608929aed0fde27d88fea3f4153ea7d4e9454b3250539b9e82fe"
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
