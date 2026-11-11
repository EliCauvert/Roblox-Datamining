local LoggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
local Default = LoggingProtocolModule.default
local config = {
	eventName = "CsatSurveyGetLastSurvBloxCallTimestampError",
	description = "\t\tError tracking for SurvBlox call timestamp retrieval.\n\t",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 7, 21 }
}

return {
	logGetLastSurvBloxCallTimestampError = function()
		-- upvalues: Default (copy), config (copy)
		Default:logRobloxTelemetryCounter(config, 1)
	end
}