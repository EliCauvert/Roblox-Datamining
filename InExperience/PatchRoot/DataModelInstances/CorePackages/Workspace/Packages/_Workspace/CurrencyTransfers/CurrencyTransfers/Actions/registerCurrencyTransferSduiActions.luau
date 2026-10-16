local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local FFlagSduiOpenIncomingTransferUpsellAction = require(Parent.SharedFlags).FFlagSduiOpenIncomingTransferUpsellAction
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry

return function() --[[ Line: 14 | Named "registerCurrencyTransferSduiActions" ]]
	-- upvalues: FFlagSduiOpenIncomingTransferUpsellAction (copy), SduiActionType (copy), CurrencyTransfers (copy), GetSduiActionHandlerRegistryFunction (copy)
	if FFlagSduiOpenIncomingTransferUpsellAction then
		GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
			[SduiActionType.OpenIncomingTransferUpsell] = {
				skipUnifiedLogging = false,
				lazyHandler = function() --[[ Line: 21 ]]
					-- upvalues: CurrencyTransfers (upval)
					return require(CurrencyTransfers.Actions.SduiOpenIncomingTransferUpsellAction)
				end
			}
		})
		
		return
	end
end