local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local buildRobuxTransferFlowPayloadModule = require(currencyTransfers.Utils.buildRobuxTransferFlowPayload)
local sendRobuxTransferFlowEventModule = require(currencyTransfers.Utils.sendRobuxTransferFlowEvent)

return function(p1, p2, p3)
	-- upvalues: buildRobuxTransferFlowPayloadModule (ref), sendRobuxTransferFlowEventModule (ref)
	local var1 = buildRobuxTransferFlowPayloadModule(p1, p2)
	
	if p3 then
		for i, v in pairs(p3) do
			var1[i] = v
		end
	end
	sendRobuxTransferFlowEventModule(var1)
end