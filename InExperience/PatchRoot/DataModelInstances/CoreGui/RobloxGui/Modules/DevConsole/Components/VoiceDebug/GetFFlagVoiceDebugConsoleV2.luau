game:DefineFastFlag("VoiceDebugConsoleV2", false)
local voiceDebugConsoleV2TestOverrideModule = require(script.Parent.VoiceDebugConsoleV2TestOverride)

return function()
	-- upvalues: voiceDebugConsoleV2TestOverrideModule (ref)
	local var1 = voiceDebugConsoleV2TestOverrideModule.get()
	
	return if var1 == nil then game:GetFastFlag("VoiceDebugConsoleV2") or game:GetEngineFeature("VoiceDebugConsoleSubscriptionsPanelEnabled") else var1
end