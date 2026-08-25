local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(value, p0)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var2, var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), value (ref), p0 (ref)
		return signalsModule.createSignal(value, p0)
	end, {})
	
	return var2, var3
end