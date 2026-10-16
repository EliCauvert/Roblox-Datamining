local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local _ = require(Foundation.Components.Types)

local function getAspectRatio(AspectRatio) --[[ Line: 14 ]]
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(AspectRatio) or typeof(AspectRatio) == "number" then {
		AspectType = nil,
		DominantAxis = nil,
		AspectRatio = AspectRatio
	} else {
		AspectRatio = AspectRatio.AspectRatio,
		AspectType = AspectRatio.AspectType,
		DominantAxis = AspectRatio.DominantAxis
	}
end

return ReactModule.memo(function(p1) --[[ Line: 41 | Named "AspectRatio" ]]
	-- upvalues: getAspectRatio (copy), ReactModule (copy), GetTestIdTagModule (copy)
	local AspectRatio = getAspectRatio(p1.value)
	
	return ReactModule.createElement("UIAspectRatioConstraint", {
		AspectRatio = AspectRatio.AspectRatio,
		AspectType = AspectRatio.AspectType,
		DominantAxis = AspectRatio.DominantAxis,
		[ReactModule.Tag] = GetTestIdTagModule(p1.testId)
	})
end)