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
	local var9, var10 = reactModule.useState(Vector2.new(0, 0))
	local var11 = useSelector(selectPromptStateModule)
	useCancelSubscriptionRequestedListenerEffectModule(var11)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), cancelUserSubscriptionAsyncPromptStateEnumModule (copy), guiService (copy)
		if var11 == cancelUserSubscriptionAsyncPromptStateEnumModule.None then
			guiService.SelectedCoreObject = nil
		end
	end, { var11 })
	
	return if var11 == cancelUserSubscriptionAsyncPromptStateEnumModule.None then nil else reactModule.createElement(screenSizeContext.Provider, { value = var9 }, reactModule.createElement("ScreenGui", {
		[reactModule.Change.AbsoluteSize] = function(p0)
			-- upvalues: var10 (ref)
			var10(p0.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = reactModule.createElement(focusNavigationModalSurface, { selectionGroupName = "CancelSubscriptionApp" }, {
			Error = if var11 == cancelUserSubscriptionAsyncPromptStateEnumModule.Error then reactModule.createElement(cancelUserSubscriptionErrorContainerModule) else nil,
			Success = if var11 == cancelUserSubscriptionAsyncPromptStateEnumModule.Success then reactModule.createElement(cancelUserSubscriptionSuccessContainerModule) else nil,
			Request = if var11 == cancelUserSubscriptionAsyncPromptStateEnumModule.Request then reactModule.createElement(cancelUserSubscriptionRequestContainerModule) else nil
		})
	}))
end