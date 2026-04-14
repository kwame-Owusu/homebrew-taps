class Ght < Formula
  desc "Get trending github repos the terminal"
  homepage "https://github.com/kwame-Owusu/ght"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-darwin-amd64"
      sha256 "b0c2963a0a736028d6cbae556ed1d72577d8f934fc4580b7a585db29d70c8841"
    else
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-darwin-arm64"
      sha256 "7fe2448c5ef1481adfa29066c6c234e1e37af6f54b8f48a04ba70b291cd5128a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-linux-amd64"
      sha256 "cb77e336f799f32777d606bd5e481671c391970a6f1214e970b464cf2c0cf00f"
    else
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-linux-arm64"
      sha256 "abfe17ff2306ad9f37025fa11f98e14ca61e2edc6bf65858a081e7057d025ece"
    end
  end

  def install
    # Install the downloaded binary as 'ght'
    bin.install "ght-darwin-amd64" => "ght" if OS.mac? && Hardware::CPU.intel?
    bin.install "ght-darwin-arm64" => "ght" if OS.mac? && Hardware::CPU.arm?
    bin.install "ght-linux-amd64" => "ght" if OS.linux? && Hardware::CPU.intel?
    bin.install "ght-linux-arm64" => "ght" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    # Simple test to check if the CLI runs
    system "#{bin}/ght", "--help"
  end
end
