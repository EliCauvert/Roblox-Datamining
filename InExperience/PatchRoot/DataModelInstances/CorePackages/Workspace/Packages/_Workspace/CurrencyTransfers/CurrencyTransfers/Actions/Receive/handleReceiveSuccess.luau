local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)

return function(p1) --[[ Line: 7 | Named "handleReceiveSuccess" ]]
	-- upvalues: PromptStateModule (copy)
	p1.setPromptState(PromptStateModule.ReceiveSuccess)
end