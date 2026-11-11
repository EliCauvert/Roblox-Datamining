return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.SetPageLoaded).name] = function(_, p1)
		return p1.value
	end
})