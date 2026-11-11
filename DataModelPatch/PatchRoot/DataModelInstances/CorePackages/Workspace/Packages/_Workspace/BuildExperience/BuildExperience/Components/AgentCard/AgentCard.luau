local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	local TestId = p1.testId or "agent-card"
	
	return ReactModule.createElement(View, {
		tag = "col gap-xxsmall size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Header = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
			Text = p1.title
		}),
		Content = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			RichText = true,
			tag = "size-full-2000 text-body-medium text-wrap text-align-x-left text-align-y-top text-truncate-end content-emphasis",
			Text = p1.textContent,
			testId = `{TestId}-text-content`
		}),
		Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
	})
end