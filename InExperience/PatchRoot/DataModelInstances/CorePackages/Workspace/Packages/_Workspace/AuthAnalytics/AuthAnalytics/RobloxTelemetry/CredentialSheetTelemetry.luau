local default = require(script:FindFirstAncestor("AuthAnalytics").Parent.LoggingProtocol).default
local telemetryConfigsModule = require(script.Parent.TelemetryConfigs)
local luaAppCredentialSheetEventStream = game:DefineFastFlag("LuaAppCredentialSheetEventStream", false)
local t = {
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetShownConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetShownEventConfig,
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasswordSelectedConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasswordSelectedEventConfig,
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasskeySelectedConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasskeySelectedEventConfig,
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetErrorConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetErrorEventConfig,
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetDismissedConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetDismissedEventConfig,
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginSuccessConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginSuccessEventConfig,
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginFailureConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginFailureEventConfig,
	[telemetryConfigsModule.IosAuthServiceLoginCredentialSheetUnavailableConfig.eventName] = telemetryConfigsModule.IosAuthServiceLoginCredentialSheetUnavailableEventConfig
}

return {
	report = function(p1, p2)
		-- upvalues: default (ref), luaAppCredentialSheetEventStream (ref), t (ref)
		default:logRobloxTelemetryCounter(p1, 1, p2)
		
		if not luaAppCredentialSheetEventStream then return end
		local eventName = t[p1.eventName]
		
		if eventName == nil then
			return
		end
		default:logRobloxTelemetryEvent(eventName, nil, p2)
	end
}