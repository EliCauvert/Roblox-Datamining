local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SocialServerDrivenUiModule = require(Parent.SocialServerDrivenUi)
local SocialSduiComponentWrapper = SocialServerDrivenUiModule.SocialSduiComponentWrapper
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local UseProfileCompletionSduiContextModule = require(ProfilePlatform.Hooks.useProfileCompletionSduiContext)
local UseProfileCompletionDataModule = require(ProfilePlatform.Hooks.useProfileCompletionData)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize

return ReactModule.memo(function(p1) --[[ Line: 22 | Named "ProfileCompletionContainer" ]]
	-- upvalues: UseProfileAnalyticsContextModule (copy), UseScreenSizeFunction (copy), UseDynamicSizeMarginModule (copy), ReactModule (copy), UseProfileCompletionSduiContextModule (copy), SocialServerDrivenUiModule (copy), UseProfileCompletionDataModule (copy), RoactNavigationModule (copy), SocialSduiComponentWrapper (copy), EnumsModule (copy)
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseScreenSizeResult.X)
	local UseProfileCompletionSduiContextModuleResult = UseProfileCompletionSduiContextModule({
		sideMargin = UseDynamicSizeMarginModuleResult,
		containerWidth = UseStateResult
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 33 ]]
		-- upvalues: p1 (copy)
		return { collectionPosition = p1.layoutOrder }
	end, { p1.layoutOrder })
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 38 ]]
		-- upvalues: UseDynamicSizeMarginModuleResult2 (copy), UseStateResult2 (copy)
		UseDynamicSizeMarginModuleResult2(Frame)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, { UseDynamicSizeMarginModuleResult2, UseStateResult2 })
	ReactModule.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: SocialServerDrivenUiModule (upval)
		SocialServerDrivenUiModule.registerSocialActions()
	end, {})
	local UseProfileCompletionDataModuleResult, UseProfileCompletionDataModuleResult2 = UseProfileCompletionDataModule()
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		NavEvents = ReactModule.createElement(RoactNavigationModule.NavigationEvents, { onDidFocus = UseProfileCompletionDataModuleResult2 }),
		Content = if UseProfileCompletionDataModuleResult then ReactModule.createElement(SocialSduiComponentWrapper, {
			testId = "profile-completion",
			layoutOrder = p1.layoutOrder,
			sduiContext = UseProfileCompletionSduiContextModuleResult,
			sduiComponentConfig = UseProfileCompletionDataModuleResult,
			pageSideMargin = UseDynamicSizeMarginModuleResult,
			onFrameResized = UseResult,
			verticalScrollingFrameRef = UseRefResult,
			scrollViewPositionChangedSignal = UseProfileAnalyticsContextModuleResult.scrollViewPositionChangedSignal,
			analyticsContext = UseMemoResult,
			debugName = EnumsModule.Components.ProfileCompletion
		}) else nil
	})
end)