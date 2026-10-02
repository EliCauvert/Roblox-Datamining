local parent = script:FindFirstAncestor("FriendsCalling").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "align-x-center align-y-center radius-circle bg-surface-300",
		Size = UDim2.fromOffset(p1.size, p1.size),
		testId = p1.testId
	}, {
		Label = reactModule.createElement(text, {
			Text = "Avatar Here",
			tag = "auto-xy text-body-small content-default"
		})
	})
end