local guiService = game:GetService("GuiService")
local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local parent = commercePurchaseApp.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local toast = require(parent.ToastLite).Components.Toast
local commercePurchasePromptStateEnumModule = require(commercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local commercePurchaseErrorContainerModule = require(commercePurchaseApp.Features.CommercePurchaseError.CommercePurchaseErrorContainer)
local screenSizeContext = require(parent.EconomyCommonCoreScriptHooks).ScreenSizeContext
local useBenefitStatusReceivedListenerEffectModule = require(commercePurchaseApp.Hooks.useBenefitStatusReceivedListenerEffect)
local useCommerceProductPurchaseRequestListenerEffectModule = require(commercePurchaseApp.Hooks.useCommerceProductPurchaseRequestListenerEffect)
local focusNavigationModalSurface = require(parent.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface
local usePurchaseBrowserClosedListenerEffectModule = require(commercePurchaseApp.Hooks.usePurchaseBrowserClosedListenerEffect)
local selectPromptStateModule = require(commercePurchaseApp.Store.Selectors.selectPromptState)

return function() --[[ line: 20 | named "CommercePurchaseApp" ]]
	-- upvalues: reactModule (ref), useSelector (ref), selectPromptStateModule (ref), useBenefitStatusReceivedListenerEffectModule (ref), usePurchaseBrowserClosedListenerEffectModule (ref), useCommerceProductPurchaseRequestListenerEffectModule (ref), commercePurchasePromptStateEnumModule (ref), guiService (ref), screenSizeContext (ref), focusNavigationModalSurface (ref), commercePurchaseErrorContainerModule (ref), toast (ref)
	local var9, var10 = reactModule.useState(Vector2.new(0, 0))
	local var11 = useSelector(selectPromptStateModule)
	useBenefitStatusReceivedListenerEffectModule()
	usePurchaseBrowserClosedListenerEffectModule()
	useCommerceProductPurchaseRequestListenerEffectModule()
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: var11 (ref), commercePurchasePromptStateEnumModule (copy), guiService (copy)
		if var11 == commercePurchasePromptStateEnumModule.None then
			guiService.SelectedCoreObject = nil
		end
	end, { var11 })
	
	return if var11 == commercePurchasePromptStateEnumModule.None then nil else reactModule.createElement(screenSizeContext.Provider, { value = var9 }, reactModule.createElement("ScreenGui", {
		[reactModule.Change.AbsoluteSize] = function(p0) --[[ line: 39 ]]
			-- upvalues: var10 (ref)
			var10(p0.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = reactModule.createElement(focusNavigationModalSurface, { selectionGroupName = "CommercePurchaseApp" }, {
			Error = if var11 == commercePurchasePromptStateEnumModule.Error then reactModule.createElement(commercePurchaseErrorContainerModule) else nil,
			Toast = reactModule.createElement(toast)
		})
	}))
end