local GuiService = game:GetService("GuiService")
local CancelSubscriptionApp = script:FindFirstAncestor("CancelSubscriptionApp")
local Parent = CancelSubscriptionApp.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CancelUserSubscriptionRequestContainerModule = require(CancelSubscriptionApp.Features.CancelSubscriptionRequest.CancelUserSubscriptionRequestContainer)
local CancelUserSubscriptionErrorContainerModule = require(CancelSubscriptionApp.Features.CancelSubscriptionError.CancelUserSubscriptionErrorContainer)
local CancelUserSubscriptionSuccessContainerModule = require(CancelSubscriptionApp.Features.CancelSubscriptionSuccess.CancelUserSubscriptionSuccessContainer)
local ScreenSizeContext = require(Parent.EconomyCommonCoreScriptHooks).ScreenSizeContext
local UseCancelSubscriptionRequestedListenerEffectModule = require(CancelSubscriptionApp.Hooks.useCancelSubscriptionRequestedListenerEffect)
local SelectPromptStateModule = require(CancelSubscriptionApp.Store.Selectors.selectPromptState)
local CancelUserSubscriptionAsyncPromptStateEnumModule = require(CancelSubscriptionApp.Enums.CancelUserSubscriptionAsyncPromptStateEnum)
local FocusNavigationModalSurface = require(Parent.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface

return function() --[[ Line: 20 | Named "CancelSubscriptionApp" ]]
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), SelectPromptStateModule (copy), UseCancelSubscriptionRequestedListenerEffectModule (copy), CancelUserSubscriptionAsyncPromptStateEnumModule (copy), GuiService (copy), ScreenSizeContext (copy), FocusNavigationModalSurface (copy), CancelUserSubscriptionErrorContainerModule (copy), CancelUserSubscriptionSuccessContainerModule (copy), CancelUserSubscriptionRequestContainerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseSelectorResult = UseSelectorFunction(SelectPromptStateModule)
	UseCancelSubscriptionRequestedListenerEffectModule(UseSelectorResult)
	ReactModule.useEffect(function() --[[ Line: 26 ]]
		-- upvalues: UseSelectorResult (copy), CancelUserSubscriptionAsyncPromptStateEnumModule (upval), GuiService (upval)
		if UseSelectorResult == CancelUserSubscriptionAsyncPromptStateEnumModule.None then
			GuiService.SelectedCoreObject = nil
		end
	end, { UseSelectorResult })
	
	return if UseSelectorResult == CancelUserSubscriptionAsyncPromptStateEnumModule.None then nil else ReactModule.createElement(ScreenSizeContext.Provider, { value = UseStateResult }, ReactModule.createElement("ScreenGui", {
		[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 37 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = ReactModule.createElement(FocusNavigationModalSurface, { selectionGroupName = "CancelSubscriptionApp" }, {
			Error = if UseSelectorResult == CancelUserSubscriptionAsyncPromptStateEnumModule.Error then ReactModule.createElement(CancelUserSubscriptionErrorContainerModule) else nil,
			Success = if UseSelectorResult == CancelUserSubscriptionAsyncPromptStateEnumModule.Success then ReactModule.createElement(CancelUserSubscriptionSuccessContainerModule) else nil,
			Request = if UseSelectorResult == CancelUserSubscriptionAsyncPromptStateEnumModule.Request then ReactModule.createElement(CancelUserSubscriptionRequestContainerModule) else nil
		})
	}))
end