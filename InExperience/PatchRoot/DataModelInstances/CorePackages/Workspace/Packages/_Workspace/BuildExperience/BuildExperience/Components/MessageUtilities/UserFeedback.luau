local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.FeedbackAction)
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 32 | named "UserFeedback" ]]
	-- upvalues: reactModule (ref), iconVariant (ref), iconButton (ref), inputSize (ref), buttonVariant (ref), view (ref)
	local testId = p0.testId or "user-feedback"
	local onActivated = p0.onActivated
	local var3, var4 = reactModule.useState(nil)
	local t = {}
	
	for i, v in p0.icons do
		t[`{v.iconName}-{i}`] = reactModule.createElement(iconButton, {
			LayoutOrder = i,
			icon = if var3 == v.action then { name = v.iconName, variant = iconVariant.Filled } else v.iconName,
			isDisabled = v.isDisabled,
			onActivated = function() --[[ line: 49 ]]
				-- upvalues: var3 (ref), v (ref), var4 (ref), onActivated (ref)
				if var3 == v.action and v.allowRepeatedActivation ~= true then
					return
				end
				var4(v.action)
				onActivated(v)
			end,
			size = inputSize.Small,
			variant = buttonVariant.Utility,
			testId = `{testId}-{v.iconName}`
		})
	end
	return reactModule.createElement(view, {
		tag = "row align-y-center size-full-0 auto-y padding-top-small",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		Actions = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row wrap align-x-right align-y-center gap-small auto-xy"
		}, t)
	})
end