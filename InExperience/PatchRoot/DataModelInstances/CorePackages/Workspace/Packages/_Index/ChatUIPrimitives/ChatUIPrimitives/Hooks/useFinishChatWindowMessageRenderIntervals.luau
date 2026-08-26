local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local reactModule = require(chatUIPrimitives.Parent.React)
local expChatPerfTrackerModule = require(chatUIPrimitives.Telemetry.ExpChatPerfTracker)

return function(p1)
	-- upvalues: reactModule (ref), expChatPerfTrackerModule (ref)
	return reactModule.useCallback(function()
		-- upvalues: p1 (ref), expChatPerfTrackerModule (copy)
		local var1 = p1() or "UNKNOWN_MESSAGE_ID"
		expChatPerfTrackerModule.finish(expChatPerfTrackerModule.Events.MessageReceiveToWindowRenderInterval, { messageId = var1 })
		expChatPerfTrackerModule.finish(expChatPerfTrackerModule.Events.MessageSendToWindowRenderInterval, { messageId = var1 })
	end, { p1 })
end