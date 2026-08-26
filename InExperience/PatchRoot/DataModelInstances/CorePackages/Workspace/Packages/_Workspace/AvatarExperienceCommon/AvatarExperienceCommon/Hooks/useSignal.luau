local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(value, p1)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var1, var2 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), value (ref), p1 (ref)
		return signalsModule.createSignal(value, p1)
	end, {})
	
	return var1, var2
end