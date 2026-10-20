local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FFlagCTAChangeMorePageFlyoutButtonText = require(Parent.SharedFlags).FFlagCTAChangeMorePageFlyoutButtonText

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), FFlagCTAChangeMorePageFlyoutButtonText (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	return ReactModule.createElement(Button, {
		testId = "--core-ui-flyout-button-switch-account",
		isDisabled = false,
		text = UseLocalizationFunction({
			title = if FFlagCTAChangeMorePageFlyoutButtonText then "Authentication.AccountSwitch.Header.SwitchAccountSentenceCase" else "Authentication.AccountSwitch.Action.SwitchAccount"
		}).title,
		variant = ButtonVariant.Standard,
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.closeDrawer()
			
			if p1.onSwitchAccountActivated then
				p1.onSwitchAccountActivated()
			end
		end, { p1.onSwitchAccountActivated, p1.closeDrawer }),
		size = ButtonSize.Large,
		width = UDim.new(1, 0)
	})
end