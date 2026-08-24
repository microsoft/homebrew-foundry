# Homebrew cask for Microsoft Foundry DevPack.
#
# This is a thin cask: it installs the signed and notarized CLI plus Azure CLI.
# Provisioning remains an explicit second command so the installer can safely
# invoke Homebrew for azd after the outer cask installation has completed.
cask "devpack" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "0968144b7267b40512e3aaef84dea17b609f9b54f090bd799359ba457b9c14a3",
         intel: "6a4d23bdd2264443850f13af7812d508bbc4a117ed396d9ac97d9998cd64fdd4"

  url "https://github.com/microsoft/foundry-toolkit/releases/download/devpack-installer-#{version}/foundry-devpack-osx-#{arch}.zip"
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
