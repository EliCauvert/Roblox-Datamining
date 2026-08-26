local parent = script:FindFirstAncestor("AvatarExperienceControlBar").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function()
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var1, var2 = reactModule.useBinding(false)
	
	return var1, reactModule.useCallback(function(p1)
		-- upvalues: foundationModule (copy), var2 (ref)
		if p1 == foundationModule.Enums.ControlState.Default then
			var2(false)
			
			return
		elseif p1 == foundationModule.Enums.ControlState.Hover then
			var2(true)
		end
	end, {})
end