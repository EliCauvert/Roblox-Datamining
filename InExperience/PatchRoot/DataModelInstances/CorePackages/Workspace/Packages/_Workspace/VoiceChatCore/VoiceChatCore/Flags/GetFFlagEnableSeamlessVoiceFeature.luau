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
	[constantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function() --[[ line: 22 ]]
		return game:GetFastFlag("EnableConnectDisconnect")
	end,
	[constantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function() --[[ line: 25 ]]
		return game:GetFastFlag("EnableHearingWithoutMicPermissions")
	end,
	[constantsModule.SeamlessVoiceFeatures.JoinVoiceIsMutedMic] = function() --[[ line: 28 ]]
		return game:GetFastFlag("EnableJoinVoiceIsMutedMic")
	end,
	[constantsModule.SeamlessVoiceFeatures.JoinVoiceTooltip] = function() --[[ line: 31 ]]
		return game:GetFastFlag("EnableJoinVoiceTooltip")
	end,
	[constantsModule.SeamlessVoiceFeatures.InitialJoinVoice] = function() --[[ line: 34 ]]
		return game:GetFastFlag("EnableInitialJoinVoiceButton")
	end,
	[constantsModule.SeamlessVoiceFeatures.DeferConnection] = function() --[[ line: 37 ]]
		return game:GetFastFlag("EnableDeferVoiceConnection")
	end,
	[constantsModule.SeamlessVoiceFeatures.HideJoinToastSubtitle] = function() --[[ line: 40 ]]
		return game:GetFastFlag("EnableHideJoinToastSubtitle")
	end
}

return function(p0) --[[ line: 45 ]]
	-- upvalues: t (ref)
	if type(p0) == "string" then
		p0 = { p0 }
	end
	if p0 == nil or #p0 == 0 or not game:GetFastFlag("EnableSeamlessVoiceFeature") then
		return game:GetFastFlag("EnableSeamlessVoiceFeature")
	end
	for i, v in pairs(p0) do
		local var2 = t[v]
		
		if not var2 or not var2() then
			return false
		end
	end
	return true
end