local voiceChat = script:FindFirstAncestor("VoiceChat")
local setVoiceChatOptInStatusModule = require(voiceChat.OptInStatus.SetVoiceChatOptInStatus)
local cryoModule = require(voiceChat.Parent.Cryo)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: setVoiceChatOptInStatusModule (ref), cryoModule (ref)
	p0 = p0 or {}
	
	if p1.type == setVoiceChatOptInStatusModule.name then
		p0 = cryoModule.Dictionary.join(p0, { isUserOptIn = p1.isUserOptIn })
	end
	return p0
end