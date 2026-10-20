local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Heading = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
			Text = p1.title,
			testId = if p1.testId then `{p1.testId}-heading` else nil
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y",
			testId = if p1.testId then `{p1.testId}-content` else nil
		}, p1.children)
	})
end