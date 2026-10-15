local expChat = script:FindFirstAncestor("ExpChat")
local textChatService = game:GetService("TextChatService")
local _ = require(expChat.MessageEffects.MessageEffect)
local shouldSendHighFrequencyTelemetryModule = require(expChat.shouldSendHighFrequencyTelemetry)
local getFFlagExpChatUseUpdatedMessageRenderedModule = require(expChat.Flags.getFFlagExpChatUseUpdatedMessageRendered)
local var1 = require(expChat.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)()
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(expChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local engineFeatureTextChatReportEmojiTelemetryEnabledModule = require(expChat.Flags.EngineFeatureTextChatReportEmojiTelemetryEnabled)

return function(p1, p2)
	-- upvalues: getFFlagExpChatUseUpdatedMessageRenderedModule (ref), shouldSendHighFrequencyTelemetryModule (ref), var1 (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), engineFeatureTextChatReportEmojiTelemetryEnabledModule (ref), textChatService (ref)
	if not getFFlagExpChatUseUpdatedMessageRenderedModule() or not shouldSendHighFrequencyTelemetryModule(var1) then return end
	if not engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
		textChatService:SendExpChatMessageClientRendered(p1, "bubble_chat")
		
		return
	elseif engineFeatureTextChatReportEmojiTelemetryEnabledModule then
		textChatService:SendExpChatMessageClientRendered(p1, "bubble_chat", -1, "", p2)
		
		return
	end
	textChatService:SendExpChatMessageClientRendered(p1, "bubble_chat", -1)
end