local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local text = require(parent.Foundation).Text

return function(p1)
	-- upvalues: reactModule (ref), text (ref)
	return if p1.text == nil or p1.text == "" then nil else reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-system-alert",
		Text = p1.text,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	})
end