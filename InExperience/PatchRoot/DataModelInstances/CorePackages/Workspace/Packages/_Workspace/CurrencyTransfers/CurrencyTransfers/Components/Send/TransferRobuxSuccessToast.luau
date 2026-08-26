local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormatModule = require(currencyTransfers.Localization.transferLocaleFormat)
local signalsReactModule = require(parent.SignalsReact)
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local snackbar = foundationModule.Snackbar
local enums = foundationModule.Enums
local useLocalization = require(parent.Localization).Hooks.useLocalization
local handleTransferCompleteModule = require(currencyTransfers.Actions.Send.handleTransferComplete)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)

return function(_)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), signalsReactModule (ref), formatNumberModule (ref), localizationService (ref), reactModule (ref), transferLocaleFormatModule (ref), handleTransferCompleteModule (ref), snackbar (ref), enums (ref)
	local var1 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxSuccessToast)
	local var2 = useTransferStoreModule()
	local var3 = signalsReactModule.useSignalState(var2.getSelectedAmount)
	local var4 = if var3 then formatNumberModule(localizationService.RobloxLocaleId, var3) else "0"
	local var5 = reactModule.useMemo(function()
		-- upvalues: transferLocaleFormatModule (copy), var1 (ref), var4 (ref)
		return transferLocaleFormatModule.substituteAmount(var1.SuccessNotification, tostring(var4))
	end, { var4, var1.SuccessNotification })
	local var6 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), handleTransferCompleteModule (copy), var2 (ref)
		if var6.current then
			task.cancel(var6.current)
		end
		var6.current = task.delay(5, function()
			-- upvalues: handleTransferCompleteModule (copy), var2 (copy)
			handleTransferCompleteModule(var2)
		end)
		
		return function()
			-- upvalues: var6 (copy)
			if var6.current then
				task.cancel(var6.current)
				var6.current = nil
			end
		end
	end, {})
	
	return reactModule.createElement(snackbar, {
		ZIndex = 100,
		title = var5,
		icon = {
			name = enums.IconName.CircleCheck,
			variant = enums.IconVariant.Filled
		},
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onClose = function()
			-- upvalues: handleTransferCompleteModule (copy), var2 (ref)
			handleTransferCompleteModule(var2)
		end
	})
end