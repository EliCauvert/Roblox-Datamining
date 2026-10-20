game:DefineFastFlag("EnablePartyVoiceVolumeOnlyWhenInEligibleParty", false)

return function()
	return game:GetEngineFeature("PartyVoiceVolume") and game:GetFastFlag("EnablePartyVoiceVolumeOnlyWhenInEligibleParty")
end