local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(avatarExperienceRodux.Parent.Rodux).createReducer(false, {
	[require(avatarExperienceRodux.Actions.PlayingSwimAnimation).name] = function(_, p1)
		return p1.playingSwimAnimation
	end
})