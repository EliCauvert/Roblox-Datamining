local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Heading = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
			Text = p1.title,
			testId = if p1.testId then `{p1.testId}-heading` else nil
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y",
			testId = if p1.testId then `{p1.testId}-content` else nil
		}, p1.children)
	})
end