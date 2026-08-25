local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local compositionStyleSheet = require(parent.AppComposition).CompositionStyleSheet

return function()
	-- upvalues: compositionStyleSheet (ref), reactModule (ref)
	return if compositionStyleSheet then reactModule.createElement(compositionStyleSheet) else nil
end