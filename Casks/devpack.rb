# Homebrew cask for Microsoft Foundry DevPack.
#
# This is a thin cask: it installs the signed and notarized CLI plus Azure CLI.
# Provisioning remains an explicit second command so the installer can safely
# invoke Homebrew for azd after the outer cask installation has completed.
cask "devpack" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "e7a14534a650a102b85e58caf41dfecfcbddf29921fdfab5f7f4f1539fafb43b",
         intel: "c559d399b7a68a90fe422abbc033c0e83fef911d7e91031ab29706da4acb242a"

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
