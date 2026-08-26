local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)

return function(p1)
	-- upvalues: promptStateModule (ref)
	local triggerOnClose = p1.triggerOnClose
	p1.setPromptState(promptStateModule.ReceiveComplete)
	triggerOnClose()
end