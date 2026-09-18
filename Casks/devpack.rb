# Homebrew cask for Microsoft Foundry DevPack.
#
# This is a thin cask: it installs the signed and notarized CLI plus Azure CLI.
# Provisioning remains an explicit second command so the installer can safely
# invoke Homebrew for azd after the outer cask installation has completed.
cask "devpack" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "6e30d3c2e0adff065f2a127c1a92adee1227f68b3cd676759a14a90ade7c7b72",
         intel: "bf00eb305792dd145842a48bdce799558e391acb6d5c1c05cfc13e2dd1a44aec"

  url "https://github.com/microsoft/foundry-dev-tools/releases/download/devpack-installer-#{version}/foundry-devpack-osx-#{arch}.zip"
  name "Microsoft Foundry DevPack"
  desc "Tools for Microsoft Foundry development"
  homepage "https://github.com/microsoft/foundry-dev-tools"

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
