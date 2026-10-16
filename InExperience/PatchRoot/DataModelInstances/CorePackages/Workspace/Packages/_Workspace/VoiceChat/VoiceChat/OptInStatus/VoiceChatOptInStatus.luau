local VoiceChat = script:FindFirstAncestor("VoiceChat")
local SetVoiceChatOptInStatusModule = require(VoiceChat.OptInStatus.SetVoiceChatOptInStatus)
local CryoModule = require(VoiceChat.Parent.Cryo)

return function(p1, p2) --[[ Line: 6 ]]
	-- upvalues: SetVoiceChatOptInStatusModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetVoiceChatOptInStatusModule.name then
		P0 = CryoModule.Dictionary.join(P0, { isUserOptIn = p2.isUserOptIn })
	end
	return P0
end