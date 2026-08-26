local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local socialServerDrivenUiModule = require(parent.SocialServerDrivenUi)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local socialSduiComponentWrapper = socialServerDrivenUiModule.SocialSduiComponentWrapper
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useProfileCompletionSduiContextModule = require(profilePlatform.Hooks.useProfileCompletionSduiContext)
local useProfileCompletionDataModule = require(profilePlatform.Hooks.useProfileCompletionData)
local enumsModule = require(profilePlatform.Common.Enums)
local useScreenSize = robloxAppHooksModule.useScreenSize

return reactModule.memo(function(p1)
	-- upvalues: useProfileAnalyticsContextModule (ref), useScreenSize (ref), useDynamicSizeMarginModule (ref), reactModule (ref), useProfileCompletionSduiContextModule (ref), socialServerDrivenUiModule (ref), useProfileCompletionDataModule (ref), roactNavigationModule (ref), socialSduiComponentWrapper (ref), enumsModule (ref)
	local var1 = useProfileAnalyticsContextModule()
	local var2 = useScreenSize()
	local var3, var4 = useDynamicSizeMarginModule()
	local var5, var6 = reactModule.useState(var2.X)
	local var7 = useProfileCompletionSduiContextModule({ sideMargin = var3, containerWidth = var5 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return { collectionPosition = p1.layoutOrder }
	end, { p1.layoutOrder })
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var6 (ref)
		var4(p2)
		var6(p2.AbsoluteSize.X)
	end, { var4, var6 })
	reactModule.useEffect(function()
		-- upvalues: socialServerDrivenUiModule (copy)
		socialServerDrivenUiModule.registerSocialActions()
	end, {})
	local var11, var12 = useProfileCompletionDataModule()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		NavEvents = reactModule.createElement(roactNavigationModule.NavigationEvents, { onDidFocus = var12 }),
		Content = if var11 then reactModule.createElement(socialSduiComponentWrapper, {
			testId = "profile-completion",
			layoutOrder = p1.layoutOrder,
			sduiContext = var7,
			sduiComponentConfig = var11,
			pageSideMargin = var3,
			onFrameResized = var10,
			verticalScrollingFrameRef = var9,
			scrollViewPositionChangedSignal = var1.scrollViewPositionChangedSignal,
			analyticsContext = var8,
			debugName = enumsModule.Components.ProfileCompletion
		}) else nil
	})
end)