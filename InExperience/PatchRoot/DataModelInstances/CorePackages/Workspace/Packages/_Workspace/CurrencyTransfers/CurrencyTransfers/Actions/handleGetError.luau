local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local _ = require(currencyTransfers.Models.ErrorTransferModel)

return function(p1, p2)
	-- upvalues: transferDirectionModule (ref), promptStateModule (ref)
	local setPromptState = p1.setPromptState
	local setErrorTransferModel = p1.setErrorTransferModel
	local getDirection = p1.getDirection
	
	if p2 then
		setErrorTransferModel(p2)
	else
		setErrorTransferModel(nil)
	end
	if getDirection(false) == transferDirectionModule.Receive then
		setPromptState(promptStateModule.ReceiveError)
		
		return
	end
	setPromptState(promptStateModule.TransferError)
end