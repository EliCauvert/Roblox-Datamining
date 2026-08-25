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
	local var10 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxSuccessToast)
	local var11 = useTransferStoreModule()
	local var12 = signalsReactModule.useSignalState(var11.getSelectedAmount)
	local var13 = if var12 then formatNumberModule(localizationService.RobloxLocaleId, var12) else "0"
	local var14 = reactModule.useMemo(function()
		-- upvalues: transferLocaleFormatModule (copy), var10 (ref), var13 (ref)
		return transferLocaleFormatModule.substituteAmount(var10.SuccessNotification, tostring(var13))
	end, { var13, var10.SuccessNotification })
	local var15 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), handleTransferCompleteModule (copy), var11 (ref)
		if var15.current then
			task.cancel(var15.current)
		end
		var15.current = task.delay(5, function()
			-- upvalues: handleTransferCompleteModule (copy), var11 (copy)
			handleTransferCompleteModule(var11)
		end)
		
		return function()
			-- upvalues: var15 (copy)
			if var15.current then
				task.cancel(var15.current)
				var15.current = nil
			end
		end
	end, {})
	
	return reactModule.createElement(snackbar, {
		ZIndex = 100,
		title = var14,
		icon = {
			name = enums.IconName.CircleCheck,
			variant = enums.IconVariant.Filled
		},
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onClose = function()
			-- upvalues: handleTransferCompleteModule (copy), var11 (ref)
			handleTransferCompleteModule(var11)
		end
	})
end