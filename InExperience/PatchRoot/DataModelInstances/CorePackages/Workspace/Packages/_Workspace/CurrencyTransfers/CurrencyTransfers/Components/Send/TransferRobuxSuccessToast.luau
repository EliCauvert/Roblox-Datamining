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
local HandleTransferCompleteModule = require(CurrencyTransfers.Actions.Send.handleTransferComplete)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local FormatNumberModule = require(CurrencyTransfers.Utils.formatNumber)

return function(_) --[[ Line: 31 | Named "TransferRobuxSuccessToast" ]]
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), UseTransferStoreModule (copy), SignalsReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), ReactModule (copy), TransferLocaleFormatModule (copy), HandleTransferCompleteModule (copy), Snackbar (copy), Enums (copy)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.TransferRobuxSuccessToast)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getSelectedAmount)
	local FormatNumberModuleResult = if UseSignalStateResult then FormatNumberModule(LocalizationService.RobloxLocaleId, UseSignalStateResult) else "0"
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 40 ]]
		-- upvalues: TransferLocaleFormatModule (upval), UseLocalizationResult (copy), FormatNumberModuleResult (copy)
		return TransferLocaleFormatModule.substituteAmount(UseLocalizationResult.SuccessNotification, (tostring(FormatNumberModuleResult)))
	end, {
		FormatNumberModuleResult,
		UseLocalizationResult.SuccessNotification
	})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 46 ]]
		-- upvalues: UseRefResult (copy), HandleTransferCompleteModule (upval), UseTransferStoreModuleResult (copy)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(5, function() --[[ Line: 53 ]]
			-- upvalues: HandleTransferCompleteModule (upval), UseTransferStoreModuleResult (upval)
			HandleTransferCompleteModule(UseTransferStoreModuleResult)
		end)
		
		return function() --[[ Line: 59 ]]
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
		icon = {
			name = Enums.IconName.CircleCheck,
			variant = Enums.IconVariant.Filled
		},
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onClose = function() --[[ Line: 81 ]]
			-- upvalues: HandleTransferCompleteModule (upval), UseTransferStoreModuleResult (copy)
			HandleTransferCompleteModule(UseTransferStoreModuleResult)
		end
	})
end