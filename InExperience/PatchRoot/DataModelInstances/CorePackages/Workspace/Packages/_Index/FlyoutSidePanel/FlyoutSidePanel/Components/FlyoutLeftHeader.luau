local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local appPage = require(parent.RobloxAppEnums).AppPage
local navigationRoduxModule = require(parent.NavigationRodux)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local appNavBarModule = require(parent.AppNavBar)
local useNavBarPlacement = appNavBarModule.useNavBarPlacement
local placement = appNavBarModule.Placement
local flyoutHamburgerButtonModule = require(script.Parent.FlyoutHamburgerButton)
local constantsModule = require(script.Parent.Parent.Constants)
local enableHomeBetaBadge = game:DefineFastFlag("EnableHomeBetaBadge", false)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaHomeSubTab = sharedFlagsModule.FFlagAppIaHomeSubTab
local fFlagEnableCoreContentBadge = sharedFlagsModule.FFlagEnableCoreContentBadge
local fFlagEnableHomeRobloxLogo = sharedFlagsModule.FFlagEnableHomeRobloxLogo
local fFlagEnableConsoleRobloxLogo = sharedFlagsModule.FFlagEnableConsoleRobloxLogo
local fFlagEnableFlyoutOnNavRail = sharedFlagsModule.FFlagEnableFlyoutOnNavRail
local fFlagFlyoutHeaderFixPadding = sharedFlagsModule.FFlagFlyoutHeaderFixPadding

return function(p1)
	-- upvalues: useTokens (ref), constantsModule (ref), fFlagEnableFlyoutOnNavRail (ref), useNavBarPlacement (ref), placement (ref), fFlagEnableCoreContentBadge (ref), useAppPolicy (ref), appPage (ref), fFlagAppIaHomeSubTab (ref), navigationRoduxModule (ref), fFlagFlyoutHeaderFixPadding (ref), fFlagEnableHomeRobloxLogo (ref), fFlagEnableConsoleRobloxLogo (ref), reactModule (ref), foundationModule (ref), enableHomeBetaBadge (ref), flyoutHamburgerButtonModule (ref)
	local var1
	local var2 = useTokens()
	local size500 = var2.Size.Size_500
	local vector2 = Vector2.new(size500 * constantsModule.ROBLOX_LOGO_ASPECT_RATIO, size500)
	local _ = nil
	local var3 = if fFlagEnableFlyoutOnNavRail then useNavBarPlacement() == placement.Bottom else nil
	local var4 = if fFlagEnableCoreContentBadge then useAppPolicy(function(p2)
		return p2.getCoreContentBadgeText()
	end) else nil
	
	if fFlagEnableCoreContentBadge then
		var1 = var4
		
		if var1 then
			var1 = var4 ~= ""
			var1 = nil
		end
	else
		var1 = false
	end
	local isFlyoutEntrypointEnabled
	local var5 = p1.alwaysShowLogo or (if p1.routeName ~= appPage.Home then fFlagAppIaHomeSubTab and p1.routeName == navigationRoduxModule.Constants.HomeContainerName else true)
	local var6 = "auto-xy row align-x-left align-y-center"
	
	if not fFlagFlyoutHeaderFixPadding and (fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo or p1.isAlternateEntryPointEnabled) then
		var6 ..= " gap-small"
	end
	if fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo then
		isFlyoutEntrypointEnabled = p1.isFlyoutEntrypointEnabled
		
		if isFlyoutEntrypointEnabled then
			isFlyoutEntrypointEnabled = not fFlagEnableFlyoutOnNavRail or var3
		end
		local var7 = if fFlagEnableCoreContentBadge and (fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo or p1.isRobloxLogoEnabled) and (var5 and var1) then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-x-xsmall padding-y-xxsmall radius-small bg-system-contrast",
			LayoutOrder = 3
		}, {
			Text = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-small",
				Text = var4,
				textStyle = var2.Color.Surface.Surface_0
			})
		}) else nil
		local var8 = if enableHomeBetaBadge and p1.isRobloxLogoEnabled and var5 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 4,
			tag = "auto-xy padding-xxsmall stroke-standard stroke-emphasis radius-small"
		}, {
			Text = reactModule.createElement(foundationModule.Text, {
				Text = "Beta",
				tag = "auto-xy text-body-small content-emphasis"
			})
		}) else nil
		
		return reactModule.createElement(foundationModule.View, { tag = var6 }, {
			FlyoutHamburgerButton = if isFlyoutEntrypointEnabled then reactModule.createElement(flyoutHamburgerButtonModule, {
				LayoutOrder = 1,
				titleText = p1.titleText,
				isAlternateEntryPointEnabled = p1.isAlternateEntryPointEnabled
			}) else nil,
			TitleOrRobloxLogoFrame = if (fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo or p1.isRobloxLogoEnabled) and var5 then if p1.useHeaderLogo then reactModule.createElement(require(script.Parent.HeaderLogo), {
				onWordmarkActivated = p1.onWordmarkActivated,
				isSystemThemeEnabled = p1.isSystemThemeEnabled
			}) else reactModule.createElement(foundationModule.Image, {
				LayoutOrder = 2,
				tag = "size-full-full",
				Image = "icons/logo/letterform",
				imageStyle = var2.Color.Content.Emphasis,
				Size = UDim2.fromOffset(vector2.X, vector2.Y)
			}) elseif p1.titleText then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-heading-large content-emphasis",
				LayoutOrder = 2,
				Text = p1.titleText
			}) else nil,
			Badges = if fFlagFlyoutHeaderFixPadding then reactModule.createElement(foundationModule.View, {
				tag = "row gap-xsmall auto-xy align-y-center padding-left-xsmall",
				LayoutOrder = 3
			}, { CoreContentBadge = var7, BetaBadge = var8 }) else nil,
			CoreContentBadge = if not fFlagFlyoutHeaderFixPadding then var7 else nil,
			BetaBadge = if not fFlagFlyoutHeaderFixPadding then var8 else nil
		})
	end
end