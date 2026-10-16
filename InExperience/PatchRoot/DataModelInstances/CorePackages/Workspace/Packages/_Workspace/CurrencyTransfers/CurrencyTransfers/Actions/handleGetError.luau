local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local _ = require(CurrencyTransfers.Models.ErrorTransferModel)

return function(p1, p2) --[[ Line: 11 | Named "handleGetError" ]]
	-- upvalues: TransferDirectionModule (copy), PromptStateModule (copy)
	local SetPromptStateFunction: (any) -> () = p1.setPromptState
	local SetErrorTransferModelFunction: (any) -> () = p1.setErrorTransferModel
	local GetDirectionFunction = p1.getDirection
	
	if p2 then
		SetErrorTransferModelFunction(p2)
	else
		SetErrorTransferModelFunction(nil)
	end
	if GetDirectionFunction(false) == TransferDirectionModule.Receive then
		SetPromptStateFunction(PromptStateModule.ReceiveError)
		
		return
	else
		SetPromptStateFunction(PromptStateModule.TransferError)
	end
end