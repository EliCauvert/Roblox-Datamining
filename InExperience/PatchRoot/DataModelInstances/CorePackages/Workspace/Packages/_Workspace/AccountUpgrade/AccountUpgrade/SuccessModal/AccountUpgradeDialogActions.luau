local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonGroup = foundationModule.ButtonGroup
local _ = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation

return function(p1)
	-- upvalues: reactModule (ref), buttonGroup (ref), orientation (ref)
	local t = {}
	
	for i, v in p1.buttons do
		table.insert(t, {
			text = v.text,
			variant = v.variant,
			onActivated = v.onActivated,
			isDisabled = v.isDisabled,
			isLoading = v.isLoading
		})
	end
	return reactModule.createElement(buttonGroup, {
		buttons = t,
		orientation = orientation.Vertical,
		LayoutOrder = p1.LayoutOrder or 3,
		testId = p1.testId or "account-upgrade-dialog-actions"
	})
end