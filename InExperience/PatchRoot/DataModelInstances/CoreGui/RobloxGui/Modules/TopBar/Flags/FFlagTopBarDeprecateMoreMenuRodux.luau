local corePackagesService = game:GetService("CorePackages")

return game:DefineFastFlag("TopBarDeprecateMoreMenuRodux2", false) and (require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and require(corePackagesService.Workspace.Packages.Chrome).Enabled())