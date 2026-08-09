local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local buttonVariant = require(parent_1.Foundation).Enums.ButtonVariant
local fillBehavior = require(parent_1.Foundation).Enums.FillBehavior
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local sheet = foundationModule.Sheet
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local loggingProtocolModule = require(parent_1.LoggingProtocol)
local unifiedProductPurchaseCompletionModalShownCounter = require(parent.Generic.Events.UnifiedPurchaseCompletionCounter).UnifiedProductPurchaseCompletionModalShownCounter
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local formatTextWithParamsModule = require(parent.Utility.formatTextWithParams)
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local useInitialButtonDisableDelayModule = require(parent.Generic.Hooks.useInitialButtonDisableDelay)
local UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS = require(parent.Generic.Constants).UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS
local fFlagUnifiedPurchaseModalUiImprovementsModule = require(parent.Flags.FFlagUnifiedPurchaseModalUiImprovements)
local fFlagAddFocusNavigationToUnifiedPurchaseModule = require(parent.Flags.FFlagAddFocusNavigationToUnifiedPurchase)

return function(p0) --[[ line: 58 | named "UnifiedPurchaseCompletionModal" ]]
	-- upvalues: useLocalization (ref), fFlagAddFocusNavigationToUnifiedPurchaseModule (ref), useFocusNavigationRefsModule (ref), useInitialButtonDisableDelayModule (ref), useTokens (ref), reactModule (ref), foundationModule (ref), loggingProtocolModule (ref), unifiedProductPurchaseCompletionModalShownCounter (ref), formatTextWithParamsModule (ref), sheet (ref), fFlagUnifiedPurchaseModalUiImprovementsModule (ref), useScaledValue (ref), UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS (ref), text (ref), view (ref), icon (ref), fillBehavior (ref), buttonVariant (ref)
	local var8 = useLocalization({
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	})
	local var9 = nil
	local var10 = nil
	local var11 = false
	
	if fFlagAddFocusNavigationToUnifiedPurchaseModule then
		local var12, var13 = useFocusNavigationRefsModule(p0.buttons.onClose, nil)
		var9 = var12
		var10 = var13
		var11 = useInitialButtonDisableDelayModule()
	end
	local var14 = useTokens()
	local var15, var16 = reactModule.useState(foundationModule.Enums.IconName.CircleCheck)
	reactModule.useEffect(function() --[[ line: 77 ]]
		-- upvalues: loggingProtocolModule (copy), unifiedProductPurchaseCompletionModalShownCounter (copy)
		loggingProtocolModule.default:logRobloxTelemetryCounter(unifiedProductPurchaseCompletionModalShownCounter, 1, {})
	end, {})
	local var17 = reactModule.useMemo(function() --[[ line: 81 ]]
		-- upvalues: p0 (ref), var8 (ref)
		return if p0.title then p0.title elseif p0.isError then var8.ErrorTitle else var8.PurchaseCompleteTitle
	end, { p0.title, p0.isError })
	local var18 = reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: p0 (ref), var8 (ref), formatTextWithParamsModule (copy)
		return if p0.bodyText then p0.bodyText elseif p0.isError then var8.GenericErrorBody elseif p0.isMultiItem then var8.MultiItemPurchaseCompleteBody else formatTextWithParamsModule(var8.PurchaseCompleteBody, { ITEM_NAME = p0.itemName })
	end, { p0.bodyText, p0.isError, p0.isMultiItem, p0.itemName })
	local _ = nil
	local var19 = if p0.buttons and p0.buttons.text then p0.buttons.text else var8.OkButtonText
	reactModule.useEffect(function() --[[ line: 112 ]]
		-- upvalues: p0 (ref), var16 (ref), foundationModule (copy)
		if p0.isError then
			var16(foundationModule.Enums.IconName.TriangleExclamation)
			
			return
		end
		var16(foundationModule.Enums.IconName.CircleCheck)
	end, { p0.isError })
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = if p0.buttons.onClose then p0.buttons.onClose else p0.buttons.onActivated,
		snapPoints = if fFlagUnifiedPurchaseModalUiImprovementsModule then {
			useScaledValue(UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS),
			0.8
		} else { 0.4, 0.8 },
		ref = if fFlagAddFocusNavigationToUnifiedPurchaseModule then if var11 then nil else var9 else nil
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				Text = var17
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = if fFlagUnifiedPurchaseModalUiImprovementsModule then "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
			}, {
				Icon = reactModule.createElement(icon, {
					tag = "auto-xy",
					name = var15,
					size = var14.Size.Size_1200
				}),
				Message = reactModule.createElement(text, {
					tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap",
					Text = var18
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(foundationModule.Button, {
				text = var19,
				onActivated = p0.buttons.onActivated,
				fillBehavior = fillBehavior.Fill,
				variant = buttonVariant.Emphasis,
				ref = if fFlagAddFocusNavigationToUnifiedPurchaseModule then var10 else nil,
				isDisabled = var11
			})
		})
	})
end