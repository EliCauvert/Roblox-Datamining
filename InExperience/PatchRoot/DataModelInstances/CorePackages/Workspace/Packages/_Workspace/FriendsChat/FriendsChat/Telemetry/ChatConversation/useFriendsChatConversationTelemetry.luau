local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local chatConversationTelemetryEventsModule = require(parent.AppChat.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(parent.AppChat.ChatConversationTelemetryLayer)
local conversationExitTypeModule = require(parent.AppChat.ConversationExitType)
local useTelemetryModule = require(parent.AppChat.useTelemetry)

return function(p1)
	-- upvalues: useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), conversationExitTypeModule (ref)
	local emit = useTelemetryModule(chatConversationTelemetryLayerModule.Context).emit
	local var1 = reactModule.useRef(emit)
	var1.current = emit
	local var2 = reactModule.useRef(p1.getLoadedMessageCount)
	var2.current = p1.getLoadedMessageCount
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), chatConversationTelemetryEventsModule (copy), var2 (ref)
		var1.current(chatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = var2.current() })
	end, { p1.conversationId })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), chatConversationTelemetryEventsModule (copy), conversationExitTypeModule (copy)
		return function()
			-- upvalues: var1 (copy), chatConversationTelemetryEventsModule (copy), conversationExitTypeModule (copy)
			var1.current(chatConversationTelemetryEventsModule.ScreenExit, {
				conversationExitType = conversationExitTypeModule.Default
			})
		end
	end, {})
	
	return {
		fireInfoButtonClicked = reactModule.useCallback(function()
			-- upvalues: var1 (ref), chatConversationTelemetryEventsModule (copy)
			var1.current(chatConversationTelemetryEventsModule.ConversationInfoBtnClicked, {})
		end, {})
	}
end