local CorePackages = game:GetService("CorePackages")
task.spawn(function()
	-- upvalues: CorePackages (copy)
	require(CorePackages.Workspace.Packages.InExperienceOffers.prefetchOffersOnGameJoin)()
end)

return true