local corePackagesService = game:GetService("CorePackages")

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then nil else require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { health = p1, maxHealth = p2 }
end)