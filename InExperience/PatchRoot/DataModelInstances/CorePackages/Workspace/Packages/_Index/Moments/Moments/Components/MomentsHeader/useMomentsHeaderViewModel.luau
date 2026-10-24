local Players = game:GetService("Players")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local UseCompositionLayoutFunction = require(Parent.AppComposition).useCompositionLayout
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseStatusBarHeightFunction = MomentsCommonModule.Hooks.useStatusBarHeight
local UseIsTvRemoteDeviceFunction = require(Parent.RoactUtils).Hooks.useIsTvRemoteDevice
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetFFlagMomentsAndroidTvEnabledModule = require(Moments.Flags.GetFFlagMomentsAndroidTvEnabled)
local FFlagMomentsFtuxTooltipCreateCopyModule = require(Moments.Flags.FFlagMomentsFtuxTooltipCreateCopy)
local FFlagMomentsFixFeedForDeviceSafeInsetsModule = require(Moments.Flags.FFlagMomentsFixFeedForDeviceSafeInsets)
local ShouldUseDeviceSafeInsets = require(Parent.Display).shouldUseDeviceSafeInsets
local _ = require(script.Parent.MomentsHeaderView)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local config = {
	title = "Feature.Moments.Tooltip.ShareFirstMomentTitle",
	text = "Feature.Moments.Tooltip.ShareFirstMomentBody"
}

local function noop() end

local function _()
	-- upvalues: Players (copy)
	return {
		identifier = "create_moment",
		userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
		timestamp = tostring(os.time())
	}
end

return function(p1, p2, ShowHamburger)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseSetDrawerVisibleFunction (copy), UseIsTvRemoteDeviceFunction (copy), UseCompositionLayoutFunction (copy), UseStatusBarHeightFunction (copy), FFlagMomentsFtuxTooltipCreateCopyModule (copy), UseLocalizationFunction (copy), config (copy), noop (copy), ReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), Players (copy), FFlagMomentsFixFeedForDeviceSafeInsetsModule (copy), ShouldUseDeviceSafeInsets (copy), GetFFlagMomentsAndroidTvEnabledModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	local UseIsTvRemoteDeviceResult = UseIsTvRemoteDeviceFunction()
	local UseCompositionLayoutResult = UseCompositionLayoutFunction()
	local UseStatusBarHeightResult = UseStatusBarHeightFunction()
	local Size1400 = UseTokensResult.Size.Size_1400
	local IsShowFtuxTooltip = p1.showFtuxTooltip == true
	local Title = ""
	local FtuxTooltipText = ""
	
	if FFlagMomentsFtuxTooltipCreateCopyModule then
		local UseLocalizationResult = UseLocalizationFunction(config)
		Title = UseLocalizationResult.title
		FtuxTooltipText = UseLocalizationResult.text
	end
	local OnFtuxTooltipDismissed = p1.onFtuxTooltipDismissed or noop
	local OnCreatePressed = p1.onCreatePressed or noop
	ReactModule.useEffect(function()
		-- upvalues: IsShowFtuxTooltip (copy), FireAnalyticsEventFunction (upval), EventNames (upval), Players (upval)
		if IsShowFtuxTooltip then
			FireAnalyticsEventFunction(EventNames.FTUXTooltipImpression, {
				identifier = "create_moment",
				userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
		end
	end, { IsShowFtuxTooltip })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), Players (upval), OnFtuxTooltipDismissed (copy)
		FireAnalyticsEventFunction(EventNames.FTUXTooltipDismissed, {
			identifier = "create_moment",
			userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
			timestamp = tostring(os.time())
		})
		OnFtuxTooltipDismissed()
	end, { OnFtuxTooltipDismissed })
	local Margin: number = UseCompositionLayoutResult.margin
	
	return {
		layoutOrder = if p2 then nil else p1.layoutOrder,
		variant = p1.variant,
		showFtuxTooltip = IsShowFtuxTooltip,
		ftuxTooltipTitle = Title,
		ftuxTooltipText = FtuxTooltipText,
		onCreateMomentButtonPressed = ReactModule.useCallback(function()
			-- upvalues: IsShowFtuxTooltip (copy), UseResult (copy), OnCreatePressed (copy)
			if IsShowFtuxTooltip then
				UseResult()
			end
			OnCreatePressed()
		end, { IsShowFtuxTooltip, UseResult, OnCreatePressed }),
		onFtuxTooltipClosed = UseResult,
		onHamburgerPressed = ReactModule.useCallback(function()
			-- upvalues: UseSetDrawerVisibleResult (copy)
			UseSetDrawerVisibleResult(true)
		end, { UseSetDrawerVisibleResult }),
		onBack = p1.onBack or noop,
		onClose = p1.onClose or noop,
		onNavigateToTrending = p1.onNavigateToTrending or noop,
		onNavigateToMyMoments = p1.onNavigateToMyMoments or noop,
		title = p1.title or "",
		showTopScrim = p1.showTopScrim == true,
		showInteractiveButtons = not (GetFFlagMomentsAndroidTvEnabledModule() and UseIsTvRemoteDeviceResult),
		showHamburger = ShowHamburger,
		showCreateButton = p1.onCreatePressed ~= nil,
		showNavigationMenu = p1.onNavigateToTrending ~= nil and p1.onNavigateToMyMoments ~= nil,
		headerHeight = Size1400,
		headerPadding = {
			left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, Margin))),
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, Margin))),
			top = UDim.new(0, UseStatusBarHeightResult)
		},
		titleTextStyle = UseTokensResult.Color.Content.Emphasis,
		scrimHeight = UseDeviceInsetsResult.top + UseTokensResult.Size.Size_2000 + UseTokensResult.Size.Size_1600,
		scrimTopOffset = if FFlagMomentsFixFeedForDeviceSafeInsetsModule and ShouldUseDeviceSafeInsets then -UseDeviceInsetsResult.top else nil
	}
end