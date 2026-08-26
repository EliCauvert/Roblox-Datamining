local guiService = game:GetService("GuiService")
local cancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local parent = cancelSubscriptionApp.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local cancelUserSubscriptionRequestContainerModule = require(cancelSubscriptionApp.Features.CancelSubscriptionRequest.CancelUserSubscriptionRequestContainer)
local cancelUserSubscriptionErrorContainerModule = require(cancelSubscriptionApp.Features.CancelSubscriptionError.CancelUserSubscriptionErrorContainer)
local cancelUserSubscriptionSuccessContainerModule = require(cancelSubscriptionApp.Features.CancelSubscriptionSuccess.CancelUserSubscriptionSuccessContainer)
local screenSizeContext = require(parent.EconomyCommonCoreScriptHooks).ScreenSizeContext
local useCancelSubscriptionRequestedListenerEffectModule = require(cancelSubscriptionApp.Hooks.useCancelSubscriptionRequestedListenerEffect)
local selectPromptStateModule = require(cancelSubscriptionApp.Store.Selectors.selectPromptState)
local cancelUserSubscriptionAsyncPromptStateEnumModule = require(cancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)
local focusNavigationModalSurface = require(parent.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface

return function()
	-- upvalues: reactModule (ref), useSelector (ref), selectPromptStateModule (ref), useCancelSubscriptionRequestedListenerEffectModule (ref), cancelUserSubscriptionAsyncPromptStateEnumModule (ref), guiService (ref), screenSizeContext (ref), focusNavigationModalSurface (ref), cancelUserSubscriptionErrorContainerModule (ref), cancelUserSubscriptionSuccessContainerModule (ref), cancelUserSubscriptionRequestContainerModule (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3 = useSelector(selectPromptStateModule)
	useCancelSubscriptionRequestedListenerEffectModule(var3)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), cancelUserSubscriptionAsyncPromptStateEnumModule (copy), guiService (copy)
		if var3 == cancelUserSubscriptionAsyncPromptStateEnumModule.None then
			guiService.SelectedCoreObject = nil
		end
	end, { var3 })
	
	return if var3 == cancelUserSubscriptionAsyncPromptStateEnumModule.None then nil else reactModule.createElement(screenSizeContext.Provider, { value = var1 }, reactModule.createElement("ScreenGui", {
		[reactModule.Change.AbsoluteSize] = function(p1)
			-- upvalues: var2 (ref)
			var2(p1.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = reactModule.createElement(focusNavigationModalSurface, { selectionGroupName = "CancelSubscriptionApp" }, {
			Error = if var3 == cancelUserSubscriptionAsyncPromptStateEnumModule.Error then reactModule.createElement(cancelUserSubscriptionErrorContainerModule) else nil,
			Success = if var3 == cancelUserSubscriptionAsyncPromptStateEnumModule.Success then reactModule.createElement(cancelUserSubscriptionSuccessContainerModule) else nil,
			Request = if var3 == cancelUserSubscriptionAsyncPromptStateEnumModule.Request then reactModule.createElement(cancelUserSubscriptionRequestContainerModule) else nil
		})
	}))
end