local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local registerCurrencyTransferSduiActionsModule = require(currencyTransfers.Actions.registerCurrencyTransferSduiActions)

return reactModule.memo(function()
	-- upvalues: reactModule (ref), registerCurrencyTransferSduiActionsModule (ref)
	reactModule.useEffect(function()
		-- upvalues: registerCurrencyTransferSduiActionsModule (copy)
		registerCurrencyTransferSduiActionsModule()
	end, {})
	
	return nil
end)