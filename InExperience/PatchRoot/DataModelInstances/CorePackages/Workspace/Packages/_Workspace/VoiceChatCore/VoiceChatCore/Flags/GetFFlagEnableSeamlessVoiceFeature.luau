local constantsModule = require(script:FindFirstAncestor("VoiceChatCore").Constants)
game:DefineFastFlag("EnableSeamlessVoiceFeature", false)
game:DefineFastFlag("EnableConnectDisconnect", false)
game:DefineFastFlag("EnableHearingWithoutMicPermissions", false)
game:DefineFastFlag("EnableDeferVoiceConnection", false)
game:DefineFastFlag("EnableJoinVoiceIsMutedMic", false)
game:DefineFastFlag("EnableJoinVoiceTooltip", false)
game:DefineFastFlag("EnableInitialJoinVoiceButton", false)
game:DefineFastFlag("EnableHideJoinToastSubtitle", false)
local t = {
	[constantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function()
		return game:GetFastFlag("EnableConnectDisconnect")
	end,
	[constantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function()
		return game:GetFastFlag("EnableHearingWithoutMicPermissions")
	end,
	[constantsModule.SeamlessVoiceFeatures.JoinVoiceIsMutedMic] = function()
		return game:GetFastFlag("EnableJoinVoiceIsMutedMic")
	end,
	[constantsModule.SeamlessVoiceFeatures.JoinVoiceTooltip] = function()
		return game:GetFastFlag("EnableJoinVoiceTooltip")
	end,
	[constantsModule.SeamlessVoiceFeatures.InitialJoinVoice] = function()
		return game:GetFastFlag("EnableInitialJoinVoiceButton")
	end,
	[constantsModule.SeamlessVoiceFeatures.DeferConnection] = function()
		return game:GetFastFlag("EnableDeferVoiceConnection")
	end,
	[constantsModule.SeamlessVoiceFeatures.HideJoinToastSubtitle] = function()
		return game:GetFastFlag("EnableHideJoinToastSubtitle")
	end
}

return function(p1)
	-- upvalues: t (ref)
	if type(p1) == "string" then
		p1 = { p1 }
	end
	if p1 == nil or #p1 == 0 or not game:GetFastFlag("EnableSeamlessVoiceFeature") then
		return game:GetFastFlag("EnableSeamlessVoiceFeature")
	end
	for i, v in pairs(p1) do
		local var1 = t[v]
		
		if not var1 or not var1() then
			return false
		end
	end
	return true
end