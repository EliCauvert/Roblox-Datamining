local DependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local Cryo = DependenciesModule.Cryo
local React = DependenciesModule.React

return function(p1, p2, p3)
	-- upvalues: React (copy), Cryo (copy)
	return React.useMemo(function(): boolean
		-- upvalues: p3 (copy), p1 (copy), Cryo (upval), p2 (copy)
		if p3 == nil then
			return p1 == 0
		end
		local Set = Cryo.List.toSet(p3)
		
		if p1 < #p3 then
			return false
		end
		for i, _ in p2 do
			if not Set[tostring(i)] then
				return false
			end
		end
		return true
	end, { p1, p2, p3 })
end