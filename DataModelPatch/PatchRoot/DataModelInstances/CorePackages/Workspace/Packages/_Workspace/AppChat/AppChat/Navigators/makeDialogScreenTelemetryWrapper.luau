local AppChat = script:FindFirstAncestor("AppChat")
local ChatDialogTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local ReactModule = require(AppChat.Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy), ChatDialogTelemetryLayerModule (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), ChatDialogTelemetryLayerModule (upval), p1 (copy)
		local ConversationIdParam = if p2.navigation then p2.navigation.getParam("conversationId") else nil
		
		return ReactModule.createElement(ChatDialogTelemetryLayerModule.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: ConversationIdParam (copy)
				return { conversationId = ConversationIdParam }
			end, { ConversationIdParam })
		}, ReactModule.createElement(p1, p2))
	end
end