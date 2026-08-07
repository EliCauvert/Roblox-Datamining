return require(script:FindFirstAncestor("VoiceChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 7 ]]
	return {
		universeId = p0,
		isPlaceEnabledForVoice = p1,
		isUniverseEnabledForVoice = p2,
		isVoiceEnabled = p3,
		isUniverseEnabledForAvatarVideo = p5,
		showVoiceOptInOverlay = p4,
		elegibleToSeeVoiceUpsell = p6
	}
end)