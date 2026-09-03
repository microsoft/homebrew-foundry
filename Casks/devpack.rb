# Homebrew cask for Microsoft Foundry DevPack.
#
# This is a thin cask: it installs the signed and notarized CLI plus Azure CLI.
# Provisioning remains an explicit second command so the installer can safely
# invoke Homebrew for azd after the outer cask installation has completed.
cask "devpack" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "4a15de81eeb3e5d54c21ab97ee66e95b1e28684d88b9272528df83e663a3e260",
         intel: "90e0dcd0787d4f2106948f3437d6ece759bc572615e9a0491742f2772f65e8d6"

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
