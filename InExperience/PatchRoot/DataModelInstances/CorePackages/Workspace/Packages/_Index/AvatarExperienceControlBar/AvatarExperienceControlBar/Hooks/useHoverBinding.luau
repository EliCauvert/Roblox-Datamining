local parent = script:FindFirstAncestor("AvatarExperienceControlBar").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function() --[[ line: 7 | named "useHoverBinding" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var2, var3 = reactModule.useBinding(false)
	
	return var2, reactModule.useCallback(function(p0) --[[ line: 11 ]]
		-- upvalues: foundationModule (copy), var3 (ref)
		if p0 == foundationModule.Enums.ControlState.Default then
			var3(false)
			
			return
		elseif p0 == foundationModule.Enums.ControlState.Hover then
			var3(true)
		end
	end, {})
end