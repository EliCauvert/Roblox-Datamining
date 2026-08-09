local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local appPage = require(parent.RobloxAppEnums).AppPage
local navigationRoduxModule = require(parent.NavigationRodux)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local flyoutHamburgerButtonModule = require(script.Parent.FlyoutHamburgerButton)
local constantsModule = require(script.Parent.Parent.Constants)
local enableHomeBetaBadge = game:DefineFastFlag("EnableHomeBetaBadge", false)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaHomeSubTab = sharedFlagsModule.FFlagAppIaHomeSubTab
local fFlagEnableCoreContentBadge = sharedFlagsModule.FFlagEnableCoreContentBadge
local fFlagEnableHomeRobloxLogo = sharedFlagsModule.FFlagEnableHomeRobloxLogo
local fFlagEnableConsoleRobloxLogo = sharedFlagsModule.FFlagEnableConsoleRobloxLogo

return function(p0) --[[ line: 34 | named "FlyoutLeftHeader" ]]
	-- upvalues: useTokens (ref), fFlagEnableCoreContentBadge (ref), useAppPolicy (ref), appPage (ref), fFlagAppIaHomeSubTab (ref), navigationRoduxModule (ref), fFlagEnableHomeRobloxLogo (ref), fFlagEnableConsoleRobloxLogo (ref), reactModule (ref), foundationModule (ref), flyoutHamburgerButtonModule (ref), constantsModule (ref), enableHomeBetaBadge (ref)
	local var9
	local var7 = useTokens()
	local size500 = var7.Size.Size_500
	local var8 = if fFlagEnableCoreContentBadge then useAppPolicy(function(p1) --[[ line: 39 ]]
		return p1.getCoreContentBadgeText()
	end) else nil
	
	if fFlagEnableCoreContentBadge then
		var9 = var8
		
		if var9 then
			var9 = var8 ~= ""
			var9 = nil
		end
	else
		var9 = false
	end
	local var10 = p0.alwaysShowLogo or (if p0.routeName ~= appPage.Home then fFlagAppIaHomeSubTab and p0.routeName == navigationRoduxModule.Constants.HomeContainerName else true)
	local var11 = "auto-xy row align-x-left align-y-center"
	
	if fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo or p0.isAlternateEntryPointEnabled then
		var11 ..= " gap-small"
	end
	return reactModule.createElement(foundationModule.View, { tag = var11 }, {
		FlyoutHamburgerButton = if (fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo) and not p0.isFlyoutEntrypointEnabled then nil else reactModule.createElement(flyoutHamburgerButtonModule, {
			LayoutOrder = 1,
			titleText = p0.titleText,
			isAlternateEntryPointEnabled = p0.isAlternateEntryPointEnabled
		}),
		TitleOrRobloxLogoFrame = if (fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo or p0.isRobloxLogoEnabled) and var10 then reactModule.createElement(foundationModule.Image, {
			LayoutOrder = 2,
			tag = "size-full-full",
			Image = "icons/logo/letterform",
			imageStyle = var7.Color.Content.Emphasis,
			Size = UDim2.fromOffset(size500 * constantsModule.ROBLOX_LOGO_ASPECT_RATIO, size500)
		}) elseif p0.titleText then reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-heading-large content-emphasis",
			LayoutOrder = 2,
			Text = p0.titleText
		}) else nil,
		CoreContentBadge = if fFlagEnableCoreContentBadge and (fFlagEnableHomeRobloxLogo or fFlagEnableConsoleRobloxLogo or p0.isRobloxLogoEnabled) and (var10 and var9) then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy bg-system-contrast padding-x-xsmall padding-y-xxsmall radius-small",
			LayoutOrder = 3
		}, {
			Text = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-small",
				Text = var8,
				textStyle = var7.Color.Surface.Surface_0
			})
		}) else nil,
		BetaBadge = if enableHomeBetaBadge and p0.isRobloxLogoEnabled and var10 then reactModule.createElement(foundationModule.View, {
			LayoutOrder = 4,
			tag = "auto-xy padding-xxsmall stroke-standard stroke-emphasis radius-small"
		}, {
			Text = reactModule.createElement(foundationModule.Text, {
				Text = "Beta",
				tag = "auto-xy text-body-small content-emphasis"
			})
		}) else nil
	})
end