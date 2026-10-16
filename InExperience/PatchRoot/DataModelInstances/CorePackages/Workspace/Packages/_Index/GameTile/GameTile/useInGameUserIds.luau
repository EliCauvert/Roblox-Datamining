local ReactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p1, p2) --[[ Line: 5 | Named "useInGameUserIds" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 6 ]]
		-- upvalues: p1 (copy), p2 (copy)
		if not p1 or not p2 then
			return {}
		end
		local List = {}
		
		for i, _ in p2 do
			if i ~= p1 then
				table.insert(List, i)
			end
		end
		return List
	end, { p1, p2 })
end