local Modules = game:GetService("CoreGui").RobloxGui.Modules

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(Modules.AvatarExperience.LayeredClothingSort.Actions.LockCharacterUpdates).name] = function(_, _): boolean
		return true
	end,
	[require(Modules.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates).name] = function(_, _): boolean
		return false
	end
})