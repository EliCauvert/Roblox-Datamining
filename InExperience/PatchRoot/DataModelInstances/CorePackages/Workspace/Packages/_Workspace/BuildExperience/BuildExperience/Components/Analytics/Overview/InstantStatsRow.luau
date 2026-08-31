local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local instantStatCardModule = require(script.Parent.InstantStatCard)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), instantStatCardModule (ref)
	local t = {}
	
	for i, v in p1.stats do
		t[`Cell{i}`] = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = i }, {
			Card = reactModule.createElement(instantStatCardModule, {
				label = v.label,
				valueText = v.valueText,
				icon = v.icon,
				isLoading = v.isLoading,
				testId = v.testId
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "InstantStatsRow"
	}, t)
end