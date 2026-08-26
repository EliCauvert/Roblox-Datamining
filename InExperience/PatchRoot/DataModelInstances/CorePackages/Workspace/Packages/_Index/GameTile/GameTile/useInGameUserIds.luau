local reactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref)
		if not p1 or not p2 then
			return {}
		end
		local t = {}
		
		for i, v in p2 do
			if i ~= p1 then
				table.insert(t, i)
			end
		end
		return t
	end, { p1, p2 })
end