local Parent = script:FindFirstAncestor("VoiceChat").Parent

return {
	SharedFlags = require(Parent.SharedFlags),
	LinkingProtocol = require(Parent.LinkingProtocol),
	Promise = require(Parent.Promise),
	VoiceChatCore = require(Parent.VoiceChatCore),
	CrossExperienceVoice = require(Parent.CrossExperienceVoice)
}