local corePackagesService = game:GetService("CorePackages")

return game:DefineFastFlag("TopBarDeprecateCoreGuiRodux2", false) and (require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar and (require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and require(corePackagesService.Workspace.Packages.Chrome).Enabled()))