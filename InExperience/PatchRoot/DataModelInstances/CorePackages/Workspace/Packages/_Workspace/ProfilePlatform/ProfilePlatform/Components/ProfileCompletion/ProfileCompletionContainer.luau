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

return reactModule.memo(function(p0) --[[ line: 22 | named "ProfileCompletionContainer" ]]
	-- upvalues: useProfileAnalyticsContextModule (ref), useScreenSize (ref), useDynamicSizeMarginModule (ref), reactModule (ref), useProfileCompletionSduiContextModule (ref), socialServerDrivenUiModule (ref), useProfileCompletionDataModule (ref), roactNavigationModule (ref), socialSduiComponentWrapper (ref), enumsModule (ref)
	local var10 = useProfileAnalyticsContextModule()
	local var11 = useScreenSize()
	local var12, var13 = useDynamicSizeMarginModule()
	local var14, var15 = reactModule.useState(var11.X)
	local var16 = useProfileCompletionSduiContextModule({ sideMargin = var12, containerWidth = var14 })
	local var17 = reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: p0 (ref)
		return { collectionPosition = p0.layoutOrder }
	end, { p0.layoutOrder })
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useCallback(function(p1) --[[ line: 38 ]]
		-- upvalues: var13 (ref), var15 (ref)
		var13(p1)
		var15(p1.AbsoluteSize.X)
	end, { var13, var15 })
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: socialServerDrivenUiModule (copy)
		socialServerDrivenUiModule.registerSocialActions()
	end, {})
	local var20, var21 = useProfileCompletionDataModule()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		NavEvents = reactModule.createElement(roactNavigationModule.NavigationEvents, { onDidFocus = var21 }),
		Content = if var20 then reactModule.createElement(socialSduiComponentWrapper, {
			testId = "profile-completion",
			layoutOrder = p0.layoutOrder,
			sduiContext = var16,
			sduiComponentConfig = var20,
			pageSideMargin = var12,
			onFrameResized = var19,
			verticalScrollingFrameRef = var18,
			scrollViewPositionChangedSignal = var10.scrollViewPositionChangedSignal,
			analyticsContext = var17,
			debugName = enumsModule.Components.ProfileCompletion
		}) else nil
	})
end)