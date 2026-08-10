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

return function(p0) --[[ line: 59 | named "UnifiedPurchaseCompletionModal" ]]
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), useInitialButtonDisableDelayModule (ref), useTokens (ref), reactModule (ref), foundationModule (ref), loggingProtocolModule (ref), unifiedProductPurchaseCompletionModalShownCounter (ref), formatTextWithParamsModule (ref), sheet (ref), useScaledValue (ref), UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS (ref), text (ref), view (ref), icon (ref), fillBehavior (ref), buttonVariant (ref)
	local var6 = useLocalization({
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	})
	local var7, var8 = useFocusNavigationRefsModule(p0.buttons.onClose, nil)
	local var9 = useInitialButtonDisableDelayModule()
	local var10 = useTokens()
	local var11, var12 = reactModule.useState(foundationModule.Enums.IconName.CircleCheck)
	reactModule.useEffect(function() --[[ line: 76 ]]
		-- upvalues: loggingProtocolModule (copy), unifiedProductPurchaseCompletionModalShownCounter (copy)
		loggingProtocolModule.default:logRobloxTelemetryCounter(unifiedProductPurchaseCompletionModalShownCounter, 1, {})
	end, {})
	local var13 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: p0 (ref), var6 (ref)
		return if p0.title then p0.title elseif p0.isError then var6.ErrorTitle else var6.PurchaseCompleteTitle
	end, { p0.title, p0.isError })
	local var14 = reactModule.useMemo(function() --[[ line: 90 ]]
		-- upvalues: p0 (ref), var6 (ref), formatTextWithParamsModule (copy)
		return if p0.bodyText then p0.bodyText elseif p0.isError then var6.GenericErrorBody elseif p0.isMultiItem then var6.MultiItemPurchaseCompleteBody else formatTextWithParamsModule(var6.PurchaseCompleteBody, { ITEM_NAME = p0.itemName })
	end, { p0.bodyText, p0.isError, p0.isMultiItem, p0.itemName })
	local _ = nil
	local var15 = if p0.buttons and p0.buttons.text then p0.buttons.text else var6.OkButtonText
	reactModule.useEffect(function() --[[ line: 111 ]]
		-- upvalues: p0 (ref), var12 (ref), foundationModule (copy)
		if p0.isError then
			var12(foundationModule.Enums.IconName.TriangleExclamation)
			
			return
		end
		var12(foundationModule.Enums.IconName.CircleCheck)
	end, { p0.isError })
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = if p0.buttons.onClose then p0.buttons.onClose else p0.buttons.onActivated,
		snapPoints = {
			useScaledValue(UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS),
			0.8
		},
		ref = if var9 then nil else var7
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				Text = var13
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, {
				tag = "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small",
				LayoutOrder = 1
			}, {
				Icon = reactModule.createElement(icon, {
					tag = "auto-xy",
					name = var11,
					size = var10.Size.Size_1200
				}),
				Message = reactModule.createElement(text, {
					tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap",
					Text = var14
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(foundationModule.Button, {
				text = var15,
				onActivated = p0.buttons.onActivated,
				fillBehavior = fillBehavior.Fill,
				variant = buttonVariant.Emphasis,
				ref = var8,
				isDisabled = var9
			})
		})
	})
end