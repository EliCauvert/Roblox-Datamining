local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local LoggingProtocolModule = require(CurrencyTransfers.Parent.LoggingProtocol)
local _ = require(CurrencyTransfers.Stores.createTransferStore)

return function(p1, p2, List)
	-- upvalues: LoggingProtocolModule (copy)
	local Direction = p1.getDirection(false)
	local TransferOrigination = p1.getTransferOrigination(false)
	local config = {
		direction = if Direction then tostring(Direction) else "unknown",
		transferOrigination = if TransferOrigination then tostring(TransferOrigination) else "unknown"
	}
	
	if List then
		for i, value in List do
			config[i] = value
		end
	end
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p2, 1, config)
end