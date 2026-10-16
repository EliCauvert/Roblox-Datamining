game:DefineFastFlag("VoiceDebugConsoleV2", false)
local VoiceDebugConsoleV2TestOverrideModule = require(script.Parent.VoiceDebugConsoleV2TestOverride)

return function() --[[ Line: 9 ]]
	-- upvalues: VoiceDebugConsoleV2TestOverrideModule (copy)
	local GetResult = VoiceDebugConsoleV2TestOverrideModule.get()
	
	return if GetResult == nil then game:GetFastFlag("VoiceDebugConsoleV2") or game:GetEngineFeature("VoiceDebugConsoleSubscriptionsPanelEnabled") else GetResult
end