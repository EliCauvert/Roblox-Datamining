return {
	[require(script.Parent.EventNames).PartyVoiceConnectedParticipantsOnJoin] = {
		type = require(script:FindFirstAncestor("CrossExperienceVoice").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes.Counter,
		name = game:DefineFastString("PartyVoiceConnectedParticipantsOnJoinCounter", "PartyVoiceConnectedParticipantsOnJoin")
	}
}