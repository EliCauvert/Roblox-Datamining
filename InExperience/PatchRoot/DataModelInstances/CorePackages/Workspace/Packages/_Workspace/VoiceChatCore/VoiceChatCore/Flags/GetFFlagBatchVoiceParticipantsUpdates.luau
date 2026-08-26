local IXPServiceWrapper = require(script:FindFirstAncestor("VoiceChatCore").Parent.IXPServiceWrapper).IXPServiceWrapper
game:DefineFastFlag("BatchVoiceParticipantsUpdates", false)
local throttleVoiceParticipantsUpdateLayerName = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerName", "Voice.Performance")
local throttleVoiceParticipantsUpdateLayerValue = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerValue", "BatchVoiceParticipantsUpdates")
local var1 = nil
local var2 = nil

if game:GetFastFlag("BatchVoiceParticipantsUpdates") then
	local ok, status = pcall(function()
		-- upvalues: IXPServiceWrapper (ref), throttleVoiceParticipantsUpdateLayerName (ref)
		return IXPServiceWrapper:GetLayerData(throttleVoiceParticipantsUpdateLayerName)
	end)
	var1 = ok
	var2 = status
end
return function()
	-- upvalues: var1 (write), var2 (write), throttleVoiceParticipantsUpdateLayerValue (ref)
	return game:GetFastFlag("BatchVoiceParticipantsUpdates") and (var1 and (var2 and var2[throttleVoiceParticipantsUpdateLayerValue]))
end