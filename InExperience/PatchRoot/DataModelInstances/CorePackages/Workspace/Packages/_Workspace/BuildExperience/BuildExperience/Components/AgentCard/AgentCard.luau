local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), Text (copy), View (copy)
	local TestId = p1.testId or "agent-card"
	local config = {
		Header = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
			Text = p1.title
		}),
		Content = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			RichText = true,
			Text = p1.textContent,
			tag = if p1.fitToContent then "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis" else "size-full-2000 text-body-medium text-wrap text-align-x-left text-align-y-top text-truncate-end content-emphasis",
			testId = `{TestId}-text-content`
		}),
		Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
	}
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["col size-full-0 auto-y padding-large stroke-standard stroke-default radius-large"] = true,
			["gap-large"] = p1.footer ~= nil,
			["gap-xxsmall"] = p1.footer == nil
		},
		testId = TestId
	}, {
		Body = if p1.footer == nil then ReactModule.createElement(ReactModule.Fragment, nil, config) else ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, config),
		Footer = if p1.footer == nil then nil else ReactModule.createElement(View, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, { Content = p1.footer })
	})
end