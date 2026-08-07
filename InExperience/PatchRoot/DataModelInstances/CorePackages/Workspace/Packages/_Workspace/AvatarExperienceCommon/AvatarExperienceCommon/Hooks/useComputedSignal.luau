local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(value, p0) --[[ line: 13 | named "useComputedSignal" ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	return reactModule.useMemo(function() --[[ line: 14 ]]
		-- upvalues: signalsModule (copy), value (ref), p0 (ref)
		return signalsModule.createComputed(value, p0)
	end, {})
end