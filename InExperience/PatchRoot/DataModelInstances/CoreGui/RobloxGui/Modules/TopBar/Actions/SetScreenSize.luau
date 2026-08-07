local corePackagesService = game:GetService("CorePackages")

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize then nil else require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 11 ]]
	return { screenSize = p0 }
end)