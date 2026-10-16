local ConstantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)
game:DefineFastFlag("EnableSeamlessVoiceFeature", false)
game:DefineFastFlag("EnableConnectDisconnect", false)
game:DefineFastFlag("EnableHearingWithoutMicPermissions", false)
game:DefineFastFlag("EnableDeferVoiceConnection", false)
game:DefineFastFlag("EnableJoinVoiceIsMutedMic", false)
game:DefineFastFlag("EnableJoinVoiceTooltip", false)
game:DefineFastFlag("EnableInitialJoinVoiceButton", false)
game:DefineFastFlag("EnableHideJoinToastSubtitle", false)
local config = {
	[ConstantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function() --[[ Line: 22 ]]
		return game:GetFastFlag("EnableConnectDisconnect")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function() --[[ Line: 25 ]]
		return game:GetFastFlag("EnableHearingWithoutMicPermissions")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.JoinVoiceIsMutedMic] = function() --[[ Line: 28 ]]
		return game:GetFastFlag("EnableJoinVoiceIsMutedMic")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.JoinVoiceTooltip] = function() --[[ Line: 31 ]]
		return game:GetFastFlag("EnableJoinVoiceTooltip")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.InitialJoinVoice] = function() --[[ Line: 34 ]]
		return game:GetFastFlag("EnableInitialJoinVoiceButton")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.DeferConnection] = function() --[[ Line: 37 ]]
		return game:GetFastFlag("EnableDeferVoiceConnection")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.HideJoinToastSubtitle] = function() --[[ Line: 40 ]]
		return game:GetFastFlag("EnableHideJoinToastSubtitle")
	end
}

return function(List) --[[ Line: 45 ]]
	-- upvalues: config (copy)
	if type(List) == "string" then
		List = { List }
	end
	if List == nil or #List == 0 or not game:GetFastFlag("EnableSeamlessVoiceFeature") then
		return game:GetFastFlag("EnableSeamlessVoiceFeature")
	end
	for _, value in pairs(List) do
		local Entry = config[value]
		
		if not Entry or not Entry() then
			return false
		end
	end
	return true
end