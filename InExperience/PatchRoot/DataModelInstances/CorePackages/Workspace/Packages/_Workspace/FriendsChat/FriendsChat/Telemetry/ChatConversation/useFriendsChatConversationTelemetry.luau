local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local ChatConversationTelemetryEventsModule = require(Parent.AppChat.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(Parent.AppChat.ChatConversationTelemetryLayer)
local ConversationExitTypeModule = require(Parent.AppChat.ConversationExitType)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)
local FFlagFriendsChatScreenExitLoadedMessageCountModule = require(FriendsChat.Flags.FFlagFriendsChatScreenExitLoadedMessageCount)

return function(p1)
	-- upvalues: UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), ReactModule (copy), ChatConversationTelemetryEventsModule (copy), ConversationExitTypeModule (copy), FFlagFriendsChatScreenExitLoadedMessageCountModule (copy)
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
		-- upvalues: UseRefResult (copy), ChatConversationTelemetryEventsModule (upval), ConversationExitTypeModule (upval), FFlagFriendsChatScreenExitLoadedMessageCountModule (upval), UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult (upval), ChatConversationTelemetryEventsModule (upval), ConversationExitTypeModule (upval), FFlagFriendsChatScreenExitLoadedMessageCountModule (upval), UseRefResult1 (upval)
			UseRefResult.current(ChatConversationTelemetryEventsModule.ScreenExit, {
				conversationExitType = ConversationExitTypeModule.Default,
				loadedMessageCount = if FFlagFriendsChatScreenExitLoadedMessageCountModule then UseRefResult1.current() else nil
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