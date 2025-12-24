class Sintesi < Formula
  desc "Simple system info fetch utility"
  homepage "https://github.com/kwame-Owusu/sintesi"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/sintesi-darwin-amd64"
      sha256 "295f0098867fedd4714f6f248195e6d2341228284b110a6163204dc33f69f5aa"
    else
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/sintesi-darwin-arm64"
      sha256 "23523ed5371319febda44d5edd631c374ea7917937d8a811421b27db24f62703"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/sintesi/releases/download/v0.1.0/sintesi-linux-amd64"
      sha256 "3487aa6b7608a1f67d53cc1400cd27d05e8884a1ba22305266491f5d90f0eaf7"
    else
      url "https://github.com/kwame-Owusu/sintesi/releases/download/v0.1.0/sintesi-linux-arm64"
      sha256 "8a2aae861502e190a2b2272dcf4244804f9a505dcb7181eddc8e48583c052866"
    end
  end

  def install
    # Install the downloaded binary as 'sintesi'
    bin.install "sintesi-darwin-amd64" => "sintesi" if OS.mac? && Hardware::CPU.intel?
    bin.install "sintesi-darwin-arm64" => "sintesi" if OS.mac? && Hardware::CPU.arm?
    bin.install "sintesi-linux-amd64" => "sintesi" if OS.linux? && Hardware::CPU.intel?
    bin.install "sintesi-linux-arm64" => "sintesi" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    # Simple test to check if the CLI runs
    system "#{bin}/sintesi", "--version"
  end
end
