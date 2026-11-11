local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local FlyoutHamburgerButtonModule = require(script.Parent.FlyoutHamburgerButton)
local ConstantsModule = require(script.Parent.Parent.Constants)
local EnableHomeBetaBadge = game:DefineFastFlag("EnableHomeBetaBadge", false)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagEnableCoreContentBadge = SharedFlagsModule.FFlagEnableCoreContentBadge
local FFlagEnableHomeRobloxLogo = SharedFlagsModule.FFlagEnableHomeRobloxLogo
local FFlagEnableConsoleRobloxLogo = SharedFlagsModule.FFlagEnableConsoleRobloxLogo

return function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagEnableCoreContentBadge (copy), UseAppPolicyFunction (copy), AppPage (copy), FFlagAppIaHomeSubTab (copy), NavigationRoduxModule (copy), FFlagEnableHomeRobloxLogo (copy), FFlagEnableConsoleRobloxLogo (copy), ReactModule (copy), FoundationModule (copy), FlyoutHamburgerButtonModule (copy), ConstantsModule (copy), EnableHomeBetaBadge (copy)
	local UseTokensResult = UseTokensFunction()
	local Size500 = UseTokensResult.Size.Size_500
	local UseAppPolicyResult = if FFlagEnableCoreContentBadge then UseAppPolicyFunction(function(p2)
		return p2.getCoreContentBadgeText()
	end) else nil
	local IsNotUseAppPolicyResultMatch: boolean = if FFlagEnableCoreContentBadge then UseAppPolicyResult and UseAppPolicyResult ~= "" else false
	local AlwaysShowLogo = p1.alwaysShowLogo or (p1.routeName == AppPage.Home or FFlagAppIaHomeSubTab and p1.routeName == NavigationRoduxModule.Constants.HomeContainerName)
	local Tag = "auto-xy row align-x-left align-y-center"
	
	if FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo or p1.isAlternateEntryPointEnabled then
		Tag ..= " gap-small"
	end
	return ReactModule.createElement(FoundationModule.View, { tag = Tag }, {
		FlyoutHamburgerButton = if FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo then if p1.isFlyoutEntrypointEnabled then ReactModule.createElement(FlyoutHamburgerButtonModule, {
			LayoutOrder = 1,
			titleText = p1.titleText,
			isAlternateEntryPointEnabled = p1.isAlternateEntryPointEnabled
		}) else nil else ReactModule.createElement(FlyoutHamburgerButtonModule, {
			LayoutOrder = 1,
			titleText = p1.titleText,
			isAlternateEntryPointEnabled = p1.isAlternateEntryPointEnabled
		}),
		TitleOrRobloxLogoFrame = if (FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo or p1.isRobloxLogoEnabled) and AlwaysShowLogo then ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			Image = "icons/logo/letterform",
			imageStyle = UseTokensResult.Color.Content.Emphasis,
			Size = UDim2.fromOffset(Size500 * ConstantsModule.ROBLOX_LOGO_ASPECT_RATIO, Size500)
		}) elseif p1.titleText then ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-heading-large content-emphasis",
			LayoutOrder = 2,
			Text = p1.titleText
		}) else nil,
		CoreContentBadge = if FFlagEnableCoreContentBadge and (FFlagEnableHomeRobloxLogo or FFlagEnableConsoleRobloxLogo or p1.isRobloxLogoEnabled) and (AlwaysShowLogo and IsNotUseAppPolicyResultMatch) then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy bg-system-contrast padding-x-xsmall padding-y-xxsmall radius-small",
			LayoutOrder = 3
		}, {
			Text = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-small",
				Text = UseAppPolicyResult,
				textStyle = UseTokensResult.Color.Surface.Surface_0
			})
		}) else nil,
		BetaBadge = if EnableHomeBetaBadge and p1.isRobloxLogoEnabled and AlwaysShowLogo then ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 4,
			tag = "auto-xy padding-xxsmall stroke-standard stroke-emphasis radius-small"
		}, {
			Text = ReactModule.createElement(FoundationModule.Text, {
				Text = "Beta",
				tag = "auto-xy text-body-small content-emphasis"
			})
		}) else nil
	})
end