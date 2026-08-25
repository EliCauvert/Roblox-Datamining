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

local function _(p0, p1)
	-- upvalues: t (ref)
	for i, v in ipairs(t[p0]) do
		if v == p1 then
			return true
		end
	end
	return false
end

return function(value, p2)
	-- upvalues: t (ref), promptStateModule (ref)
	local var3
	local setPromptState = value.setPromptState
	
	for i, v in ipairs(t[value.getPromptState(false)]) do
		if v == p2 then
			var3 = true
			if var3 then
				setPromptState(p2)
				
				return
			end
			setPromptState(promptStateModule.TransferError)
			
			return
		end
	end
	var3 = false
end