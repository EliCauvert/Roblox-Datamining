local CorePackages = game:GetService("CorePackages")
task.spawn(function() --[[ Line: 8 ]]
	-- upvalues: CorePackages (copy)
	require(CorePackages.Workspace.Packages.InExperienceOffers.prefetchOffersOnGameJoin)()
end)

return true