local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local CompositionStyleSheet = require(Parent.AppComposition).CompositionStyleSheet

return function() --[[ Line: 9 | Named "BuildExperienceCompositionStyleSheet" ]]
	-- upvalues: CompositionStyleSheet (copy), ReactModule (copy)
	return if CompositionStyleSheet then ReactModule.createElement(CompositionStyleSheet) else nil
end