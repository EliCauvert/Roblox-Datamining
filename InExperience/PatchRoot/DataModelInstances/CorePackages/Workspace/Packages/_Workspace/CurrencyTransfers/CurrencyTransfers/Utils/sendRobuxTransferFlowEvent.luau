local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local default = require(currencyTransfers.Parent.LoggingProtocol).default
local robuxTransferFlowTelemetryModule = require(currencyTransfers.Events.RobuxTransferFlowTelemetry)

function sendRobuxTransferFlowEvent(p1)
	-- upvalues: default (ref), robuxTransferFlowTelemetryModule (ref)
	default:logRobloxTelemetryEvent(robuxTransferFlowTelemetryModule.RobuxTransferFlowEvent, {
		default.StandardizedFields.addOsInfo,
		default.StandardizedFields.addSessionId,
		"addSessionInfo"
	}, p1, "RobuxTransferFlow")
end

return sendRobuxTransferFlowEvent