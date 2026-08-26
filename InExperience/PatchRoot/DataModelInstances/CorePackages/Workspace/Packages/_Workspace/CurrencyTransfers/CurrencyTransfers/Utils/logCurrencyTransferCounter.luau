local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local loggingProtocolModule = require(currencyTransfers.Parent.LoggingProtocol)
local _ = require(currencyTransfers.Stores.createTransferStore)

return function(p1, p2, p3)
	-- upvalues: loggingProtocolModule (ref)
	local direction = p1.getDirection(false)
	local transferOrigination = p1.getTransferOrigination(false)
	local t = {
		direction = if direction then tostring(direction) else "unknown",
		transferOrigination = if transferOrigination then tostring(transferOrigination) else "unknown"
	}
	
	if p3 then
		for i, v in p3 do
			t[i] = v
		end
	end
	loggingProtocolModule.default:logRobloxTelemetryCounter(p2, 1, t)
end