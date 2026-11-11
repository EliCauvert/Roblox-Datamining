local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local ButtonVariant = require(Parent1.Foundation).Enums.ButtonVariant
local FillBehavior = require(Parent1.Foundation).Enums.FillBehavior
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Sheet = FoundationModule.Sheet
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local LoggingProtocolModule = require(Parent1.LoggingProtocol)
local UnifiedProductPurchaseCompletionModalShownCounter = require(Parent.Generic.Events.UnifiedPurchaseCompletionCounter).UnifiedProductPurchaseCompletionModalShownCounter
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local FormatTextWithParamsModule = require(Parent.Utility.formatTextWithParams)
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local UseInitialButtonDisableDelayModule = require(Parent.Generic.Hooks.useInitialButtonDisableDelay)
local UNIFIEDPURCHASECOMPLETIONMODALMINHEIGHTPIXELS = require(Parent.Generic.Constants).UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS
local FFlagUnifiedPurchaseModalUiImprovementsModule = require(Parent.Flags.FFlagUnifiedPurchaseModalUiImprovements)
local FFlagAddFocusNavigationToUnifiedPurchaseModule = require(Parent.Flags.FFlagAddFocusNavigationToUnifiedPurchase)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagAddFocusNavigationToUnifiedPurchaseModule (copy), UseFocusNavigationRefsModule (copy), UseInitialButtonDisableDelayModule (copy), UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), LoggingProtocolModule (copy), UnifiedProductPurchaseCompletionModalShownCounter (copy), FormatTextWithParamsModule (copy), Sheet (copy), FFlagUnifiedPurchaseModalUiImprovementsModule (copy), UseScaledValueFunction (copy), UNIFIEDPURCHASECOMPLETIONMODALMINHEIGHTPIXELS (copy), Text (copy), View (copy), Icon (copy), FillBehavior (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	})
	local v1 = nil
	local v2 = nil
	local IsDisabled = false
	
	if FFlagAddFocusNavigationToUnifiedPurchaseModule then
		v1, v20 = UseFocusNavigationRefsModule(p1.buttons.onClose, nil)
		IsDisabled = UseInitialButtonDisableDelayModule()
	end
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(FoundationModule.Enums.IconName.CircleCheck)
	ReactModule.useEffect(function()
		-- upvalues: LoggingProtocolModule (upval), UnifiedProductPurchaseCompletionModalShownCounter (upval)
		LoggingProtocolModule.default:logRobloxTelemetryCounter(UnifiedProductPurchaseCompletionModalShownCounter, 1, {})
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseLocalizationResult (copy)
		return if p1.title then p1.title elseif p1.isError then UseLocalizationResult.ErrorTitle else UseLocalizationResult.PurchaseCompleteTitle
	end, { p1.title, p1.isError })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseLocalizationResult (copy), FormatTextWithParamsModule (upval)
		return if p1.bodyText then p1.bodyText elseif p1.isError then UseLocalizationResult.GenericErrorBody elseif p1.isMultiItem then UseLocalizationResult.MultiItemPurchaseCompleteBody else FormatTextWithParamsModule(UseLocalizationResult.PurchaseCompleteBody, { ITEM_NAME = p1.itemName })
	end, { p1.bodyText, p1.isError, p1.isMultiItem, p1.itemName })
	local Text1 = if p1.buttons and p1.buttons.text then p1.buttons.text else UseLocalizationResult.OkButtonText
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), FoundationModule (upval)
		if p1.isError then
			UseStateResult2(FoundationModule.Enums.IconName.TriangleExclamation)
			
			return
		else
			UseStateResult2(FoundationModule.Enums.IconName.CircleCheck)
		end
	end, { p1.isError })
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = if p1.buttons.onClose then p1.buttons.onClose else p1.buttons.onActivated,
		snapPoints = if FFlagUnifiedPurchaseModalUiImprovementsModule then {
			UseScaledValueFunction(UNIFIEDPURCHASECOMPLETIONMODALMINHEIGHTPIXELS),
			0.8
		} else { 0.4, 0.8 },
		ref = if FFlagAddFocusNavigationToUnifiedPurchaseModule then if IsDisabled then nil else v1 else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				Text = UseMemoResult
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = if FFlagUnifiedPurchaseModalUiImprovementsModule then "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
			}, {
				Icon = ReactModule.createElement(Icon, {
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
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			ReactModule.createElement(FoundationModule.Button, {
				text = Text1,
				onActivated = p1.buttons.onActivated,
				fillBehavior = FillBehavior.Fill,
				variant = ButtonVariant.Emphasis,
				ref = if FFlagAddFocusNavigationToUnifiedPurchaseModule then v2 else nil,
				isDisabled = IsDisabled
			})
		})
	})
end