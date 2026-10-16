local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local BuildRobuxTransferFlowPayloadModule = require(CurrencyTransfers.Utils.buildRobuxTransferFlowPayload)
local SendRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.sendRobuxTransferFlowEvent)

return function(p1, p2, List) --[[ Line: 12 | Named "logRobuxTransferFlowEvent" ]]
	-- upvalues: BuildRobuxTransferFlowPayloadModule (copy), SendRobuxTransferFlowEventModule (copy)
	local RobuxTransferFlowPayloadModule = BuildRobuxTransferFlowPayloadModule(p1, p2)
	
	if List then
		for i, value in pairs(List) do
			RobuxTransferFlowPayloadModule[i] = value
		end
	end
	SendRobuxTransferFlowEventModule(RobuxTransferFlowPayloadModule)
end