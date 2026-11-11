local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local CompositionStyleSheet = require(Parent.AppComposition).CompositionStyleSheet

return function()
	-- upvalues: CompositionStyleSheet (copy), ReactModule (copy)
	return if CompositionStyleSheet then ReactModule.createElement(CompositionStyleSheet) else nil
end