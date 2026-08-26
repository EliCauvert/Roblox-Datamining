local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.ErrorTransferModel)

return function(p1, p2)
	-- upvalues: promptStateModule (ref)
	local setPromptState = p1.setPromptState
	local setErrorTransferModel = p1.setErrorTransferModel
	
	if p2 then
		setErrorTransferModel(p2)
	else
		setErrorTransferModel(nil)
	end
	setPromptState(promptStateModule.TransferError)
end