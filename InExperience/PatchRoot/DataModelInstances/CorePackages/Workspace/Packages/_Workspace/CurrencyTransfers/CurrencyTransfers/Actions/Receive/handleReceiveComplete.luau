local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)

return function(p1)
	-- upvalues: PromptStateModule (copy)
	local TriggerOnCloseFunction: () -> () = p1.triggerOnClose
	p1.setPromptState(PromptStateModule.ReceiveComplete)
	TriggerOnCloseFunction()
end