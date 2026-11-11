local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(AvatarExperienceRodux.Parent.Rodux).createReducer(nil, {
	[require(AvatarExperienceRodux.Actions.SetCurrentCharacter).name] = function(_, p1)
		return p1.currentCharacter
	end
})