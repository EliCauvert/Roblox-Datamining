local dependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local cryo = dependenciesModule.Cryo
local react = dependenciesModule.React

return function(p1, p2, p3)
	-- upvalues: react (ref), cryo (ref)
	return react.useMemo(function()
		-- upvalues: p3 (ref), p1 (ref), cryo (copy), p2 (ref)
		if p3 == nil then
			return p1 == 0
		end
		local var1 = cryo.List.toSet(p3)
		
		if p1 < #p3 then
			return false
		end
		for i, v in p2 do
			if not var1[tostring(i)] then
				return false
			end
		end
		return true
	end, { p1, p2, p3 })
end