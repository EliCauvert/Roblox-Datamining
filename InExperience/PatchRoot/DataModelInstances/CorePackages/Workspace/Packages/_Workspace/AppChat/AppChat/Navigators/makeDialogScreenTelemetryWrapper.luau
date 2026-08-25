local appChat = script:FindFirstAncestor("AppChat")
local chatDialogTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local reactModule = require(appChat.Parent.React)

return function(p0)
	-- upvalues: reactModule (ref), chatDialogTelemetryLayerModule (ref)
	return function(p1)
		-- upvalues: reactModule (copy), chatDialogTelemetryLayerModule (copy), p0 (ref)
		local var3 = if p1.navigation then p1.navigation.getParam("conversationId") else nil
		
		return reactModule.createElement(chatDialogTelemetryLayerModule.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: var3 (ref)
				return { conversationId = var3 }
			end, { var3 })
		}, reactModule.createElement(p0, p1))
	end
end