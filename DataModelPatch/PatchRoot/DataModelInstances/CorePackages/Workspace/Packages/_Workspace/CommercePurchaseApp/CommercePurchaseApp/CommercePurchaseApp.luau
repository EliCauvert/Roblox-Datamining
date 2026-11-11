local GuiService = game:GetService("GuiService")
local CommercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local Parent = CommercePurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local Toast = require(Parent.ToastLite).Components.Toast
local CommercePurchasePromptStateEnumModule = require(CommercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local CommercePurchaseErrorContainerModule = require(CommercePurchaseApp.Features.CommercePurchaseError.CommercePurchaseErrorContainer)
local ScreenSizeContext = require(Parent.EconomyCommonCoreScriptHooks).ScreenSizeContext
local UseBenefitStatusReceivedListenerEffectModule = require(CommercePurchaseApp.Hooks.useBenefitStatusReceivedListenerEffect)
local UseCommerceProductPurchaseRequestListenerEffectModule = require(CommercePurchaseApp.Hooks.useCommerceProductPurchaseRequestListenerEffect)
local FocusNavigationModalSurface = require(Parent.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface
local UsePurchaseBrowserClosedListenerEffectModule = require(CommercePurchaseApp.Hooks.usePurchaseBrowserClosedListenerEffect)
local SelectPromptStateModule = require(CommercePurchaseApp.Store.Selectors.selectPromptState)

return function()
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), SelectPromptStateModule (copy), UseBenefitStatusReceivedListenerEffectModule (copy), UsePurchaseBrowserClosedListenerEffectModule (copy), UseCommerceProductPurchaseRequestListenerEffectModule (copy), CommercePurchasePromptStateEnumModule (copy), GuiService (copy), ScreenSizeContext (copy), FocusNavigationModalSurface (copy), CommercePurchaseErrorContainerModule (copy), Toast (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseSelectorResult = UseSelectorFunction(SelectPromptStateModule)
	UseBenefitStatusReceivedListenerEffectModule()
	UsePurchaseBrowserClosedListenerEffectModule()
	UseCommerceProductPurchaseRequestListenerEffectModule()
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), CommercePurchasePromptStateEnumModule (upval), GuiService (upval)
		if UseSelectorResult == CommercePurchasePromptStateEnumModule.None then
			GuiService.SelectedCoreObject = nil
		end
	end, { UseSelectorResult })
	
	return if UseSelectorResult == CommercePurchasePromptStateEnumModule.None then nil else ReactModule.createElement(ScreenSizeContext.Provider, { value = UseStateResult }, ReactModule.createElement("ScreenGui", {
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = ReactModule.createElement(FocusNavigationModalSurface, { selectionGroupName = "CommercePurchaseApp" }, {
			Error = if UseSelectorResult == CommercePurchasePromptStateEnumModule.Error then ReactModule.createElement(CommercePurchaseErrorContainerModule) else nil,
			Toast = ReactModule.createElement(Toast)
		})
	}))
end