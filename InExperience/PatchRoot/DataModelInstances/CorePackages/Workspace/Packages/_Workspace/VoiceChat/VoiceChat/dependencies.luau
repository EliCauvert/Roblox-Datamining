local parent = script:FindFirstAncestor("VoiceChat").Parent

return {
	SharedFlags = require(parent.SharedFlags),
	LinkingProtocol = require(parent.LinkingProtocol),
	Promise = require(parent.Promise),
	VoiceChatCore = require(parent.VoiceChatCore),
	CrossExperienceVoice = require(parent.CrossExperienceVoice)
}