# Homebrew cask for Microsoft Foundry DevPack.
#
# This is a thin cask: it installs the signed and notarized CLI plus Azure CLI.
# Provisioning remains an explicit second command so the installer can safely
# invoke Homebrew for azd after the outer cask installation has completed.
cask "devpack" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "69486170886cb45b9ea3ce120e72098f017f88da960a9979de9d0cfa3df9d0de",
         intel: "c8692af0baf9fc5924544e44760a16b47b4f3479d1055b879cbfc846d98390fd"

  url "https://github.com/microsoft/foundry-dev-tools/releases/download/devpack-installer-#{version}/foundry-devpack-osx-#{arch}.zip"
  name "Microsoft Foundry DevPack"
  desc "Tools for Microsoft Foundry development"
  homepage "https://github.com/microsoft/foundry-dev-tools"

  depends_on cask: "azure-cli"
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
