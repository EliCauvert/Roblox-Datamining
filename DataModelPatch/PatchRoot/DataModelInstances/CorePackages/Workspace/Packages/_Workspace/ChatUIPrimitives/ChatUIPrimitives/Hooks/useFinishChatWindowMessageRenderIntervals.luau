local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local ReactModule = require(ChatUIPrimitives.Parent.React)
local ExpChatPerfTrackerModule = require(ChatUIPrimitives.Telemetry.ExpChatPerfTracker)

return function(Callback)
	-- upvalues: ReactModule (copy), ExpChatPerfTrackerModule (copy)
	return ReactModule.useCallback(function()
		-- upvalues: Callback (copy), ExpChatPerfTrackerModule (upval)
		local CallbackResult = Callback() or "UNKNOWN_MESSAGE_ID"
		ExpChatPerfTrackerModule.finish(ExpChatPerfTrackerModule.Events.MessageReceiveToWindowRenderInterval, { messageId = CallbackResult })
		ExpChatPerfTrackerModule.finish(ExpChatPerfTrackerModule.Events.MessageSendToWindowRenderInterval, { messageId = CallbackResult })
	end, { Callback })
end