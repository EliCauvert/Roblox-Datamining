local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local text = require(parent.Foundation).Text

return function(p0) --[[ line: 14 | named "HeaderText" ]]
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
		testId = "build-header-text",
		Text = p0.text,
		LayoutOrder = p0.LayoutOrder
	})
end