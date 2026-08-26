local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local text = require(parent.Foundation).Text

return function(p1)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
		testId = "build-header-text",
		Text = p1.text,
		LayoutOrder = p1.LayoutOrder
	})
end