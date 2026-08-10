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

return function(p0) --[[ line: 60 | named "UnifiedPurchaseCompletionModalV2" ]]
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), useTokens (ref), reactModule (ref), foundationModule (ref), fFlagEnableLaunchAfterPurchase (ref), loggingProtocolModule (ref), unifiedProductPurchaseCompletionModalShownCounter (ref), formatTextWithParamsModule (ref), dialog (ref), dialogSize (ref), view (ref), icon (ref), text (ref), orientation (ref), playSmall (ref), buttonVariant (ref)
	local var5 = useLocalization({
		PurchaseCompleteTitle = "IAPExperience.PurchasePrompt.Title.PurchaseCompleted",
		PurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseCompleted",
		ErrorTitle = "CoreScripts.PremiumModal.Title.Error",
		GenericErrorBody = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		OkButtonText = "CoreScripts.PurchasePrompt.Button.OK",
		MultiItemPurchaseCompleteBody = "IAPExperience.PurchasePrompt.Body.PurchaseItemsSuccess"
	})
	local _ = nil
	local _ = nil
	local var6, var7 = useFocusNavigationRefsModule(p0.buttons.onClose or p0.buttons.onActivated, nil)
	local var8 = useTokens()
	local var9, var10 = reactModule.useState(foundationModule.Enums.IconName.CircleCheck)
	local var11 = fFlagEnableLaunchAfterPurchase and (p0.enableLaunchAfterPurchase == true and not p0.isError)
	local var12 = reactModule.useRef(p0.buttons.onShown)
	var12.current = p0.buttons.onShown
	reactModule.useEffect(function() --[[ line: 84 ]]
		-- upvalues: loggingProtocolModule (copy), unifiedProductPurchaseCompletionModalShownCounter (copy), fFlagEnableLaunchAfterPurchase (copy), var12 (ref)
		loggingProtocolModule.default:logRobloxTelemetryCounter(unifiedProductPurchaseCompletionModalShownCounter, 1, {})
		
		if fFlagEnableLaunchAfterPurchase and var12.current then
			var12.current()
		end
	end, {})
	local var13 = reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: p0 (ref), var5 (ref)
		return if p0.title then p0.title elseif p0.isError then var5.ErrorTitle else var5.PurchaseCompleteTitle
	end, { p0.title, p0.isError })
	local var14 = reactModule.useMemo(function() --[[ line: 101 ]]
		-- upvalues: p0 (ref), var5 (ref), formatTextWithParamsModule (copy)
		return if p0.bodyText then p0.bodyText elseif p0.isError then var5.GenericErrorBody elseif p0.isMultiItem then var5.MultiItemPurchaseCompleteBody else formatTextWithParamsModule(var5.PurchaseCompleteBody, { ITEM_NAME = p0.itemName or "" })
	end, { p0.bodyText, p0.isError, p0.isMultiItem, p0.itemName })
	reactModule.useEffect(function() --[[ line: 115 ]]
		-- upvalues: p0 (ref), var10 (ref), foundationModule (copy)
		if p0.isError then
			var10(foundationModule.Enums.IconName.TriangleExclamation)
			
			return
		end
		var10(foundationModule.Enums.IconName.CircleCheck)
	end, { p0.isError })
	
	return reactModule.createElement(dialog.Root, {
		closeOnClickOutside = true,
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = if p0.buttons.onClose then p0.buttons.onClose else p0.buttons.onActivated,
		ref = var6
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var13 }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			Body = reactModule.createElement(view, {
				tag = "col gap-large auto-y size-full-0 align-x-center align-y-center padding-top-small"
			}, {
				DialogIcon = reactModule.createElement(icon, { tag = "auto-xy", name = var9, size = var8.Size.Size_1200 }),
				Message = reactModule.createElement(text, {
					tag = "auto-xy text-body content-default text-align-x-left text-body-medium text-wrap",
					Text = var14
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Horizontal,
			actions = if var11 then {
				{
					isDisabled = false,
					icon = playSmall,
					variant = buttonVariant.Emphasis,
					onActivated = p0.buttons.onActivated,
					ref = var7
				}
			} else {
				{
					isDisabled = false,
					text = if p0.buttons and p0.buttons.text then p0.buttons.text else var5.OkButtonText,
					variant = buttonVariant.Emphasis,
					onActivated = p0.buttons.onActivated,
					ref = var7
				}
			}
		})
	})
end