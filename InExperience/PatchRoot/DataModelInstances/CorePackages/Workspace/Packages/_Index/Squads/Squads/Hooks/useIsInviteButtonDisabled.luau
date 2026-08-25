local dependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local cryo = dependenciesModule.Cryo
local react = dependenciesModule.React

return function(p0, p1, p2)
	-- upvalues: react (ref), cryo (ref)
	return react.useMemo(function()
		-- upvalues: p2 (ref), p0 (ref), cryo (copy), p1 (ref)
		if p2 == nil then
			return p0 == 0
		end
		local var1 = cryo.List.toSet(p2)
		
		if p0 < #p2 then
			return false
		end
		for i, v in p1 do
			if not var1[tostring(i)] then
				return false
			end
		end
		return true
	end, { p0, p1, p2 })
end