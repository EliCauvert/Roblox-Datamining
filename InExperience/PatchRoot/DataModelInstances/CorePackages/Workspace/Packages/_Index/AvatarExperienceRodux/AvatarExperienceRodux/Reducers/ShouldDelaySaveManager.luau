local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(AvatarExperienceRodux.Parent.Rodux).createReducer(false, {
	[require(AvatarExperienceRodux.Actions.AddSaveDelay).name] = function(_, _): boolean --[[ Line: 21 ]]
		return true
	end,
	[require(AvatarExperienceRodux.Actions.RemoveSaveDelay).name] = function(_, _): boolean --[[ Line: 25 ]]
		return false
	end
})