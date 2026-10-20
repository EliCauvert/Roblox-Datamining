local Parent = script:FindFirstAncestor("AccountUpgrade").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonGroup = FoundationModule.ButtonGroup
local _ = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation

return function(Frame)
	-- upvalues: ReactModule (copy), ButtonGroup (copy), Orientation (copy)
	local Buttons = {}
	
	for _, button in Frame.buttons do
		table.insert(Buttons, {
			text = button.text,
			variant = button.variant,
			onActivated = button.onActivated,
			isDisabled = button.isDisabled,
			isLoading = button.isLoading
		})
	end
	return ReactModule.createElement(ButtonGroup, {
		buttons = Buttons,
		orientation = Orientation.Vertical,
		LayoutOrder = Frame.LayoutOrder or 3,
		testId = Frame.testId or "account-upgrade-dialog-actions"
	})
end