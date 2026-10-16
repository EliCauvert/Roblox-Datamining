local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local RegisterCurrencyTransferSduiActionsModule = require(CurrencyTransfers.Actions.registerCurrencyTransferSduiActions)

return ReactModule.memo(function() --[[ Line: 9 | Named "SduiEconomyRegister" ]]
	-- upvalues: ReactModule (copy), RegisterCurrencyTransferSduiActionsModule (copy)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: RegisterCurrencyTransferSduiActionsModule (upval)
		RegisterCurrencyTransferSduiActionsModule()
	end, {})
	
	return nil
end)