local IXPServiceWrapper = require(script:FindFirstAncestor("VoiceChatCore").Parent.IXPServiceWrapper).IXPServiceWrapper
game:DefineFastFlag("BatchVoiceParticipantsUpdates", false)
local throttleVoiceParticipantsUpdateLayerName = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerName", "Voice.Performance")
local throttleVoiceParticipantsUpdateLayerValue = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerValue", "BatchVoiceParticipantsUpdates")
local var2 = nil
local var3 = nil

if game:GetFastFlag("BatchVoiceParticipantsUpdates") then
	local ok, status = pcall(function() --[[ line: 12 ]]
		-- upvalues: IXPServiceWrapper (ref), throttleVoiceParticipantsUpdateLayerName (ref)
		return IXPServiceWrapper:GetLayerData(throttleVoiceParticipantsUpdateLayerName)
	end)
	var2 = ok
	var3 = status
end
return function() --[[ line: 17 ]]
	-- upvalues: var2 (write), var3 (write), throttleVoiceParticipantsUpdateLayerValue (ref)
	return game:GetFastFlag("BatchVoiceParticipantsUpdates") and (var2 and (var3 and var3[throttleVoiceParticipantsUpdateLayerValue]))
end