local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.FeedbackAction)
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: iconVariant (ref), reactModule (ref), iconButton (ref), inputSize (ref), buttonVariant (ref), view (ref)
	local testId = p1.testId or "user-feedback"
	local onActivated = p1.onActivated
	local selectedAction = p1.selectedAction
	local t = {}
	
	for i, v in p1.icons do
		t[v.testId or `{v.iconName}-{i}`] = reactModule.createElement(iconButton, {
			LayoutOrder = i,
			icon = if selectedAction == v.action then { name = v.iconName, variant = iconVariant.Filled } else v.iconName,
			isDisabled = v.isDisabled,
			onActivated = function()
				-- upvalues: selectedAction (ref), v (ref), onActivated (ref)
				if selectedAction == v.action and v.allowRepeatedActivation ~= true then
					return
				end
				onActivated(v)
			end,
			size = inputSize.Small,
			variant = buttonVariant.Utility,
			testId = v.testId or `{testId}-{v.iconName}`
		})
	end
	return reactModule.createElement(view, {
		tag = "row align-y-center size-full-0 auto-y padding-top-small",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Actions = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row wrap align-x-right align-y-center gap-small auto-xy"
		}, t)
	})
end