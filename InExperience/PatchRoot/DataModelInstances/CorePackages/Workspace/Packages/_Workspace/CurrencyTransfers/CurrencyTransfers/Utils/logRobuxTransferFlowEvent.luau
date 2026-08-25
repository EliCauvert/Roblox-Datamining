local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local buildRobuxTransferFlowPayloadModule = require(currencyTransfers.Utils.buildRobuxTransferFlowPayload)
local sendRobuxTransferFlowEventModule = require(currencyTransfers.Utils.sendRobuxTransferFlowEvent)

return function(p0, p1, p2)
	-- upvalues: buildRobuxTransferFlowPayloadModule (ref), sendRobuxTransferFlowEventModule (ref)
	local var3 = buildRobuxTransferFlowPayloadModule(p0, p1)
	
	if p2 then
		for i, v in pairs(p2) do
			var3[i] = v
		end
	end
	sendRobuxTransferFlowEventModule(var3)
end