class Ght < Formula
  desc "Get trending github repos the terminal"
  homepage "https://github.com/kwame-Owusu/ght"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-darwin-amd64"
      sha256 "8cdc7e8c75e0fde7dfbfe5a331e9474007adab58959f94c221b2e8debce1eaee"
    else
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-darwin-arm64"
      sha256 "e79bb4b9934470de790de39404cd41b070227722d1df545e7bada453f0bf9e02"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-linux-amd64"
      sha256 "318b6ae796f8d38bad2962b12fe9617fc79cf716bc9ba9a57f4f83ad84399335"
    else
      url "https://github.com/kwame-Owusu/ght/releases/download/v0.1.0/ght-linux-arm64"
      sha256 "f6ea4e0b1ae3a500ac6990bf4754a6f774a0effce61f6d627f501f3f095de3ab"
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
