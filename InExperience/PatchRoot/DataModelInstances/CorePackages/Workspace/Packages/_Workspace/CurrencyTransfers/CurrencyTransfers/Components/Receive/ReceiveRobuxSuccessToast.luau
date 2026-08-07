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

return function(_) --[[ line: 34 | named "ReceiveRobuxSuccessToast" ]]
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), signalsReactModule (ref), formatNumberModule (ref), localizationService (ref), reactModule (ref), transferLocaleFormatModule (ref), handleReceiveCompleteModule (ref), snackbar (ref), enums (ref)
	local var10 = useLocalization(transferLocalizationKeysModule.Presets.ReceiveRobuxSuccessToast)
	local var11 = useTransferStoreModule()
	local var12 = signalsReactModule.useSignalState(var11.getRobuxTransfer)
	local var13 = signalsReactModule.useSignalState(var11.getIsAlreadyAccepted)
	local var14 = formatNumberModule(localizationService.RobloxLocaleId, if var12 then var12.receivingAmount or var12.transferAmount else 0)
	local var15 = reactModule.useMemo(function() --[[ line: 44 ]]
		-- upvalues: var13 (ref), var10 (ref), transferLocaleFormatModule (copy), var14 (ref)
		return if var13 then var10.AlreadyAcceptedNotification else transferLocaleFormatModule.substituteAmount(var10.SuccessNotification, tostring(var14))
	end, {
		var13,
		var14,
		var10.SuccessNotification,
		var10.AlreadyAcceptedNotification
	})
	local var16 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: var16 (ref), handleReceiveCompleteModule (copy), var11 (ref)
		if var16.current then
			task.cancel(var16.current)
		end
		var16.current = task.delay(5, function() --[[ line: 62 ]]
			-- upvalues: handleReceiveCompleteModule (copy), var11 (copy)
			handleReceiveCompleteModule(var11)
		end)
		
		return function() --[[ line: 68 ]]
			-- upvalues: var16 (copy)
			if var16.current then
				task.cancel(var16.current)
				var16.current = nil
			end
		end
	end, {})
	
	return reactModule.createElement(snackbar, {
		ZIndex = 100,
		title = var15,
		icon = if not var13 then {
			name = enums.IconName.CircleCheck,
			variant = enums.IconVariant.Filled
		} else nil,
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onClose = function() --[[ line: 89 ]]
			-- upvalues: handleReceiveCompleteModule (copy), var11 (ref)
			handleReceiveCompleteModule(var11)
		end
	})
end