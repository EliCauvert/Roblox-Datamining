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
local handleReceiveCompleteModule = require(currencyTransfers.Actions.Receive.handleReceiveComplete)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)

return function(_)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), signalsReactModule (ref), formatNumberModule (ref), localizationService (ref), reactModule (ref), transferLocaleFormatModule (ref), handleReceiveCompleteModule (ref), snackbar (ref), enums (ref)
	local var1 = useLocalization(transferLocalizationKeysModule.Presets.ReceiveRobuxSuccessToast)
	local var2 = useTransferStoreModule()
	local var3 = signalsReactModule.useSignalState(var2.getRobuxTransfer)
	local var4 = signalsReactModule.useSignalState(var2.getIsAlreadyAccepted)
	local var5 = formatNumberModule(localizationService.RobloxLocaleId, if var3 then var3.receivingAmount or var3.transferAmount else 0)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var1 (ref), transferLocaleFormatModule (copy), var5 (ref)
		return if var4 then var1.AlreadyAcceptedNotification else transferLocaleFormatModule.substituteAmount(var1.SuccessNotification, tostring(var5))
	end, {
		var4,
		var5,
		var1.SuccessNotification,
		var1.AlreadyAcceptedNotification
	})
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), handleReceiveCompleteModule (copy), var2 (ref)
		if var7.current then
			task.cancel(var7.current)
		end
		var7.current = task.delay(5, function()
			-- upvalues: handleReceiveCompleteModule (copy), var2 (copy)
			handleReceiveCompleteModule(var2)
		end)
		
		return function()
			-- upvalues: var7 (copy)
			if var7.current then
				task.cancel(var7.current)
				var7.current = nil
			end
		end
	end, {})
	
	return reactModule.createElement(snackbar, {
		ZIndex = 100,
		title = var6,
		icon = if not var4 then {
			name = enums.IconName.CircleCheck,
			variant = enums.IconVariant.Filled
		} else nil,
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onClose = function()
			-- upvalues: handleReceiveCompleteModule (copy), var2 (ref)
			handleReceiveCompleteModule(var2)
		end
	})
end