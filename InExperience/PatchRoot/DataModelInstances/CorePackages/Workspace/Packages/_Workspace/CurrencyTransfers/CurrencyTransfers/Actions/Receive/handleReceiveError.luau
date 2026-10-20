local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.Models.ErrorTransferModel)

return function(p1, p2)
	-- upvalues: PromptStateModule (copy)
	local SetPromptStateFunction: (any) -> () = p1.setPromptState
	local SetErrorTransferModelFunction: (any) -> () = p1.setErrorTransferModel
	
	if p2 then
		SetErrorTransferModelFunction(p2)
	else
		SetErrorTransferModelFunction(nil)
	end
	SetPromptStateFunction(PromptStateModule.ReceiveError)
end