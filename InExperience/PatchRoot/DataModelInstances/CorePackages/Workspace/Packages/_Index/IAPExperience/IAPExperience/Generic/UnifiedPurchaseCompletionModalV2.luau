local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local ButtonVariant = require(Parent1.Foundation).Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LoggingProtocolModule = require(Parent1.LoggingProtocol)
local UnifiedProductPurchaseCompletionModalShownCounter = require(Parent.Generic.Events.UnifiedPurchaseCompletionCounter).UnifiedProductPurchaseCompletionModalShownCounter
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local FormatTextWithParamsModule = require(Parent.Utility.formatTextWithParams)
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local FFlagEnableLaunchAfterPurchase = require(Parent1.SharedFlags).FFlagEnableLaunchAfterPurchase
local PlayXlarge = if require(Parent1.SharedFlags).FFlagEnableLargerLaunchAfterPurchasePlayIcon then IconName.PlayXlarge else IconName.PlaySmall

return function(p1) --[[ Line: 61 | Named "UnifiedPurchaseCompletionModalV2" ]]
	-- upvalues: UseLocalizationFunction (copy), UseFocusNavigationRefsModule (copy), UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagEnableLaunchAfterPurchase (copy), LoggingProtocolModule (copy), UnifiedProductPurchaseCompletionModalShownCounter (copy), FormatTextWithParamsModule (copy), Dialog (copy), DialogSize (copy), View (copy), Icon (copy), Text (copy), Orientation (copy), PlayXlarge (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	})
	local UseFocusNavigationRefsModuleResult, UseFocusNavigationRefsModuleResult2 = UseFocusNavigationRefsModule(p1.buttons.onClose or p1.buttons.onActivated, nil)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(FoundationModule.Enums.IconName.CircleCheck)
	local NoIsError: boolean = FFlagEnableLaunchAfterPurchase and (p1.enableLaunchAfterPurchase == true and not p1.isError)
	local UseRefResult = ReactModule.useRef(p1.buttons.onShown)
	UseRefResult.current = p1.buttons.onShown
	ReactModule.useEffect(function() --[[ Line: 85 ]]
		-- upvalues: LoggingProtocolModule (upval), UnifiedProductPurchaseCompletionModalShownCounter (upval), FFlagEnableLaunchAfterPurchase (upval), UseRefResult (copy)
		LoggingProtocolModule.default:logRobloxTelemetryCounter(UnifiedProductPurchaseCompletionModalShownCounter, 1, {})
		
		if FFlagEnableLaunchAfterPurchase and UseRefResult.current then
			UseRefResult.current()
		end
	end, {})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 92 ]]
		-- upvalues: p1 (copy), UseLocalizationResult (copy)
		return if p1.title then p1.title elseif p1.isError then UseLocalizationResult.ErrorTitle else UseLocalizationResult.PurchaseCompleteTitle
	end, { p1.title, p1.isError })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 102 ]]
		-- upvalues: p1 (copy), UseLocalizationResult (copy), FormatTextWithParamsModule (upval)
		return if p1.bodyText then p1.bodyText elseif p1.isError then UseLocalizationResult.GenericErrorBody elseif p1.isMultiItem then UseLocalizationResult.MultiItemPurchaseCompleteBody else FormatTextWithParamsModule(UseLocalizationResult.PurchaseCompleteBody, { ITEM_NAME = p1.itemName or "" })
	end, { p1.bodyText, p1.isError, p1.isMultiItem, p1.itemName })
	ReactModule.useEffect(function() --[[ Line: 116 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), FoundationModule (upval)
		if p1.isError then
			UseStateResult2(FoundationModule.Enums.IconName.TriangleExclamation)
			
			return
		else
			UseStateResult2(FoundationModule.Enums.IconName.CircleCheck)
		end
	end, { p1.isError })
	
	return ReactModule.createElement(Dialog.Root, {
		closeOnClickOutside = true,
		disablePortal = false,
		size = DialogSize.Medium,
		onClose = if p1.buttons.onClose then p1.buttons.onClose else p1.buttons.onActivated,
		ref = UseFocusNavigationRefsModuleResult
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseMemoResult }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			Body = ReactModule.createElement(View, {
				tag = "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small"
			}, {
				DialogIcon = ReactModule.createElement(Icon, {
					tag = "auto-xy",
					name = UseStateResult,
					size = UseTokensResult.Size.Size_1200
				}),
				Message = ReactModule.createElement(Text, {
					tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap",
					Text = UseMemoResult1
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			orientation = Orientation.Horizontal,
			actions = if NoIsError then {
				{
					isDisabled = false,
					icon = PlayXlarge,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.buttons.onActivated,
					ref = UseFocusNavigationRefsModuleResult2
				}
			} else {
				{
					isDisabled = false,
					text = if p1.buttons and p1.buttons.text then p1.buttons.text else UseLocalizationResult.OkButtonText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.buttons.onActivated,
					ref = UseFocusNavigationRefsModuleResult2
				}
			}
		})
	})
end