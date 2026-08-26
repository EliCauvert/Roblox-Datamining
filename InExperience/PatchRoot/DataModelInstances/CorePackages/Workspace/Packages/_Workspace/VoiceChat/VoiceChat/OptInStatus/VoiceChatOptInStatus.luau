local voiceChat = script:FindFirstAncestor("VoiceChat")
local setVoiceChatOptInStatusModule = require(voiceChat.OptInStatus.SetVoiceChatOptInStatus)
local cryoModule = require(voiceChat.Parent.Cryo)

return function(p1, p2)
	-- upvalues: setVoiceChatOptInStatusModule (ref), cryoModule (ref)
	p1 = p1 or {}
	
	if p2.type == setVoiceChatOptInStatusModule.name then
		p1 = cryoModule.Dictionary.join(p1, { isUserOptIn = p2.isUserOptIn })
	end
	return p1
end