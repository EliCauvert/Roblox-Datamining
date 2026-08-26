local playersService = game:GetService("Players")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local appCompositionModule = require(parent.AppComposition)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local useCompositionLayout = appCompositionModule.useCompositionLayout
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useStatusBarHeight = momentsCommonModule.Hooks.useStatusBarHeight
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local getFFlagMomentsAndroidTvEnabledModule = require(moments.Flags.GetFFlagMomentsAndroidTvEnabled)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local fFlagMomentsUseFoundationHeaderBarModule = require(moments.Flags.FFlagMomentsUseFoundationHeaderBar)
local _ = require(script.Parent.MomentsHeaderView)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent

local function noop() end

local function _()
	-- upvalues: playersService (ref)
	return {
		userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
		timestamp = tostring(os.time())
	}
end

return function(p1, p2, p3)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useSetDrawerVisible (ref), useIsTvRemoteDevice (ref), fFlagMomentsUseCompositionLibraryModule (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useCompositionLayout (ref), useStatusBarHeight (ref), noop (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), playersService (ref), getFFlagMomentsAndroidTvEnabledModule (ref)
	local var1 = useTokens()
	local var2 = useDeviceInsets()
	local var3 = useSetDrawerVisible()
	local var4 = useIsTvRemoteDevice()
	local fFlagMomentsUseFoundationHeaderBarModule_1 = fFlagMomentsUseCompositionLibraryModule and fFlagMomentsUseFoundationHeaderBarModule
	local var5 = nil
	local var6 = nil
	local var7 = 0
	
	if fFlagMomentsUseFoundationHeaderBarModule_1 then
		var5 = useCompositionLayout()
		var6 = useStatusBarHeight()
		var7 = var1.Size.Size_1400
	end
	local var8 = p1.showFtuxTooltip == true
	local onFtuxTooltipDismissed = p1.onFtuxTooltipDismissed or noop
	local onCreatePressed = p1.onCreatePressed or noop
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), fireAnalyticsEvent (copy), eventNames (copy), playersService (copy)
		if var8 then
			fireAnalyticsEvent(eventNames.FTUXTooltipImpression, {
				userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
		end
	end, { var8 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), playersService (copy), onFtuxTooltipDismissed (ref)
		fireAnalyticsEvent(eventNames.FTUXTooltipDismissed, {
			userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
			timestamp = tostring(os.time())
		})
		onFtuxTooltipDismissed()
	end, { onFtuxTooltipDismissed })
	local var10 = if var5 ~= nil then 0 else var5.margin
	
	return {
		layoutOrder = if p2 then nil else p1.layoutOrder,
		variant = p1.variant,
		showFtuxTooltip = var8,
		onCreateMomentButtonPressed = reactModule.useCallback(function()
			-- upvalues: var8 (ref), var9 (ref), onCreatePressed (ref)
			if var8 then
				var9()
			end
			onCreatePressed()
		end, { var8, var9, onCreatePressed }),
		onFtuxTooltipClosed = var9,
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
		headerHeight = var7,
		headerPadding = {
			left = UDim.new(0, math.max(var2.left, var10)),
			right = UDim.new(0, math.max(var2.right, var10)),
			top = UDim.new(0, if fFlagMomentsUseFoundationHeaderBarModule_1 then var6 else var2.top)
		},
		titleTextStyle = var1.Color.Content.Emphasis,
		scrimHeight = var2.top + var1.Size.Size_2000 + var1.Size.Size_1600
	}
end