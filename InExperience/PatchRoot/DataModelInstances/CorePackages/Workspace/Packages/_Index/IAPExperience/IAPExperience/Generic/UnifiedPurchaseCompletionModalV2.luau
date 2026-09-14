local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local buttonVariant = require(parent_1.Foundation).Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
local useTokens = foundationModule.Hooks.useTokens
local playSmall = iconName.PlaySmall
local loggingProtocolModule = require(parent_1.LoggingProtocol)
local unifiedProductPurchaseCompletionModalShownCounter = require(parent.Generic.Events.UnifiedPurchaseCompletionCounter).UnifiedProductPurchaseCompletionModalShownCounter
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local formatTextWithParamsModule = require(parent.Utility.formatTextWithParams)
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local fFlagEnableLaunchAfterPurchase = require(parent_1.SharedFlags).FFlagEnableLaunchAfterPurchase

return function(p1)
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), useTokens (ref), reactModule (ref), foundationModule (ref), fFlagEnableLaunchAfterPurchase (ref), loggingProtocolModule (ref), unifiedProductPurchaseCompletionModalShownCounter (ref), formatTextWithParamsModule (ref), dialog (ref), dialogSize (ref), view (ref), icon (ref), text (ref), orientation (ref), playSmall (ref), buttonVariant (ref)
	local var1 = useLocalization({
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	})
	local _ = nil
	local _ = nil
	local var2, var3 = useFocusNavigationRefsModule(p1.buttons.onClose or p1.buttons.onActivated, nil)
	local var4 = useTokens()
	local var5, var6 = reactModule.useState(foundationModule.Enums.IconName.CircleCheck)
	local var7 = fFlagEnableLaunchAfterPurchase and (p1.enableLaunchAfterPurchase == true and not p1.isError)
	local var8 = reactModule.useRef(p1.buttons.onShown)
	var8.current = p1.buttons.onShown
	reactModule.useEffect(function()
		-- upvalues: loggingProtocolModule (copy), unifiedProductPurchaseCompletionModalShownCounter (copy), fFlagEnableLaunchAfterPurchase (copy), var8 (ref)
		loggingProtocolModule.default:logRobloxTelemetryCounter(unifiedProductPurchaseCompletionModalShownCounter, 1, {})
		
		if fFlagEnableLaunchAfterPurchase and var8.current then
			var8.current()
		end
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref)
		return if p1.title then p1.title elseif p1.isError then var1.ErrorTitle else var1.PurchaseCompleteTitle
	end, { p1.title, p1.isError })
	local var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref), formatTextWithParamsModule (copy)
		return if p1.bodyText then p1.bodyText elseif p1.isError then var1.GenericErrorBody elseif p1.isMultiItem then var1.MultiItemPurchaseCompleteBody else formatTextWithParamsModule(var1.PurchaseCompleteBody, { ITEM_NAME = p1.itemName or "" })
	end, { p1.bodyText, p1.isError, p1.isMultiItem, p1.itemName })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref), foundationModule (copy)
		if p1.isError then
			var6(foundationModule.Enums.IconName.TriangleExclamation)
			
			return
		end
		var6(foundationModule.Enums.IconName.CircleCheck)
	end, { p1.isError })
	
	return reactModule.createElement(dialog.Root, {
		closeOnClickOutside = true,
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = if p1.buttons.onClose then p1.buttons.onClose else p1.buttons.onActivated,
		ref = var2
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var9 }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			Body = reactModule.createElement(view, {
				tag = "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small"
			}, {
				DialogIcon = reactModule.createElement(icon, { tag = "auto-xy", name = var5, size = var4.Size.Size_1200 }),
				Message = reactModule.createElement(text, {
					tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap",
					Text = var10
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Horizontal,
			actions = if var7 then {
				{
					isDisabled = false,
					icon = playSmall,
					variant = buttonVariant.Emphasis,
					onActivated = p1.buttons.onActivated,
					ref = var3
				}
			} else {
				{
					isDisabled = false,
					text = if p1.buttons and p1.buttons.text then p1.buttons.text else var1.OkButtonText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.buttons.onActivated,
					ref = var3
				}
			}
		})
	})
end