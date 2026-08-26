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

return function(p1)
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), useInitialButtonDisableDelayModule (ref), useTokens (ref), reactModule (ref), foundationModule (ref), loggingProtocolModule (ref), unifiedProductPurchaseCompletionModalShownCounter (ref), formatTextWithParamsModule (ref), sheet (ref), useScaledValue (ref), UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS (ref), text (ref), view (ref), icon (ref), fillBehavior (ref), buttonVariant (ref)
	local var1 = useLocalization({
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	})
	local var2, var3 = useFocusNavigationRefsModule(p1.buttons.onClose, nil)
	local var4 = useInitialButtonDisableDelayModule()
	local var5 = useTokens()
	local var6, var7 = reactModule.useState(foundationModule.Enums.IconName.CircleCheck)
	reactModule.useEffect(function()
		-- upvalues: loggingProtocolModule (copy), unifiedProductPurchaseCompletionModalShownCounter (copy)
		loggingProtocolModule.default:logRobloxTelemetryCounter(unifiedProductPurchaseCompletionModalShownCounter, 1, {})
	end, {})
	local var8 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref)
		return if p1.title then p1.title elseif p1.isError then var1.ErrorTitle else var1.PurchaseCompleteTitle
	end, { p1.title, p1.isError })
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref), formatTextWithParamsModule (copy)
		return if p1.bodyText then p1.bodyText elseif p1.isError then var1.GenericErrorBody elseif p1.isMultiItem then var1.MultiItemPurchaseCompleteBody else formatTextWithParamsModule(var1.PurchaseCompleteBody, { ITEM_NAME = p1.itemName })
	end, { p1.bodyText, p1.isError, p1.isMultiItem, p1.itemName })
	local _ = nil
	local var10 = if p1.buttons and p1.buttons.text then p1.buttons.text else var1.OkButtonText
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var7 (ref), foundationModule (copy)
		if p1.isError then
			var7(foundationModule.Enums.IconName.TriangleExclamation)
			
			return
		end
		var7(foundationModule.Enums.IconName.CircleCheck)
	end, { p1.isError })
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = if p1.buttons.onClose then p1.buttons.onClose else p1.buttons.onActivated,
		snapPoints = {
			useScaledValue(UNIFIED_PURCHASE_COMPLETION_MODAL_MIN_HEIGHT_PIXELS),
			0.8
		},
		ref = if var4 then nil else var2
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				Text = var8
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, {
				tag = "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small",
				LayoutOrder = 1
			}, {
				Icon = reactModule.createElement(icon, {
					tag = "auto-xy",
					name = var6,
					size = var5.Size.Size_1200
				}),
				Message = reactModule.createElement(text, {
					tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap",
					Text = var9
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(foundationModule.Button, {
				text = var10,
				onActivated = p1.buttons.onActivated,
				fillBehavior = fillBehavior.Fill,
				variant = buttonVariant.Emphasis,
				ref = var3,
				isDisabled = var4
			})
		})
	})
end