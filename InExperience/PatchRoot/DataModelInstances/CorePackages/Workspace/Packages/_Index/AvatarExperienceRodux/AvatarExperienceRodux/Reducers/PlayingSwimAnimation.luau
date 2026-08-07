local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(avatarExperienceRodux.Parent.Rodux).createReducer(false, {
	[require(avatarExperienceRodux.Actions.PlayingSwimAnimation).name] = function(_, p0) --[[ line: 10 ]]
		return p0.playingSwimAnimation
	end
})