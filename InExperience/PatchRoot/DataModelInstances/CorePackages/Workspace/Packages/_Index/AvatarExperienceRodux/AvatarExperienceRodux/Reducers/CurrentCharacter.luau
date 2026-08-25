local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(avatarExperienceRodux.Parent.Rodux).createReducer(nil, {
	[require(avatarExperienceRodux.Actions.SetCurrentCharacter).name] = function(_, p0)
		return p0.currentCharacter
	end
})