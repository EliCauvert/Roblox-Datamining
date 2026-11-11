local RoactAnalyticsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactAnalytics)

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		return {
			joinWithoutVoiceChat = function(DontShowAgain)
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred("voiceChat", "joinWithoutVoiceChat", { dontShowAgain = DontShowAgain })
			end,
			closeEnableVoiceChatModal = function()
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred("voiceChat", "closeEnableVoiceChatModal")
			end,
			enableVoiceChatUpsell = function()
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred("voiceChat", "enableVoiceChatUpsell")
			end,
			showEnableVoiceChatModal = function()
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred("voiceChat", "showEnableVoiceChatModal")
			end,
			learnMoreAboutVoiceRecordingUpsell = function()
				-- upvalues: GetResult (copy)
				GetResult.EventStream:sendEventDeferred("voiceChat", "learnMoreAboutVoiceRecordingUpsell")
			end
		}
	end
}