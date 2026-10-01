class Criteria < Formula
  desc "Standalone workflow execution engine"
  homepage "https://github.com/brokenbots/criteria"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.39/criteria-v0.5.39-darwin-arm64.tar.gz"
      sha256 "708221e5365f652c7f279813668857e7e4d49479de72df6a85b4d648d0edddff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.39/criteria-v0.5.39-linux-amd64.tar.gz"
      sha256 "d9463039401ef75c8bb8b81610913a287ca17811c84d729b4cca5528b3e66bcf"
    end
    on_arm do
      url "https://github.com/brokenbots/criteria/releases/download/v0.5.39/criteria-v0.5.39-linux-arm64.tar.gz"
      sha256 "a4eb623b83d47bd72cda40c2fd772dfb742c7562d6eb6ef59a03a17b3bc52efa"
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
