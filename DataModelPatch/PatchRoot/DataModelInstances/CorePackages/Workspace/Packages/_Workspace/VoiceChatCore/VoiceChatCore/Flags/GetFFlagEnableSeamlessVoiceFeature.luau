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
	[ConstantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function()
		return game:GetFastFlag("EnableConnectDisconnect")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function()
		return game:GetFastFlag("EnableHearingWithoutMicPermissions")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.JoinVoiceIsMutedMic] = function()
		return game:GetFastFlag("EnableJoinVoiceIsMutedMic")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.JoinVoiceTooltip] = function()
		return game:GetFastFlag("EnableJoinVoiceTooltip")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.InitialJoinVoice] = function()
		return game:GetFastFlag("EnableInitialJoinVoiceButton")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.DeferConnection] = function()
		return game:GetFastFlag("EnableDeferVoiceConnection")
	end,
	[ConstantsModule.SeamlessVoiceFeatures.HideJoinToastSubtitle] = function()
		return game:GetFastFlag("EnableHideJoinToastSubtitle")
	end
}

return function(List)
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