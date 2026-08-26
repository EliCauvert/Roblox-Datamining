local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.InitiateTransferModel)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)

return function(p1, p2)
	-- upvalues: setTransferPromptStateModule (ref), promptStateModule (ref)
	p1.setSelectedAmount(p2)
	setTransferPromptStateModule(p1, promptStateModule.TransferConfirm)
end