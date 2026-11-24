local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local RegisterCurrencyTransferSduiActionsModule = require(CurrencyTransfers.Actions.registerCurrencyTransferSduiActions)

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), RegisterCurrencyTransferSduiActionsModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: RegisterCurrencyTransferSduiActionsModule (upval)
		RegisterCurrencyTransferSduiActionsModule()
	end, {})
	
	return nil
end)