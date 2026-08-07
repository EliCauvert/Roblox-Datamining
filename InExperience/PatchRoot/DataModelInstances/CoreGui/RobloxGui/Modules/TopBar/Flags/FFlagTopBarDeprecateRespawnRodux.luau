local corePackagesService = game:GetService("CorePackages")

return game:DefineFastFlag("TopBarDeprecateRespawnRodux2", false) and (require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and require(corePackagesService.Workspace.Packages.Chrome).Enabled())