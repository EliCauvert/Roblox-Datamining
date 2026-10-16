local Default = require(script:FindFirstAncestor("AuthAnalytics").Parent.LoggingProtocol).default
local TelemetryConfigsModule = require(script.Parent.TelemetryConfigs)
local LuaAppCredentialSheetEventStream = game:DefineFastFlag("LuaAppCredentialSheetEventStream", false)
local config = {
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetShownConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetShownEventConfig,
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasswordSelectedConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasswordSelectedEventConfig,
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasskeySelectedConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetPasskeySelectedEventConfig,
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetErrorConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetErrorEventConfig,
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetDismissedConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetDismissedEventConfig,
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginSuccessConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginSuccessEventConfig,
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginFailureConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetLoginFailureEventConfig,
	[TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetUnavailableConfig.eventName] = TelemetryConfigsModule.IosAuthServiceLoginCredentialSheetUnavailableEventConfig
}

return {
	report = function(p1, p2) --[[ Line: 27 ]]
		-- upvalues: Default (copy), LuaAppCredentialSheetEventStream (copy), config (copy)
		Default:logRobloxTelemetryCounter(p1, 1, p2)
		
		if not LuaAppCredentialSheetEventStream then return end
		local Entry = config[p1.eventName]
		
		if Entry ~= nil then
			Default:logRobloxTelemetryEvent(Entry, nil, p2)
			
			return
		end
	end
}