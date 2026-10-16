local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local AppNavBarModule = require(Parent.AppNavBar)
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local Placement = AppNavBarModule.Placement
local FlyoutHamburgerButtonModule = require(script.Parent.FlyoutHamburgerButton)
local ConstantsModule = require(script.Parent.Parent.Constants)
local EnableHomeBetaBadge = game:DefineFastFlag("EnableHomeBetaBadge", false)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagEnableCoreContentBadge = SharedFlagsModule.FFlagEnableCoreContentBadge
local FFlagEnableHomeRobloxLogo = SharedFlagsModule.FFlagEnableHomeRobloxLogo
local FFlagEnableConsoleRobloxLogo = SharedFlagsModule.FFlagEnableConsoleRobloxLogo
local FFlagEnableFlyoutOnNavRail = SharedFlagsModule.FFlagEnableFlyoutOnNavRail
local FFlagFlyoutHeaderFixPadding = SharedFlagsModule.FFlagFlyoutHeaderFixPadding

return function(p1) --[[ Line: 37 | Named "FlyoutLeftHeader" ]]
	-- upvalues: UseTokensFunction (copy), ConstantsModule (copy), FFlagEnableFlyoutOnNavRail (copy), UseNavBarPlacementFunction (copy), Placement (copy), FFlagEnableCoreContentBadge (copy), UseAppPolicyFunction (copy), AppPage (copy), FFlagAppIaHomeSubTab (copy), NavigationRoduxModule (copy), FFlagFlyoutHeaderFixPadding (copy), FFlagEnableHomeRobloxLogo (copy), FFlagEnableConsoleRobloxLogo (copy), ReactModule (copy), FoundationModule (copy), EnableHomeBetaBadge (copy), FlyoutHamburgerButtonModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Size500 = UseTokensResult.Size.Size_500
	local _Vector2 = Vector2.new(Size500 * ConstantsModule.ROBLOX_LOGO_ASPECT_RATIO, Size500)
	local IsUseNavBarPlacementResultMatch = if FFlagEnableFlyoutOnNavRail then UseNavBarPlacementFunction() == Placement.Bottom else nil
	local UseAppPolicyResult = if FFlagEnableCoreContentBadge then UseAppPolicyFunction(function(p2) --[[ Line: 50 ]]
		return p2.getCoreContentBadgeText()
	end) else nil
	local IsNotUseAppPolicyResultMatch: boolean = if FFlagEnableCoreContentBadge then UseAppPolicyResult and UseAppPolicyResult ~= "" else false
	local AlwaysShowLogo = p1.alwaysShowLogo or (p1.routeName == AppPage.Home or FFlagAppIaHomeSubTab and p1.routeName == NavigationRoduxModule.Constants.HomeContainerName)
	local Tag = "auto-xy row align-x-left align-y-center"
	
	if not FFlagFlyoutHeaderFixPadding and (FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo or p1.isAlternateEntryPointEnabled) then
		Tag ..= " gap-small"
	end
	local NoFFlagEnableFlyoutOnNavRail = if FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo then p1.isFlyoutEntrypointEnabled and (not FFlagEnableFlyoutOnNavRail or IsUseNavBarPlacementResultMatch) else not FFlagEnableFlyoutOnNavRail or IsUseNavBarPlacementResultMatch
	local Element = if FFlagEnableCoreContentBadge and (FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo or p1.isRobloxLogoEnabled) and (AlwaysShowLogo and IsNotUseAppPolicyResultMatch) then ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy padding-x-xsmall padding-y-xxsmall radius-small bg-system-contrast",
		LayoutOrder = 3
	}, {
		Text = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-title-small",
			Text = UseAppPolicyResult,
			textStyle = UseTokensResult.Color.Surface.Surface_0
		})
	}) else nil
	local Element1 = if EnableHomeBetaBadge and p1.isRobloxLogoEnabled and AlwaysShowLogo then ReactModule.createElement(FoundationModule.View, {
		LayoutOrder = 4,
		tag = "auto-xy padding-xxsmall stroke-standard stroke-emphasis radius-small"
	}, {
		Text = ReactModule.createElement(FoundationModule.Text, {
			Text = "Beta",
			tag = "auto-xy text-body-small content-emphasis"
		})
	}) else nil
	
	return ReactModule.createElement(FoundationModule.View, { tag = Tag }, {
		FlyoutHamburgerButton = if NoFFlagEnableFlyoutOnNavRail then ReactModule.createElement(FlyoutHamburgerButtonModule, {
			LayoutOrder = 1,
			titleText = p1.titleText,
			isAlternateEntryPointEnabled = p1.isAlternateEntryPointEnabled
		}) else nil,
		TitleOrRobloxLogoFrame = if (FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo or p1.isRobloxLogoEnabled) and AlwaysShowLogo then if p1.useHeaderLogo then ReactModule.createElement(require(script.Parent.HeaderLogo)) else ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			Image = "icons/logo/letterform",
			imageStyle = UseTokensResult.Color.Content.Emphasis,
			Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
		}) elseif p1.titleText then ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-heading-large content-emphasis",
			LayoutOrder = 2,
			Text = p1.titleText
		}) else nil,
		Badges = if FFlagFlyoutHeaderFixPadding then ReactModule.createElement(FoundationModule.View, {
			tag = "row gap-xsmall auto-xy align-y-center padding-left-xsmall",
			LayoutOrder = 3
		}, { CoreContentBadge = Element, BetaBadge = Element1 }) else nil,
		CoreContentBadge = if FFlagFlyoutHeaderFixPadding then nil else Element,
		BetaBadge = if FFlagFlyoutHeaderFixPadding then nil else Element1
	})
end