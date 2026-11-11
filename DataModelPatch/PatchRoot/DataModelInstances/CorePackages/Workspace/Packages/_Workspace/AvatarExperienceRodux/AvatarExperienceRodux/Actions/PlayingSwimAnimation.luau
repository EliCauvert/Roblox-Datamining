return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(PlayingSwimAnimation)
	return { playingSwimAnimation = PlayingSwimAnimation }
end)