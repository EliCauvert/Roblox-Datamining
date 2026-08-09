local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize

return function(p0) --[[ line: 16 | named "FlyoutSwitchAccountButton" ]]
	-- upvalues: reactModule (ref), useLocalization (ref), button (ref), buttonVariant (ref), buttonSize (ref)
	return reactModule.createElement(button, {
		isDisabled = false,
		text = useLocalization({
			title = "Authentication.AccountSwitch.Action.SwitchAccount"
		}).title,
		variant = buttonVariant.Standard,
		LayoutOrder = p0.layoutOrder,
		onActivated = reactModule.useCallback(function() --[[ line: 17 ]]
			-- upvalues: p0 (ref)
			p0.closeDrawer()
			
			if p0.onSwitchAccountActivated then
				p0.onSwitchAccountActivated()
			end
		end, { p0.onSwitchAccountActivated, p0.closeDrawer }),
		size = buttonSize.Large,
		width = UDim.new(1, 0)
	})
end