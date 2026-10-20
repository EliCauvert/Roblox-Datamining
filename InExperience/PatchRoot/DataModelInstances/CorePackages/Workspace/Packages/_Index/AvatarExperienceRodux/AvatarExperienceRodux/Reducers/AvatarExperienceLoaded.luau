local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(AvatarExperienceRodux.Parent.Rodux).createReducer(false, {
	[require(AvatarExperienceRodux.Actions.AvatarExperienceLoaded).name] = function(_, _): boolean
		return true
	end
})