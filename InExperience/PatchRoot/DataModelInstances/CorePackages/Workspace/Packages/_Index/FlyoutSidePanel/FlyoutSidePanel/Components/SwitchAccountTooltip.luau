local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseAccountSwitcherTooltipModule = require(FlyoutSidePanel.Hooks.useAccountSwitcherTooltip)
local EducationalTooltip = FoundationModule.EducationalTooltip
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseAccountSwitcherTooltipModule (copy), ReactModule (copy), EducationalTooltip (copy), PopoverAlign (copy), PopoverSide (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.FlyoutSidePanel.Title.AccountSwitcherMoved",
		text = "Feature.FlyoutSidePanel.Description.SwitchAccountsHere"
	})
	local UseAccountSwitcherTooltipModuleResult, UseAccountSwitcherTooltipModuleResult2, UseAccountSwitcherTooltipModuleResult3 = UseAccountSwitcherTooltipModule(p1.anchorRef, p1.isEligible, p1.appStorage, p1.dismissRef)
	
	return ReactModule.createElement(EducationalTooltip, {
		testId = "--core-ui-flyout-account-switcher-tooltip",
		title = UseLocalizationResult.title,
		text = UseLocalizationResult.text,
		isOpen = UseAccountSwitcherTooltipModuleResult,
		anchorRef = p1.anchorRef,
		align = PopoverAlign.Center,
		side = PopoverSide.Bottom,
		onClose = UseAccountSwitcherTooltipModuleResult2,
		onPressedOutside = UseAccountSwitcherTooltipModuleResult3
	})
end