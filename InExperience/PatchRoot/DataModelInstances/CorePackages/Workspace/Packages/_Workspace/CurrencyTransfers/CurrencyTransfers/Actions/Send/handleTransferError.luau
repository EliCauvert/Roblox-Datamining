local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.ErrorTransferModel)

return function(p0, p1)
	-- upvalues: promptStateModule (ref)
	local setPromptState = p0.setPromptState
	local setErrorTransferModel = p0.setErrorTransferModel
	
	if p1 then
		setErrorTransferModel(p1)
	else
		setErrorTransferModel(nil)
	end
	setPromptState(promptStateModule.TransferError)
end