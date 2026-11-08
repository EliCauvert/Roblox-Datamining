local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FlyoutAccountSwitcherIXP = require(Parent.SharedExperimentDefinition).FlyoutAccountSwitcherIXP
local FFlagCTAChangeMorePageFlyoutButtonText = require(Parent.SharedFlags).FFlagCTAChangeMorePageFlyoutButtonText

return function(p1)
	-- upvalues: ReactModule (copy), FlyoutAccountSwitcherIXP (copy), UseLocalizationFunction (copy), FFlagCTAChangeMorePageFlyoutButtonText (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	return ReactModule.createElement(Button, {
		testId = "--core-ui-flyout-button-switch-account",
		isDisabled = false,
		text = UseLocalizationFunction({
			title = if FFlagCTAChangeMorePageFlyoutButtonText then "Authentication.AccountSwitch.Header.SwitchAccountSentenceCase" else "Authentication.AccountSwitch.Action.SwitchAccount"
		}).title,
		variant = ButtonVariant.Standard,
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: FlyoutAccountSwitcherIXP (upval), p1 (copy)
			if not FlyoutAccountSwitcherIXP.isUsernameAccountSwitcherEnabled() then
				p1.closeDrawer()
			end
			if p1.onSwitchAccountActivated then
				p1.onSwitchAccountActivated()
			end
		end, {
			p1.onSwitchAccountActivated,
			if FlyoutAccountSwitcherIXP.isUsernameAccountSwitcherEnabled() then nil else p1.closeDrawer
		}),
		size = ButtonSize.Large,
		width = UDim.new(1, 0)
	})
end