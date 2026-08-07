local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.InitiateTransferModel)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)

return function(p0, p1) --[[ line: 10 | named "proceedToConfirm" ]]
	-- upvalues: setTransferPromptStateModule (ref), promptStateModule (ref)
	p0.setSelectedAmount(p1)
	setTransferPromptStateModule(p0, promptStateModule.TransferConfirm)
end