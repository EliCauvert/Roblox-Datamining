local corePackagesService = game:GetService("CorePackages")

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen then nil else require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 9 ]]
	return { menuOpen = p0 }
end)