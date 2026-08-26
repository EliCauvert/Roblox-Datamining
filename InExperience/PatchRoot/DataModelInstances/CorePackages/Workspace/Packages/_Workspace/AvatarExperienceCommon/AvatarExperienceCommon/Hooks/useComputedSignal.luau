local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(value, p1)
	-- upvalues: reactModule (ref), signalsModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), value (ref), p1 (ref)
		return signalsModule.createComputed(value, p1)
	end, {})
end