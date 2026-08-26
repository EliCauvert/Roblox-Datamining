local corePackagesService = game:GetService("CorePackages")

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeKeepOutAreas then nil else require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { id = p1 }
end)