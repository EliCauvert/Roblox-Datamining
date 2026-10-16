local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local _ = require(BuildExperience.Analytics.AnalyticsWindow)

return function(p1) --[[ Line: 33 | Named "WindowSegmentedControl" ]]
	-- upvalues: ReactModule (copy), View (copy), StateLayerAffordance (copy), Text (copy)
	local TestId = p1.testId or "WindowSegmentedControl"
	local Elements = {}
	
	for LayoutOrder, window in p1.windows do
		local IsIdMatch = window.id == p1.selectedWindowId
		Elements[`Tab_{window.id}`] = ReactModule.createElement(View, {
			LayoutOrder = LayoutOrder,
			tag = {
				["row align-x-center align-y-center fill auto-y padding-x-medium padding-y-small radius-circle"] = true,
				["bg-shift-300"] = IsIdMatch
			},
			stateLayer = { affordance = StateLayerAffordance.Background },
			onActivated = function() --[[ Line: 48 ]]
				-- upvalues: p1 (copy), window (copy)
				p1.onWindowSelected(window.id)
			end,
			testId = `{TestId}-segment-{window.id}`
		}, {
			Label = ReactModule.createElement(Text, {
				Text = window.label,
				tag = {
					["size-full-0 auto-y text-label-medium text-align-x-center text-truncate-end"] = true,
					["content-emphasis"] = IsIdMatch,
					["content-default"] = not IsIdMatch
				}
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-xxsmall size-full-0 auto-y padding-xsmall stroke-standard stroke-emphasis radius-circle",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, Elements)
end