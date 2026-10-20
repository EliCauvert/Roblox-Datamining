local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(BuildExperience.Components.BuildOverflowSheetButton.BuildOverflowSheetButton)

return function(_)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium auto-xy padding-x-xlarge padding-y-small",
		testId = "build-controls"
	}, { Overflow = nil })
end