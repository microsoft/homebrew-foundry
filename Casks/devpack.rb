# Homebrew cask for Microsoft Foundry DevPack.
#
# This is a thin cask: it installs the signed and notarized CLI plus Azure CLI.
# Provisioning remains an explicit second command so the installer can safely
# invoke Homebrew for azd after the outer cask installation has completed.
cask "devpack" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "1c811e5ad1419b2eca86847eab1ab3c26794fa39d5cd6457725ec9f6909ee197",
         intel: "fce048bc6dd4755d615d17efb0792e10945a22afa57e468944a1ffd51b68fbd7"

  url "https://github.com/microsoft/foundry-toolkit/releases/download/devpack-installer-#{version}/foundry-devpack-osx-#{arch}.zip",
      verified: "github.com/microsoft/foundry-toolkit/"
  name "Microsoft Foundry DevPack"
  desc "Tools for Microsoft Foundry development"
  homepage "https://github.com/microsoft/foundry-toolkit"

  depends_on formula: "azure-cli"
  depends_on macos: :ventura

  binary "foundry-devpack"

  zap trash: "~/.local/state/foundry-devpack"

  caveats <<~EOS
    Finish setting up your Foundry development environment:

      foundry-devpack install

    This installs Azure Developer CLI (azd) and azd ai, then installs
    the Microsoft Foundry Skill, Foundry Toolkit for VS Code, and Foundry Canvas.
    Re-run it at any time to verify or repair your environment.
  EOS
end
