local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	return (ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), p2 (copy)
		return SignalsModule.createComputed(p1, p2)
	end, {}))
end