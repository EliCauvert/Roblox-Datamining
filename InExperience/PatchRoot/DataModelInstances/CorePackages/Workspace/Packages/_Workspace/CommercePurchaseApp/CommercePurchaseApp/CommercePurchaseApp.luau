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

return function()
	-- upvalues: reactModule (ref), useSelector (ref), selectPromptStateModule (ref), useBenefitStatusReceivedListenerEffectModule (ref), usePurchaseBrowserClosedListenerEffectModule (ref), useCommerceProductPurchaseRequestListenerEffectModule (ref), commercePurchasePromptStateEnumModule (ref), guiService (ref), screenSizeContext (ref), focusNavigationModalSurface (ref), commercePurchaseErrorContainerModule (ref), toast (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3 = useSelector(selectPromptStateModule)
	useBenefitStatusReceivedListenerEffectModule()
	usePurchaseBrowserClosedListenerEffectModule()
	useCommerceProductPurchaseRequestListenerEffectModule()
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), commercePurchasePromptStateEnumModule (copy), guiService (copy)
		if var3 == commercePurchasePromptStateEnumModule.None then
			guiService.SelectedCoreObject = nil
		end
	end, { var3 })
	
	return if var3 == commercePurchasePromptStateEnumModule.None then nil else reactModule.createElement(screenSizeContext.Provider, { value = var1 }, reactModule.createElement("ScreenGui", {
		[reactModule.Change.AbsoluteSize] = function(p1)
			-- upvalues: var2 (ref)
			var2(p1.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = reactModule.createElement(focusNavigationModalSurface, { selectionGroupName = "CommercePurchaseApp" }, {
			Error = if var3 == commercePurchasePromptStateEnumModule.Error then reactModule.createElement(commercePurchaseErrorContainerModule) else nil,
			Toast = reactModule.createElement(toast)
		})
	}))
end