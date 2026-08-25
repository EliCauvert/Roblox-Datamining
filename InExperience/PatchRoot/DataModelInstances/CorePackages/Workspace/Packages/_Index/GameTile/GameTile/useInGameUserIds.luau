local reactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), p1 (ref)
		if not p0 or not p1 then
			return {}
		end
		local t = {}
		
		for i, v in p1 do
			if i ~= p0 then
				table.insert(t, i)
			end
		end
		return t
	end, { p0, p1 })
end