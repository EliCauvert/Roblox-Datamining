local corePackagesService = game:GetService("CorePackages")

return if require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then nil else require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { health = p0, maxHealth = p1 }
end)