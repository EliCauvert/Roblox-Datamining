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

return function(p0, p1, p2)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useSetDrawerVisible (ref), useIsTvRemoteDevice (ref), fFlagMomentsUseCompositionLibraryModule (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useCompositionLayout (ref), useStatusBarHeight (ref), noop (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), playersService (ref), getFFlagMomentsAndroidTvEnabledModule (ref)
	local var10 = useTokens()
	local var11 = useDeviceInsets()
	local var12 = useSetDrawerVisible()
	local var13 = useIsTvRemoteDevice()
	local fFlagMomentsUseFoundationHeaderBarModule_1 = fFlagMomentsUseCompositionLibraryModule and fFlagMomentsUseFoundationHeaderBarModule
	local var15 = nil
	local var16 = nil
	local var17 = 0
	
	if fFlagMomentsUseFoundationHeaderBarModule_1 then
		var15 = useCompositionLayout()
		var16 = useStatusBarHeight()
		var17 = var10.Size.Size_1400
	end
	local var18 = p0.showFtuxTooltip == true
	local onFtuxTooltipDismissed = p0.onFtuxTooltipDismissed or noop
	local onCreatePressed = p0.onCreatePressed or noop
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), fireAnalyticsEvent (copy), eventNames (copy), playersService (copy)
		if var18 then
			fireAnalyticsEvent(eventNames.FTUXTooltipImpression, {
				userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
		end
	end, { var18 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), playersService (copy), onFtuxTooltipDismissed (ref)
		fireAnalyticsEvent(eventNames.FTUXTooltipDismissed, {
			userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
			timestamp = tostring(os.time())
		})
		onFtuxTooltipDismissed()
	end, { onFtuxTooltipDismissed })
	local var22 = if var15 ~= nil then 0 else var15.margin
	
	return {
		layoutOrder = if p1 then nil else p0.layoutOrder,
		variant = p0.variant,
		showFtuxTooltip = var18,
		onCreateMomentButtonPressed = reactModule.useCallback(function()
			-- upvalues: var18 (ref), var21 (ref), onCreatePressed (ref)
			if var18 then
				var21()
			end
			onCreatePressed()
		end, { var18, var21, onCreatePressed }),
		onFtuxTooltipClosed = var21,
		onHamburgerPressed = reactModule.useCallback(function()
			-- upvalues: var12 (ref)
			var12(true)
		end, { var12 }),
		onBack = p0.onBack or noop,
		onClose = p0.onClose or noop,
		onNavigateToTrending = p0.onNavigateToTrending or noop,
		onNavigateToMyMoments = p0.onNavigateToMyMoments or noop,
		title = p0.title or "",
		showTopScrim = p0.showTopScrim == true,
		showInteractiveButtons = not (getFFlagMomentsAndroidTvEnabledModule() and var13),
		showHamburger = p2,
		showCreateButton = p0.onCreatePressed ~= nil,
		headerHeight = var17,
		headerPadding = {
			left = UDim.new(0, math.max(var11.left, var22)),
			right = UDim.new(0, math.max(var11.right, var22)),
			top = UDim.new(0, if fFlagMomentsUseFoundationHeaderBarModule_1 then var16 else var11.top)
		},
		titleTextStyle = var10.Color.Content.Emphasis,
		scrimHeight = var11.top + var10.Size.Size_2000 + var10.Size.Size_1600
	}
end