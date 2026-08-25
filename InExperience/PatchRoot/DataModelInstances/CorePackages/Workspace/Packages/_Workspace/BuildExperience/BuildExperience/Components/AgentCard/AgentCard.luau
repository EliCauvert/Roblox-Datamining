local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View

return function(p0)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	local testId = p0.testId or "agent-card"
	
	return reactModule.createElement(view, {
		tag = "col gap-xxsmall size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
			Text = p0.title
		}),
		Content = reactModule.createElement(text, {
			LayoutOrder = 2,
			RichText = true,
			tag = "size-full-2000 text-body-medium text-wrap text-align-x-left text-align-y-top text-truncate-end content-emphasis",
			Text = p0.textContent,
			testId = `{testId}-text-content`
		}),
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children)
	})
end