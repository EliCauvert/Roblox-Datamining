local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(avatarExperienceRodux.Parent.Rodux).createReducer(false, {
	[require(avatarExperienceRodux.Actions.AddSaveDelay).name] = function(_, _) --[[ line: 21 ]]
		return true
	end,
	[require(avatarExperienceRodux.Actions.RemoveSaveDelay).name] = function(_, _) --[[ line: 25 ]]
		return false
	end
})