local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local chatConversationTelemetryEventsModule = require(parent.AppChat.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(parent.AppChat.ChatConversationTelemetryLayer)
local conversationExitTypeModule = require(parent.AppChat.ConversationExitType)
local useTelemetryModule = require(parent.AppChat.useTelemetry)

return function(p0)
	-- upvalues: useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), conversationExitTypeModule (ref)
	local emit = useTelemetryModule(chatConversationTelemetryLayerModule.Context).emit
	local var5 = reactModule.useRef(emit)
	var5.current = emit
	local var6 = reactModule.useRef(p0.getLoadedMessageCount)
	var6.current = p0.getLoadedMessageCount
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), chatConversationTelemetryEventsModule (copy), var6 (ref)
		var5.current(chatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = var6.current() })
	end, { p0.conversationId })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), chatConversationTelemetryEventsModule (copy), conversationExitTypeModule (copy)
		return function()
			-- upvalues: var5 (copy), chatConversationTelemetryEventsModule (copy), conversationExitTypeModule (copy)
			var5.current(chatConversationTelemetryEventsModule.ScreenExit, {
				conversationExitType = conversationExitTypeModule.Default
			})
		end
	end, {})
	
	return {
		fireInfoButtonClicked = reactModule.useCallback(function()
			-- upvalues: var5 (ref), chatConversationTelemetryEventsModule (copy)
			var5.current(chatConversationTelemetryEventsModule.ConversationInfoBtnClicked, {})
		end, {})
	}
end