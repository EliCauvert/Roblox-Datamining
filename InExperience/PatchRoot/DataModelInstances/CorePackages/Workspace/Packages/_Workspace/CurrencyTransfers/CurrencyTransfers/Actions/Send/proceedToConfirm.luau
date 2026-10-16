local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.Models.InitiateTransferModel)
local SetTransferPromptStateModule = require(CurrencyTransfers.Actions.Send.setTransferPromptState)

return function(p1, p2) --[[ Line: 10 | Named "proceedToConfirm" ]]
	-- upvalues: SetTransferPromptStateModule (copy), PromptStateModule (copy)
	p1.setSelectedAmount(p2)
	SetTransferPromptStateModule(p1, PromptStateModule.TransferConfirm)
end