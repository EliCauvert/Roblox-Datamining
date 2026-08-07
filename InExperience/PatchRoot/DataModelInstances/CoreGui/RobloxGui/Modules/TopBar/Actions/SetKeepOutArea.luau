local corePackagesService = game:GetService("CorePackages")

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeKeepOutAreas then nil else require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p0, p1, p2) --[[ line: 11 ]]
	return { id = p0, position = p1, size = p2 }
end)