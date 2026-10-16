local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local Text = require(Parent.Foundation).Text

return function(Frame) --[[ Line: 14 | Named "HeaderText" ]]
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
		testId = "build-header-text",
		Text = Frame.text,
		LayoutOrder = Frame.LayoutOrder
	})
end