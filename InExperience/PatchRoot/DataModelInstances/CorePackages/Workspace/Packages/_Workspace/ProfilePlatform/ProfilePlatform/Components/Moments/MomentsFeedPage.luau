local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local roactUtilsModule = require(parent.RoactUtils)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsModule = require(parent.Moments)
local fFlagEnableArgusImmersiveNav = require(parent.SharedFlags).FFlagEnableArgusImmersiveNav
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local buttonSize = foundationModule.Enums.ButtonSize
local foundationProvider = foundationModule.FoundationProvider
local theme = foundationModule.Enums.Theme
local useScreenSize = robloxAppHooksModule.useScreenSize
local useStatusBarHeight = robloxAppHooksModule.useStatusBarHeight
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fireAnalyticsEvent = momentsCommonModule.Analytics.fireAnalyticsEvent
local eventNames = momentsCommonModule.Analytics.EventNames
local useNavigation = navigationModule.useNavigation
local feed = momentsModule.Feed
local momentsImmersivePresentation = momentsModule.MomentsImmersivePresentation
local createUserMomentsFeedSourceModule = require(parent.Moments.CreateUserMomentsFeedSource)

return if fFlagEnableArgusImmersiveNav then function() --[[ line: 50 | named "MomentsFeedPageImmersive" ]]
	-- upvalues: useNavigation (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), useScreenSize (ref), view (ref), momentsImmersivePresentation (ref)
	local var16 = useNavigation()
	local extraProps = var16.getParam("extraProps")
	local var18 = if extraProps and extraProps.targetUserId then extraProps.targetUserId else 0
	local var19 = useScreenSize()
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(var19.X, var19.Y)
	}, {
		Presentation = reactModule.createElement(momentsImmersivePresentation, {
			feedKind = "user",
			sessionSource = "profile",
			targetUserId = var18,
			initialIndex = if extraProps and extraProps.initialIndex then extraProps.initialIndex else 1,
			onBack = reactModule.useCallback(function() --[[ line: 57 ]]
				-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var18 (ref), var16 (ref)
				fireAnalyticsEvent(eventNames.ProfileClosePressed, { userId = tostring(var18) })
				var16.goBack()
			end, { var16.goBack, var18 })
		})
	})
end else function() --[[ line: 86 | named "MomentsFeedPageLegacy" ]]
	-- upvalues: useNavigation (ref), reactModule (ref), createUserMomentsFeedSourceModule (ref), fireAnalyticsEvent (ref), eventNames (ref), useScreenSize (ref), useSelector (ref), useStatusBarHeight (ref), view (ref), foundationProvider (ref), theme (ref), feed (ref), iconButton (ref), buttonSize (ref)
	local var8 = useNavigation()
	local extraProps = var8.getParam("extraProps")
	local var10 = if extraProps and extraProps.targetUserId then extraProps.targetUserId else 0
	local var11 = if extraProps and extraProps.initialIndex then extraProps.initialIndex else 1
	local var12 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: createUserMomentsFeedSourceModule (copy), var10 (ref), var11 (ref)
		return createUserMomentsFeedSourceModule(var10, { initialIndex = var11 })
	end, { var10, var11 })
	local var13 = reactModule.useCallback(function() --[[ line: 99 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var10 (ref), var8 (ref)
		fireAnalyticsEvent(eventNames.ProfileClosePressed, { userId = tostring(var10) })
		var8.goBack()
	end, { var8.goBack, var10 })
	local var14 = useScreenSize()
	local var15 = useSelector(function(p0) --[[ line: 109 ]]
		return p0.GlobalGuiInset
	end)
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.fromOffset(var14.X, var14.Y),
		padding = {
			top = UDim.new(0, var15.top + useStatusBarHeight()),
			bottom = UDim.new(0, var15.bottom),
			left = UDim.new(0, var15.left),
			right = UDim.new(0, var15.right)
		}
	}, {
		OnVideoUI = reactModule.createElement(foundationProvider, { theme = theme.Dark }, {
			Feed = reactModule.createElement(feed, {
				active = true,
				playbackActive = true,
				source = var12,
				initialIndex = var11
			}),
			CloseButtonContainer = reactModule.createElement(view, {
				tag = "position-top-left anchor-top-left auto-xy padding-large",
				ZIndex = 100000
			}, {
				CloseButton = reactModule.createElement(iconButton, {
					icon = "icons/navigation/close",
					size = buttonSize.Medium,
					onActivated = var13
				})
			})
		})
	})
end