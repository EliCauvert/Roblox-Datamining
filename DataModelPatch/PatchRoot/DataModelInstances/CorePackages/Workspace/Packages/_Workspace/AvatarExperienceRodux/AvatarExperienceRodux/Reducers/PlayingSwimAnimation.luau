local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")

return require(AvatarExperienceRodux.Parent.Rodux).createReducer(false, {
	[require(AvatarExperienceRodux.Actions.PlayingSwimAnimation).name] = function(_, p1)
		return p1.playingSwimAnimation
	end
})