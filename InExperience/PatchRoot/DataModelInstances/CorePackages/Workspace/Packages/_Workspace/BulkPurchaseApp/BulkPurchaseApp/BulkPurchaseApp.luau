local guiService = game:GetService("GuiService")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local focusNavigableSurfaceIdentifierEnum = require(parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local bulkPurchaseErrorContainerModule = require(bulkPurchaseApp.Features.BulkPurchaseError.BulkPurchaseErrorContainer)
local bulkPurchaseSuccessContainerModule = require(bulkPurchaseApp.Features.BulkPurchaseSuccess.BulkPurchaseSuccessContainer)
local bulkPurchasePartialSuccessContainerModule = require(bulkPurchaseApp.Features.BulkPurchasePartialSuccess.BulkPurchasePartialSuccessContainer)
local bulkPurchaseRequestContainerModule = require(bulkPurchaseApp.Features.BulkPurchaseRequest.BulkPurchaseRequestContainer)
local screenSizeContext = require(parent.EconomyCommonCoreScriptHooks).ScreenSizeContext
local useBulkPurchaseRequestListenerEffectModule = require(bulkPurchaseApp.Hooks.useBulkPurchaseRequestListenerEffect)
local useFocusNavigationSurface = require(parent.EconomyCommonCoreScriptHooks).useFocusNavigationSurface
local focusNavigationModalSurface = require(parent.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface
local selectPromptStateModule = require(bulkPurchaseApp.Store.Selectors.selectPromptState)
local fixBulkPurchaseInputPerf = game:DefineFastFlag("FixBulkPurchaseInputPerf", false)

return function()
	-- upvalues: reactModule (ref), useSelector (ref), selectPromptStateModule (ref), fixBulkPurchaseInputPerf (ref), useFocusNavigationSurface (ref), focusNavigableSurfaceIdentifierEnum (ref), useBulkPurchaseRequestListenerEffectModule (ref), bulkPurchasePromptStateEnumModule (ref), guiService (ref), screenSizeContext (ref), focusNavigationModalSurface (ref), bulkPurchaseErrorContainerModule (ref), bulkPurchaseSuccessContainerModule (ref), bulkPurchaseRequestContainerModule (ref), bulkPurchasePartialSuccessContainerModule (ref)
	local var11, var12 = reactModule.useState(Vector2.new(0, 0))
	local var13 = useSelector(selectPromptStateModule)
	local var14 = if fixBulkPurchaseInputPerf then nil else useFocusNavigationSurface({
		selectionGroupName = "BulkPurchaseApp",
		focusNavigableSurfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	})
	useBulkPurchaseRequestListenerEffectModule()
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), bulkPurchasePromptStateEnumModule (copy), guiService (copy)
		if var13 == bulkPurchasePromptStateEnumModule.None then
			guiService.SelectedCoreObject = nil
		end
	end, { var13 })
	
	return reactModule.createElement(screenSizeContext.Provider, { value = var11 }, reactModule.createElement("ScreenGui", {
		[reactModule.Change.AbsoluteSize] = function(p0)
			-- upvalues: var12 (ref)
			var12(p0.AbsoluteSize)
		end,
		ScreenInsets = Enum.ScreenInsets.None
	}, {
		FocusNavigationEffects = if fixBulkPurchaseInputPerf then if var13 ~= bulkPurchasePromptStateEnumModule.None then nil else reactModule.createElement(focusNavigationModalSurface, { selectionGroupName = "BulkPurchaseApp" }, {
			Error = if var13 == bulkPurchasePromptStateEnumModule.Error then reactModule.createElement(bulkPurchaseErrorContainerModule) else nil,
			Success = if var13 == bulkPurchasePromptStateEnumModule.Success then reactModule.createElement(bulkPurchaseSuccessContainerModule) else nil,
			Request = if var13 == bulkPurchasePromptStateEnumModule.Request then reactModule.createElement(bulkPurchaseRequestContainerModule) else nil,
			PartialSuccess = if var13 == bulkPurchasePromptStateEnumModule.PartialSuccess then reactModule.createElement(bulkPurchasePartialSuccessContainerModule) else nil
		}) else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ref = if var13 == bulkPurchasePromptStateEnumModule.None then nil else var14,
			Size = UDim2.fromScale(1, 1),
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}, {
			Error = if var13 == bulkPurchasePromptStateEnumModule.Error then reactModule.createElement(bulkPurchaseErrorContainerModule) else nil,
			Success = if var13 == bulkPurchasePromptStateEnumModule.Success then reactModule.createElement(bulkPurchaseSuccessContainerModule) else nil,
			Request = if var13 == bulkPurchasePromptStateEnumModule.Request then reactModule.createElement(bulkPurchaseRequestContainerModule) else nil,
			PartialSuccess = if var13 == bulkPurchasePromptStateEnumModule.PartialSuccess then reactModule.createElement(bulkPurchasePartialSuccessContainerModule) else nil
		})
	}))
end