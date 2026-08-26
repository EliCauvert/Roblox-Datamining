local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(avatarExperienceRodux.Parent.Rodux).createReducer(nil, {
	[require(avatarExperienceRodux.Actions.SetCurrentCharacter).name] = function(_, p1)
		return p1.currentCharacter
	end
})