local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local registerCurrencyTransferSduiActionsModule = require(currencyTransfers.Actions.registerCurrencyTransferSduiActions)

return reactModule.memo(function() --[[ line: 9 | named "SduiEconomyRegister" ]]
	-- upvalues: reactModule (ref), registerCurrencyTransferSduiActionsModule (ref)
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: registerCurrencyTransferSduiActionsModule (copy)
		registerCurrencyTransferSduiActionsModule()
	end, {})
	
	return nil
end)