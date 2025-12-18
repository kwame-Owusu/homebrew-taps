class Lista < Formula
  desc "Your todo list on the terminal"
  homepage "https://github.com/kwame-Owusu/lista"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-darwin-amd64"
      sha256 "5b4212b3b196b4c72b4e3fced7a1cd6fe1028b96ed53ba5a8e061da7b302f209"
    else
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-darwin-arm64"
      sha256 "dc18a236af3ce776ba091a6053a8ad3dac1fdc2ed681292a9f79658273cf7946"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-linux-amd64"
      sha256 "b8a536567e2338875a8af577b1426aacb07422f6c886396b88664837ff5595bf"
    else
      url "https://github.com/kwame-Owusu/lista/releases/download/v0.1.0/lista-linux-arm64"
      sha256 "6b9b01b3cfede6944bf0593aa6d817c780ed34a32d49898278b63b052ff931aa"
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
