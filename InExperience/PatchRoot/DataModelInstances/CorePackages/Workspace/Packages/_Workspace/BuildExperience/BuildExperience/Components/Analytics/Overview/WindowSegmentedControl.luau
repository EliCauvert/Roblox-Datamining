local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local _ = require(buildExperience.Analytics.AnalyticsWindow)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), stateLayerAffordance (ref), text (ref)
	local testId = p1.testId or "WindowSegmentedControl"
	local t = {}
	
	for i, v in p1.windows do
		local var1 = v.id == p1.selectedWindowId
		t[`Tab_{v.id}`] = reactModule.createElement(view, {
			LayoutOrder = i,
			tag = {
				["row align-x-center align-y-center fill auto-y padding-x-medium padding-y-small radius-circle"] = true,
				["bg-shift-300"] = var1
			},
			stateLayer = { affordance = stateLayerAffordance.Background },
			onActivated = function()
				-- upvalues: p1 (ref), v (ref)
				p1.onWindowSelected(v.id)
			end,
			testId = `{testId}-segment-{v.id}`
		}, {
			Label = reactModule.createElement(text, {
				Text = v.label,
				tag = {
					["size-full-0 auto-y text-label-medium text-align-x-center text-truncate-end"] = true,
					["content-emphasis"] = var1,
					["content-default"] = not var1
				}
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-xxsmall size-full-0 auto-y padding-xsmall stroke-standard stroke-emphasis radius-circle",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, t)
end