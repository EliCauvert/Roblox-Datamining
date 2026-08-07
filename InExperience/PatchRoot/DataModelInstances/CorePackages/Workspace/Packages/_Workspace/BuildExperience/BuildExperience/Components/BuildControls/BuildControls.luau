local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(buildExperience.Components.BuildOverflowSheetButton.BuildOverflowSheetButton)

return function(_) --[[ line: 20 | named "BuildControls" ]]
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium auto-xy padding-x-xlarge padding-y-small",
		testId = "build-controls"
	}, { Overflow = nil })
end