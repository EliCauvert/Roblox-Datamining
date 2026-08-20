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
	report = function(p0, p1) --[[ line: 27 ]]
		-- upvalues: default (ref), luaAppCredentialSheetEventStream (ref), t (ref)
		default:logRobloxTelemetryCounter(p0, 1, p1)
		
		if not luaAppCredentialSheetEventStream then return end
		local eventName = t[p0.eventName]
		
		if eventName == nil then
			return
		end
		default:logRobloxTelemetryEvent(eventName, nil, p1)
	end
}