local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local fFlagCTAChangeMorePageFlyoutButtonText = require(parent.SharedFlags).FFlagCTAChangeMorePageFlyoutButtonText

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), fFlagCTAChangeMorePageFlyoutButtonText (ref), button (ref), buttonVariant (ref), buttonSize (ref)
	return reactModule.createElement(button, {
		isDisabled = false,
		text = useLocalization({
			title = if fFlagCTAChangeMorePageFlyoutButtonText then "Authentication.AccountSwitch.Header.SwitchAccountSentenceCase" else "Authentication.AccountSwitch.Action.SwitchAccount"
		}).title,
		variant = buttonVariant.Standard,
		LayoutOrder = p1.layoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.closeDrawer()
			
			if p1.onSwitchAccountActivated then
				p1.onSwitchAccountActivated()
			end
		end, { p1.onSwitchAccountActivated, p1.closeDrawer }),
		size = buttonSize.Large,
		width = UDim.new(1, 0)
	})
end