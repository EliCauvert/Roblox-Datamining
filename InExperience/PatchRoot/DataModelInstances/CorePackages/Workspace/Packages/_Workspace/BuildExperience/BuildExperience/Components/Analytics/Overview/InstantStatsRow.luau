local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local InstantStatCardModule = require(script.Parent.InstantStatCard)

return function(p1) --[[ Line: 17 | Named "InstantStatsRow" ]]
	-- upvalues: ReactModule (copy), View (copy), InstantStatCardModule (copy)
	local Elements = {}
	
	for LayoutOrder, stat in p1.stats do
		Elements[`Cell{LayoutOrder}`] = ReactModule.createElement(View, { tag = "fill auto-y", LayoutOrder = LayoutOrder }, {
			Card = ReactModule.createElement(InstantStatCardModule, {
				label = stat.label,
				valueText = stat.valueText,
				icon = stat.icon,
				isLoading = stat.isLoading,
				testId = stat.testId
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "InstantStatsRow"
	}, Elements)
end