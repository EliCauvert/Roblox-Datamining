local playersService = game:GetService("Players")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local appCompositionModule = require(parent.AppComposition)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local useCompositionLayout = appCompositionModule.useCompositionLayout
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useStatusBarHeight = momentsCommonModule.Hooks.useStatusBarHeight
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local useLocalization = localizationModule.Hooks.useLocalization
local getFFlagMomentsAndroidTvEnabledModule = require(moments.Flags.GetFFlagMomentsAndroidTvEnabled)
local fFlagMomentsFtuxTooltipCreateCopyModule = require(moments.Flags.FFlagMomentsFtuxTooltipCreateCopy)
local _ = require(script.Parent.MomentsHeaderView)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local t = {
	title = "Feature.Moments.Tooltip.ShareFirstMomentTitle",
	text = "Feature.Moments.Tooltip.ShareFirstMomentBody"
}

local function noop() end

local function _()
	-- upvalues: playersService (ref)
	return {
		identifier = "create_moment",
		userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
		timestamp = tostring(os.time())
	}
end

return function(p1, p2, p3)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useSetDrawerVisible (ref), useIsTvRemoteDevice (ref), useCompositionLayout (ref), useStatusBarHeight (ref), fFlagMomentsFtuxTooltipCreateCopyModule (ref), useLocalization (ref), t (ref), noop (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), playersService (ref), getFFlagMomentsAndroidTvEnabledModule (ref)
	local var1 = useTokens()
	local var2 = useDeviceInsets()
	local var3 = useSetDrawerVisible()
	local var4 = useIsTvRemoteDevice()
	local var5 = useCompositionLayout()
	local var6 = useStatusBarHeight()
	local size1400 = var1.Size.Size_1400
	local var7 = p1.showFtuxTooltip == true
	local var8 = ""
	local var9 = ""
	
	if fFlagMomentsFtuxTooltipCreateCopyModule then
		local var10 = useLocalization(t)
		var8 = var10.title
		var9 = var10.text
	end
	local onFtuxTooltipDismissed = p1.onFtuxTooltipDismissed or noop
	local onCreatePressed = p1.onCreatePressed or noop
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), fireAnalyticsEvent (copy), eventNames (copy), playersService (copy)
		if var7 then
			fireAnalyticsEvent(eventNames.FTUXTooltipImpression, {
				identifier = "create_moment",
				userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
		end
	end, { var7 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), playersService (copy), onFtuxTooltipDismissed (ref)
		fireAnalyticsEvent(eventNames.FTUXTooltipDismissed, {
			identifier = "create_moment",
			userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
			timestamp = tostring(os.time())
		})
		onFtuxTooltipDismissed()
	end, { onFtuxTooltipDismissed })
	local margin = var5.margin
	
	return {
		layoutOrder = if p2 then nil else p1.layoutOrder,
		variant = p1.variant,
		showFtuxTooltip = var7,
		ftuxTooltipTitle = var8,
		ftuxTooltipText = var9,
		onCreateMomentButtonPressed = reactModule.useCallback(function()
			-- upvalues: var7 (ref), var11 (ref), onCreatePressed (ref)
			if var7 then
				var11()
			end
			onCreatePressed()
		end, { var7, var11, onCreatePressed }),
		onFtuxTooltipClosed = var11,
		onHamburgerPressed = reactModule.useCallback(function()
			-- upvalues: var3 (ref)
			var3(true)
		end, { var3 }),
		onBack = p1.onBack or noop,
		onClose = p1.onClose or noop,
		onNavigateToTrending = p1.onNavigateToTrending or noop,
		onNavigateToMyMoments = p1.onNavigateToMyMoments or noop,
		title = p1.title or "",
		showTopScrim = p1.showTopScrim == true,
		showInteractiveButtons = not (getFFlagMomentsAndroidTvEnabledModule() and var4),
		showHamburger = p3,
		showCreateButton = p1.onCreatePressed ~= nil,
		showNavigationMenu = p1.onNavigateToTrending ~= nil and p1.onNavigateToMyMoments ~= nil,
		headerHeight = size1400,
		headerPadding = {
			left = UDim.new(0, math.max(var2.left, margin)),
			right = UDim.new(0, math.max(var2.right, margin)),
			top = UDim.new(0, var6)
		},
		titleTextStyle = var1.Color.Content.Emphasis,
		scrimHeight = var2.top + var1.Size.Size_2000 + var1.Size.Size_1600
	}
end