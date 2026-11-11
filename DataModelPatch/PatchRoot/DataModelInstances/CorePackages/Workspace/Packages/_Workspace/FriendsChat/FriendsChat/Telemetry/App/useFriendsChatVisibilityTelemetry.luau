local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local AppTelemetryLayerModule = require(Parent.AppChat.AppTelemetryLayer)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)
local AppLevelTelemetryEventsModule = require(script.Parent.AppLevelTelemetryEvents)

return function()
	-- upvalues: UseTelemetryModule (copy), AppTelemetryLayerModule (copy), ReactModule (copy), AppLevelTelemetryEventsModule (copy)
	local EmitFunction = UseTelemetryModule(AppTelemetryLayerModule.Context).emit
	ReactModule.useEffect(function()
		-- upvalues: EmitFunction (copy), AppLevelTelemetryEventsModule (upval)
		EmitFunction(AppLevelTelemetryEventsModule.AppChatVisible, { isChatEnabled = true })
		
		return function()
			-- upvalues: EmitFunction (upval), AppLevelTelemetryEventsModule (upval)
			EmitFunction(AppLevelTelemetryEventsModule.AppChatClosed, { isChatEnabled = true })
		end
	end, {})
end