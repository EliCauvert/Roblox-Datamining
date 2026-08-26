local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.InitiateTransferModel)
local t = {
	[promptStateModule.TransferRequested] = { promptStateModule.TransferStarted },
	[promptStateModule.TransferStarted] = { promptStateModule.TransferInput },
	[promptStateModule.TransferInput] = {
		promptStateModule.TransferConfirm,
		promptStateModule.TransferInsufficientBalance
	},
	[promptStateModule.TransferInsufficientBalance] = {
		promptStateModule.TransferInput,
		promptStateModule.TransferConfirm
	},
	[promptStateModule.TransferConfirm] = {
		promptStateModule.TransferInput,
		promptStateModule.TransferProcessing,
		promptStateModule.TransferConfirm,
		promptStateModule.TransferInsufficientBalance
	},
	[promptStateModule.TransferProcessing] = { promptStateModule.TransferSuccess }
}

local function _(p1, p2)
	-- upvalues: t (ref)
	for i, v in ipairs(t[p1]) do
		if v == p2 then
			return true
		end
	end
	return false
end

return function(value, p3)
	-- upvalues: t (ref), promptStateModule (ref)
	local var1
	local setPromptState = value.setPromptState
	
	for i, v in ipairs(t[value.getPromptState(false)]) do
		if v == p3 then
			var1 = true
			if var1 then
				setPromptState(p3)
				
				return
			end
			setPromptState(promptStateModule.TransferError)
			
			return
		end
	end
	var1 = false
end