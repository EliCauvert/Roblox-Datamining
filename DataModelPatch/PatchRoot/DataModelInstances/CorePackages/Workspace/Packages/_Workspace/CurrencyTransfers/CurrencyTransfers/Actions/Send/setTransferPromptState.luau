local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.Models.InitiateTransferModel)
local config = {
	[PromptStateModule.TransferRequested] = { PromptStateModule.TransferStarted },
	[PromptStateModule.TransferStarted] = { PromptStateModule.TransferInput },
	[PromptStateModule.TransferInput] = {
		PromptStateModule.TransferConfirm,
		PromptStateModule.TransferInsufficientBalance
	},
	[PromptStateModule.TransferInsufficientBalance] = {
		PromptStateModule.TransferInput,
		PromptStateModule.TransferConfirm
	},
	[PromptStateModule.TransferConfirm] = {
		PromptStateModule.TransferInput,
		PromptStateModule.TransferProcessing,
		PromptStateModule.TransferConfirm,
		PromptStateModule.TransferInsufficientBalance
	},
	[PromptStateModule.TransferProcessing] = { PromptStateModule.TransferSuccess }
}

local function _(p1, p2): boolean
	-- upvalues: config (copy)
	for _, value in ipairs(config[p1]) do
		if value == p2 then
			return true
		end
	end
	return false
end

return function(p3, p4)
	-- upvalues: config (copy), PromptStateModule (copy)
	local SetPromptStateFunction: (any) -> () = p3.setPromptState
	local Flag = false
	
	for _, value in ipairs(config[p3.getPromptState(false)]) do
		if value == p4 then
			Flag = true
			break
		end
	end
	if Flag then
		SetPromptStateFunction(p4)
		
		return
	else
		SetPromptStateFunction(PromptStateModule.TransferError)
	end
end