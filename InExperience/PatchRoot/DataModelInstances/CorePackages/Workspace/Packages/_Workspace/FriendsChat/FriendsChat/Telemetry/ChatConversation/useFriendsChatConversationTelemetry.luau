local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local ChatConversationTelemetryEventsModule = require(Parent.AppChat.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(Parent.AppChat.ChatConversationTelemetryLayer)
local ConversationExitTypeModule = require(Parent.AppChat.ConversationExitType)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)

return function(p1)
	-- upvalues: UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), ReactModule (copy), ChatConversationTelemetryEventsModule (copy), ConversationExitTypeModule (copy)
	local Emit = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context).emit
	local UseRefResult = ReactModule.useRef(Emit)
	UseRefResult.current = Emit
	local UseRefResult1 = ReactModule.useRef(p1.getLoadedMessageCount)
	UseRefResult1.current = p1.getLoadedMessageCount
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), ChatConversationTelemetryEventsModule (upval), UseRefResult1 (copy)
		UseRefResult.current(ChatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = UseRefResult1.current() })
	end, { p1.conversationId })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), ChatConversationTelemetryEventsModule (upval), ConversationExitTypeModule (upval)
		return function()
			-- upvalues: UseRefResult (upval), ChatConversationTelemetryEventsModule (upval), ConversationExitTypeModule (upval)
			UseRefResult.current(ChatConversationTelemetryEventsModule.ScreenExit, {
				conversationExitType = ConversationExitTypeModule.Default
			})
		end
	end, {})
	
	return {
		fireInfoButtonClicked = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), ChatConversationTelemetryEventsModule (upval)
			UseRefResult.current(ChatConversationTelemetryEventsModule.ConversationInfoBtnClicked, {})
		end, {})
	}
end