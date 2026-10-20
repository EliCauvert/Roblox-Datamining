return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.SetItemDetailsExpanded).name] = function(_, p1)
		return p1.itemDetailsExpanded
	end
})