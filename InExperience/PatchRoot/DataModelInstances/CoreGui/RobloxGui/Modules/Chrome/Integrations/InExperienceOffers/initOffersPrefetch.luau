local corePackagesService = game:GetService("CorePackages")
task.spawn(function()
	-- upvalues: corePackagesService (ref)
	require(corePackagesService.Workspace.Packages.InExperienceOffers.prefetchOffersOnGameJoin)()
end)

return true