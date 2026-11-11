local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Default = require(CurrencyTransfers.Parent.LoggingProtocol).default
local RobuxTransferFlowTelemetryModule = require(CurrencyTransfers.Events.RobuxTransferFlowTelemetry)

function sendRobuxTransferFlowEvent(p1)
	-- upvalues: Default (copy), RobuxTransferFlowTelemetryModule (copy)
	Default:logRobloxTelemetryEvent(RobuxTransferFlowTelemetryModule.RobuxTransferFlowEvent, {
		Default.StandardizedFields.addOsInfo,
		Default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p1, "RobuxTransferFlow")
end

return sendRobuxTransferFlowEvent