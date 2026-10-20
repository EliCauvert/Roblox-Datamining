return require(game:GetService("CorePackages").Packages.Rodux).createReducer({}, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort).name] = function(_, p1)
		return p1.savedAccessories
	end
})