local IXPServiceWrapper = require(script:FindFirstAncestor("VoiceChatCore").Parent.IXPServiceWrapper).IXPServiceWrapper
game:DefineFastFlag("BatchVoiceParticipantsUpdates", false)
local ThrottleVoiceParticipantsUpdateLayerName = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerName", "Voice.Performance")
local ThrottleVoiceParticipantsUpdateLayerValue = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerValue", "BatchVoiceParticipantsUpdates")
local v1 = nil
local v2 = nil

if game:GetFastFlag("BatchVoiceParticipantsUpdates") then
	v1, v4 = pcall(function() --[[ Line: 12 ]]
		-- upvalues: IXPServiceWrapper (copy), ThrottleVoiceParticipantsUpdateLayerName (copy)
		return IXPServiceWrapper:GetLayerData(ThrottleVoiceParticipantsUpdateLayerName)
	end)
end
return function() --[[ Line: 17 ]]
	-- upvalues: v1 (ref), v2 (ref), ThrottleVoiceParticipantsUpdateLayerValue (copy)
	return game:GetFastFlag("BatchVoiceParticipantsUpdates") and (v1 and (v2 and v2[ThrottleVoiceParticipantsUpdateLayerValue]))
end