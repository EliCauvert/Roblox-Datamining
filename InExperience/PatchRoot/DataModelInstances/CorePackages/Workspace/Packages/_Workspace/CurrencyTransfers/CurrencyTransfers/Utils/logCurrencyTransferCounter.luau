local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local loggingProtocolModule = require(currencyTransfers.Parent.LoggingProtocol)
local _ = require(currencyTransfers.Stores.createTransferStore)

return function(p0, p1, p2)
	-- upvalues: loggingProtocolModule (ref)
	local direction = p0.getDirection(false)
	local transferOrigination = p0.getTransferOrigination(false)
	local t = {
		direction = if direction then tostring(direction) else "unknown",
		transferOrigination = if transferOrigination then tostring(transferOrigination) else "unknown"
	}
	
	if p2 then
		for i, v in p2 do
			t[i] = v
		end
	end
	loggingProtocolModule.default:logRobloxTelemetryCounter(p1, 1, t)
end