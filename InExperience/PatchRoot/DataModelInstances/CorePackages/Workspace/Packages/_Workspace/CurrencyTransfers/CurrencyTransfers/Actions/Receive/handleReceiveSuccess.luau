local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)

return function(p0)
	-- upvalues: promptStateModule (ref)
	p0.setPromptState(promptStateModule.ReceiveSuccess)
end