local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local reactModule = require(chatUIPrimitives.Parent.React)
local expChatPerfTrackerModule = require(chatUIPrimitives.Telemetry.ExpChatPerfTracker)

return function(p0) --[[ line: 29 | named "useFinishChatWindowMessageRenderIntervals" ]]
	-- upvalues: reactModule (ref), expChatPerfTrackerModule (ref)
	return reactModule.useCallback(function() --[[ line: 30 ]]
		-- upvalues: p0 (ref), expChatPerfTrackerModule (copy)
		local var3 = p0() or "UNKNOWN_MESSAGE_ID"
		expChatPerfTrackerModule.finish(expChatPerfTrackerModule.Events.MessageReceiveToWindowRenderInterval, { messageId = var3 })
		expChatPerfTrackerModule.finish(expChatPerfTrackerModule.Events.MessageSendToWindowRenderInterval, { messageId = var3 })
	end, { p0 })
end