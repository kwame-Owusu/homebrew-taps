class Lista < Formula
  desc "Your todo list on the terminal"
  homepage "https://github.com/kwame-Owusu/lista"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-darwin-amd64"
      sha256 "7b6abf39bd8b4c16ce0729ae2b5af488f094e97672d9c353b07620ed8f0f2e74"
    else
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-darwin-arm64"
      sha256 "79a261e2c016336ef54ad2b93dda1a155baeffe1d2cdd1ff83ccb8f3e7b1af69"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-linux-amd64"
      sha256 "bce8cafdc6884ca23e1559b605afcbb29428a78e853ed705ad06ce7d2e8fb62e"
    else
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-linux-arm64"
      sha256 "5fde84e9f7d0e70b463ffb62845424746fb7dfc9e54fb9cdaf4b152040f6d6c7"
    end
  end

  def install
    # Install the downloaded binary as 'lista'
    bin.install "lista-darwin-amd64" => "lista" if OS.mac? && Hardware::CPU.intel?
    bin.install "lista-darwin-arm64" => "lista" if OS.mac? && Hardware::CPU.arm?
    bin.install "lista-linux-amd64" => "lista" if OS.linux? && Hardware::CPU.intel?
    bin.install "lista-linux-arm64" => "lista" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    # Simple test to check if the CLI runs
    system "#{bin}/lista", "--version"
  end
end
