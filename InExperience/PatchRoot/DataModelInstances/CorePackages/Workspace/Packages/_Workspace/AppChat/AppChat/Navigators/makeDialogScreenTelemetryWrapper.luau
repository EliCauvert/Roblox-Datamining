local appChat = script:FindFirstAncestor("AppChat")
local chatDialogTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local reactModule = require(appChat.Parent.React)

return function(p1)
	-- upvalues: reactModule (ref), chatDialogTelemetryLayerModule (ref)
	return function(p2)
		-- upvalues: reactModule (copy), chatDialogTelemetryLayerModule (copy), p1 (ref)
		local var1 = if p2.navigation then p2.navigation.getParam("conversationId") else nil
		
		return reactModule.createElement(chatDialogTelemetryLayerModule.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: var1 (ref)
				return { conversationId = var1 }
			end, { var1 })
		}, reactModule.createElement(p1, p2))
	end
end