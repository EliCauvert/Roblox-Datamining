local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)

return function(p1)
	-- upvalues: promptStateModule (ref)
	p1.setPromptState(promptStateModule.TransferSuccess)
end