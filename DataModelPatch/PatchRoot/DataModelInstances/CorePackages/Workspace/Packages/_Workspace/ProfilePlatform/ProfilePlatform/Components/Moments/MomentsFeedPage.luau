local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local MomentsCommonModule = require(Parent.MomentsCommon)
local MomentsModule = require(Parent.Moments)
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local ButtonSize = FoundationModule.Enums.ButtonSize
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local UseStatusBarHeightFunction = RobloxAppHooksModule.useStatusBarHeight
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local EventNames = MomentsCommonModule.Analytics.EventNames
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local Feed = MomentsModule.Feed
local MomentsImmersivePresentation = MomentsModule.MomentsImmersivePresentation
local CreateUserMomentsFeedSourceModule = require(Parent.Moments.CreateUserMomentsFeedSource)

local function MomentsFeedPageImmersive()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), UseScreenSizeFunction (copy), View (copy), MomentsImmersivePresentation (copy)
	local UseNavigationResult = UseNavigationFunction()
	local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
	local TargetUserId = if ExtraPropsParam and ExtraPropsParam.targetUserId then ExtraPropsParam.targetUserId else 0
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), TargetUserId (copy), UseNavigationResult (copy)
		FireAnalyticsEventFunction(EventNames.ProfileClosePressed, { userId = tostring(TargetUserId) })
		UseNavigationResult.goBack()
	end, { UseNavigationResult.goBack, TargetUserId })
	local UseScreenSizeResult = UseScreenSizeFunction()
	
	return ReactModule.createElement(View, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(UseScreenSizeResult.X, UseScreenSizeResult.Y)
	}, {
		Presentation = ReactModule.createElement(MomentsImmersivePresentation, {
			feedKind = "user",
			sessionSource = "profile",
			targetUserId = TargetUserId,
			initialIndex = if ExtraPropsParam and ExtraPropsParam.initialIndex then ExtraPropsParam.initialIndex else 1,
			onBack = UseResult
		})
	})
end

local function MomentsFeedPageLegacy()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), CreateUserMomentsFeedSourceModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), UseScreenSizeFunction (copy), UseSelectorFunction (copy), UseStatusBarHeightFunction (copy), View (copy), FoundationProvider (copy), Theme (copy), Feed (copy), IconButton (copy), ButtonSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
	local TargetUserId = if ExtraPropsParam and ExtraPropsParam.targetUserId then ExtraPropsParam.targetUserId else 0
	local InitialIndex = if ExtraPropsParam and ExtraPropsParam.initialIndex then ExtraPropsParam.initialIndex else 1
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateUserMomentsFeedSourceModule (upval), TargetUserId (copy), InitialIndex (copy)
		return CreateUserMomentsFeedSourceModule(TargetUserId, { initialIndex = InitialIndex })
	end, { TargetUserId, InitialIndex })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), TargetUserId (copy), UseNavigationResult (copy)
		FireAnalyticsEventFunction(EventNames.ProfileClosePressed, { userId = tostring(TargetUserId) })
		UseNavigationResult.goBack()
	end, { UseNavigationResult.goBack, TargetUserId })
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.GlobalGuiInset
	end)
	
	return ReactModule.createElement(View, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(UseScreenSizeResult.X, UseScreenSizeResult.Y),
		padding = {
			top = UDim.new(0, UseSelectorResult.top + UseStatusBarHeightFunction()),
			bottom = UDim.new(0, UseSelectorResult.bottom),
			left = UDim.new(0, UseSelectorResult.left),
			right = UDim.new(0, UseSelectorResult.right)
		}
	}, {
		OnVideoUI = ReactModule.createElement(FoundationProvider, { theme = Theme.Dark }, {
			Feed = ReactModule.createElement(Feed, {
				active = true,
				playbackActive = true,
				source = UseMemoResult,
				initialIndex = InitialIndex
			}),
			CloseButtonContainer = ReactModule.createElement(View, {
				tag = "position-top-left anchor-top-left auto-xy padding-large",
				ZIndex = 100000
			}, {
				CloseButton = ReactModule.createElement(IconButton, {
					icon = "icons/navigation/close",
					size = ButtonSize.Medium,
					onActivated = UseResult
				})
			})
		})
	})
end

return if require(Parent.SharedFlags).FFlagEnableArgusImmersiveNav then MomentsFeedPageImmersive else MomentsFeedPageLegacy