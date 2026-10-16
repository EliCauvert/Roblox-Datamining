game:DefineFastFlag("EnablePartyVoiceVolumeOnlyWhenInEligibleParty", false)

return function() --[[ Line: 3 ]]
	return game:GetEngineFeature("PartyVoiceVolume") and game:GetFastFlag("EnablePartyVoiceVolumeOnlyWhenInEligibleParty")
end