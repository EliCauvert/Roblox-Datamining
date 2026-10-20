local ExpChat = script:FindFirstAncestor("ExpChat")
local TextChatService = game:GetService("TextChatService")
local _ = require(ExpChat.MessageEffects.MessageEffect)
local ShouldSendHighFrequencyTelemetryModule = require(ExpChat.shouldSendHighFrequencyTelemetry)
local GetFFlagExpChatUseUpdatedMessageRenderedModule = require(ExpChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local v1 = require(ExpChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(ExpChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local EngineFeatureTextChatReportEmojiTelemetryEnabledModule = require(ExpChat.Flags.EngineFeatureTextChatReportEmojiTelemetryEnabled)

return function(TextChatMessage, p1)
	-- upvalues: GetFFlagExpChatUseUpdatedMessageRenderedModule (copy), ShouldSendHighFrequencyTelemetryModule (copy), v1 (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), EngineFeatureTextChatReportEmojiTelemetryEnabledModule (copy), TextChatService (copy)
	if not GetFFlagExpChatUseUpdatedMessageRenderedModule() or not ShouldSendHighFrequencyTelemetryModule(v1) then return end
	if not EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
		TextChatService:SendExpChatMessageClientRendered(TextChatMessage, "bubble_chat")
		
		return
	end
	if EngineFeatureTextChatReportEmojiTelemetryEnabledModule then
		TextChatService:SendExpChatMessageClientRendered(TextChatMessage, "bubble_chat", -1, "", p1)
		
		return
	else
		TextChatService:SendExpChatMessageClientRendered(TextChatMessage, "bubble_chat", -1)
	end
end