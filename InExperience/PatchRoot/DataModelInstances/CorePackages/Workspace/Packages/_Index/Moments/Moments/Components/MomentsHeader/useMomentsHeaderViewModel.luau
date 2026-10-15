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
local fFlagMomentsUseFoundationHeaderBarModule = require(moments.Flags.FFlagMomentsUseFoundationHeaderBar)
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
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useSetDrawerVisible (ref), useIsTvRemoteDevice (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useCompositionLayout (ref), useStatusBarHeight (ref), fFlagMomentsFtuxTooltipCreateCopyModule (ref), useLocalization (ref), t (ref), noop (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), playersService (ref), getFFlagMomentsAndroidTvEnabledModule (ref)
	local var1 = useTokens()
	local var2 = useDeviceInsets()
	local var3 = useSetDrawerVisible()
	local var4 = useIsTvRemoteDevice()
	local var5 = nil
	local var6 = nil
	local var7 = 0
	
	if fFlagMomentsUseFoundationHeaderBarModule then
		var5 = useCompositionLayout()
		var6 = useStatusBarHeight()
		var7 = var1.Size.Size_1400
	end
	local var8 = p1.showFtuxTooltip == true
	local var9 = ""
	local var10 = ""
	
	if fFlagMomentsFtuxTooltipCreateCopyModule then
		local var11 = useLocalization(t)
		var9 = var11.title
		var10 = var11.text
	end
	local onFtuxTooltipDismissed = p1.onFtuxTooltipDismissed or noop
	local onCreatePressed = p1.onCreatePressed or noop
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), fireAnalyticsEvent (copy), eventNames (copy), playersService (copy)
		if var8 then
			fireAnalyticsEvent(eventNames.FTUXTooltipImpression, {
				identifier = "create_moment",
				userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
		end
	end, { var8 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), playersService (copy), onFtuxTooltipDismissed (ref)
		fireAnalyticsEvent(eventNames.FTUXTooltipDismissed, {
			identifier = "create_moment",
			userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
			timestamp = tostring(os.time())
		})
		onFtuxTooltipDismissed()
	end, { onFtuxTooltipDismissed })
	local var13 = if var5 ~= nil then 0 else var5.margin
	
	return {
		layoutOrder = if p2 then nil else p1.layoutOrder,
		variant = p1.variant,
		showFtuxTooltip = var8,
		ftuxTooltipTitle = var9,
		ftuxTooltipText = var10,
		onCreateMomentButtonPressed = reactModule.useCallback(function()
			-- upvalues: var8 (ref), var12 (ref), onCreatePressed (ref)
			if var8 then
				var12()
			end
			onCreatePressed()
		end, { var8, var12, onCreatePressed }),
		onFtuxTooltipClosed = var12,
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
		headerHeight = var7,
		headerPadding = {
			left = UDim.new(0, math.max(var2.left, var13)),
			right = UDim.new(0, math.max(var2.right, var13)),
			top = UDim.new(0, if fFlagMomentsUseFoundationHeaderBarModule then var6 else var2.top)
		},
		titleTextStyle = var1.Color.Content.Emphasis,
		scrimHeight = var2.top + var1.Size.Size_2000 + var1.Size.Size_1600
	}
end