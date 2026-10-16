return require(script:FindFirstAncestor("VoiceChat").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, IsPlaceEnabledForVoice, IsUniverseEnabledForVoice, IsVoiceEnabled, ShowVoiceOptInOverlay, IsUniverseEnabledForAvatarVideo, ElegibleToSeeVoiceUpsell) --[[ Line: 7 ]]
	return {
		universeId = UniverseId,
		isPlaceEnabledForVoice = IsPlaceEnabledForVoice,
		isUniverseEnabledForVoice = IsUniverseEnabledForVoice,
		isVoiceEnabled = IsVoiceEnabled,
		isUniverseEnabledForAvatarVideo = IsUniverseEnabledForAvatarVideo,
		showVoiceOptInOverlay = ShowVoiceOptInOverlay,
		elegibleToSeeVoiceUpsell = ElegibleToSeeVoiceUpsell
	}
end)