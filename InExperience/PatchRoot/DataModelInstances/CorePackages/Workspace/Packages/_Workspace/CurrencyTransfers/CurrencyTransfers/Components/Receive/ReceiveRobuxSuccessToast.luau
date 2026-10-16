local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local TransferLocaleFormatModule = require(CurrencyTransfers.Localization.transferLocaleFormat)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationService = game:GetService("LocalizationService")
local FoundationModule = require(Parent.Foundation)
local Snackbar = FoundationModule.Snackbar
local Enums = FoundationModule.Enums
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local HandleReceiveCompleteModule = require(CurrencyTransfers.Actions.Receive.handleReceiveComplete)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local FormatNumberModule = require(CurrencyTransfers.Utils.formatNumber)

return function(_) --[[ Line: 34 | Named "ReceiveRobuxSuccessToast" ]]
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), UseTransferStoreModule (copy), SignalsReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), ReactModule (copy), TransferLocaleFormatModule (copy), HandleReceiveCompleteModule (copy), Snackbar (copy), Enums (copy)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.ReceiveRobuxSuccessToast)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getRobuxTransfer)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getIsAlreadyAccepted)
	local FormatNumberModuleResult = FormatNumberModule(LocalizationService.RobloxLocaleId, if UseSignalStateResult then UseSignalStateResult.receivingAmount or UseSignalStateResult.transferAmount else 0)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 44 ]]
		-- upvalues: UseSignalStateResult1 (copy), UseLocalizationResult (copy), TransferLocaleFormatModule (upval), FormatNumberModuleResult (copy)
		return if UseSignalStateResult1 then UseLocalizationResult.AlreadyAcceptedNotification else TransferLocaleFormatModule.substituteAmount(UseLocalizationResult.SuccessNotification, (tostring(FormatNumberModuleResult)))
	end, {
		UseSignalStateResult1,
		FormatNumberModuleResult,
		UseLocalizationResult.SuccessNotification,
		UseLocalizationResult.AlreadyAcceptedNotification
	})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 55 ]]
		-- upvalues: UseRefResult (copy), HandleReceiveCompleteModule (upval), UseTransferStoreModuleResult (copy)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(5, function() --[[ Line: 62 ]]
			-- upvalues: HandleReceiveCompleteModule (upval), UseTransferStoreModuleResult (upval)
			HandleReceiveCompleteModule(UseTransferStoreModuleResult)
		end)
		
		return function() --[[ Line: 68 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, {})
	
	return ReactModule.createElement(Snackbar, {
		ZIndex = 100,
		title = UseMemoResult,
		icon = if UseSignalStateResult1 then nil else {
			name = Enums.IconName.CircleCheck,
			variant = Enums.IconVariant.Filled
		},
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onClose = function() --[[ Line: 89 ]]
			-- upvalues: HandleReceiveCompleteModule (upval), UseTransferStoreModuleResult (copy)
			HandleReceiveCompleteModule(UseTransferStoreModuleResult)
		end
	})
end