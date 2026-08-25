local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local fFlagSduiOpenIncomingTransferUpsellAction = require(parent.SharedFlags).FFlagSduiOpenIncomingTransferUpsellAction
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry

return function()
	-- upvalues: fFlagSduiOpenIncomingTransferUpsellAction (ref), sduiActionType (ref), currencyTransfers (ref), getSduiActionHandlerRegistry (ref)
	if fFlagSduiOpenIncomingTransferUpsellAction then
		getSduiActionHandlerRegistry().registerActionHandlerConfigs({
			[sduiActionType.OpenIncomingTransferUpsell] = {
				skipUnifiedLogging = false,
				lazyHandler = function()
					-- upvalues: currencyTransfers (copy)
					return require(currencyTransfers.Actions.SduiOpenIncomingTransferUpsellAction)
				end
			}
		})
		
		return
	end
end