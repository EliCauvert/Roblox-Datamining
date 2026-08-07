local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local _ = require(currencyTransfers.Models.ErrorTransferModel)

return function(p0, p1) --[[ line: 11 | named "handleGetError" ]]
	-- upvalues: transferDirectionModule (ref), promptStateModule (ref)
	local setPromptState = p0.setPromptState
	local setErrorTransferModel = p0.setErrorTransferModel
	local getDirection = p0.getDirection
	
	if p1 then
		setErrorTransferModel(p1)
	else
		setErrorTransferModel(nil)
	end
	if getDirection(false) == transferDirectionModule.Receive then
		setPromptState(promptStateModule.ReceiveError)
		
		return
	end
	setPromptState(promptStateModule.TransferError)
end