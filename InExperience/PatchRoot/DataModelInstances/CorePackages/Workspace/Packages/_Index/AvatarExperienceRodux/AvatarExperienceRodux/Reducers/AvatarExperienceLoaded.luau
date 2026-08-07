local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(avatarExperienceRodux.Parent.Rodux).createReducer(false, {
	[require(avatarExperienceRodux.Actions.AvatarExperienceLoaded).name] = function(_, _) --[[ line: 10 ]]
		return true
	end
})