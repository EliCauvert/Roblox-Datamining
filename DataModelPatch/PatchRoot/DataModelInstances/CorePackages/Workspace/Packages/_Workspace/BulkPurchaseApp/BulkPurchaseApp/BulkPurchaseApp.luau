local GuiService = game:GetService("GuiService")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local BulkPurchasePromptStateEnumModule = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local BulkPurchaseErrorContainerModule = require(BulkPurchaseApp.Features.BulkPurchaseError.BulkPurchaseErrorContainer)
local BulkPurchaseSuccessContainerModule = require(BulkPurchaseApp.Features.BulkPurchaseSuccess.BulkPurchaseSuccessContainer)
local BulkPurchasePartialSuccessContainerModule = require(BulkPurchaseApp.Features.BulkPurchasePartialSuccess.BulkPurchasePartialSuccessContainer)
local BulkPurchaseRequestContainerModule = require(BulkPurchaseApp.Features.BulkPurchaseRequest.BulkPurchaseRequestContainer)
local ScreenSizeContext = require(Parent.EconomyCommonCoreScriptHooks).ScreenSizeContext
local UseBulkPurchaseRequestListenerEffectModule = require(BulkPurchaseApp.Hooks.useBulkPurchaseRequestListenerEffect)
local UseFocusNavigationSurfaceFunction = require(Parent.EconomyCommonCoreScriptHooks).useFocusNavigationSurface
local FocusNavigationModalSurface = require(Parent.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface
local SelectPromptStateModule = require(BulkPurchaseApp.Store.Selectors.selectPromptState)
local FixBulkPurchaseInputPerf = game:DefineFastFlag("FixBulkPurchaseInputPerf", false)

return function()
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), SelectPromptStateModule (copy), FixBulkPurchaseInputPerf (copy), UseFocusNavigationSurfaceFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseBulkPurchaseRequestListenerEffectModule (copy), BulkPurchasePromptStateEnumModule (copy), GuiService (copy), ScreenSizeContext (copy), FocusNavigationModalSurface (copy), BulkPurchaseErrorContainerModule (copy), BulkPurchaseSuccessContainerModule (copy), BulkPurchaseRequestContainerModule (copy), BulkPurchasePartialSuccessContainerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseSelectorResult = UseSelectorFunction(SelectPromptStateModule)
	local UseFocusNavigationSurfaceResult = if FixBulkPurchaseInputPerf then nil else UseFocusNavigationSurfaceFunction({
		selectionGroupName = "BulkPurchaseApp",
		focusNavigableSurfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
	})
	UseBulkPurchaseRequestListenerEffectModule()
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), BulkPurchasePromptStateEnumModule (upval), GuiService (upval)
		if UseSelectorResult == BulkPurchasePromptStateEnumModule.None then
			GuiService.SelectedCoreObject = nil
		end
	end, { UseSelectorResult })
	
	return ReactModule.createElement(ScreenSizeContext.Provider, { value = UseStateResult }, ReactModule.createElement("ScreenGui", {
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = if FixBulkPurchaseInputPerf then if UseSelectorResult == BulkPurchasePromptStateEnumModule.None then nil else ReactModule.createElement(FocusNavigationModalSurface, { selectionGroupName = "BulkPurchaseApp" }, {
			Error = if UseSelectorResult == BulkPurchasePromptStateEnumModule.Error then ReactModule.createElement(BulkPurchaseErrorContainerModule) else nil,
			Success = if UseSelectorResult == BulkPurchasePromptStateEnumModule.Success then ReactModule.createElement(BulkPurchaseSuccessContainerModule) else nil,
			Request = if UseSelectorResult == BulkPurchasePromptStateEnumModule.Request then ReactModule.createElement(BulkPurchaseRequestContainerModule) else nil,
			PartialSuccess = if UseSelectorResult == BulkPurchasePromptStateEnumModule.PartialSuccess then ReactModule.createElement(BulkPurchasePartialSuccessContainerModule) else nil
		}) else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ref = if UseSelectorResult == BulkPurchasePromptStateEnumModule.None then nil else UseFocusNavigationSurfaceResult,
			Size = UDim2.fromScale(1, 1),
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}, {
			Error = if UseSelectorResult == BulkPurchasePromptStateEnumModule.Error then ReactModule.createElement(BulkPurchaseErrorContainerModule) else nil,
			Success = if UseSelectorResult == BulkPurchasePromptStateEnumModule.Success then ReactModule.createElement(BulkPurchaseSuccessContainerModule) else nil,
			Request = if UseSelectorResult == BulkPurchasePromptStateEnumModule.Request then ReactModule.createElement(BulkPurchaseRequestContainerModule) else nil,
			PartialSuccess = if UseSelectorResult == BulkPurchasePromptStateEnumModule.PartialSuccess then ReactModule.createElement(BulkPurchasePartialSuccessContainerModule) else nil
		})
	}))
end