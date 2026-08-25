local reactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p0, p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), p1 (ref), p2 (ref)
		if not p0 or not p1 or not p2 then
			return false
		end
		for i, v in pairs(p2) do
			if v ~= p0 then
				local var1 = p1[v]
				
				if var1 and var1.isFriend then
					return true
				end
			end
		end
		return false
	end, { p0, p1, p2 })
end