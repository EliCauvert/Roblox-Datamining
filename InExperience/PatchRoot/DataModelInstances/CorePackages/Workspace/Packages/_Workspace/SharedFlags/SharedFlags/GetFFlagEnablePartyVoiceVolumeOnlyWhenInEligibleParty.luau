game:DefineFastFlag("EnablePartyVoiceVolumeOnlyWhenInEligibleParty", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("PartyVoiceVolume") and game:GetFastFlag("EnablePartyVoiceVolumeOnlyWhenInEligibleParty")
end