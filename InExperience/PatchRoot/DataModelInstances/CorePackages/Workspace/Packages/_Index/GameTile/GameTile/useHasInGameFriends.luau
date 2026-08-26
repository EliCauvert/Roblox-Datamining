local reactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		if not p1 or not p2 or not p3 then
			return false
		end
		for i, v in pairs(p3) do
			if v ~= p1 then
				local var1 = p2[v]
				
				if var1 and var1.isFriend then
					return true
				end
			end
		end
		return false
	end, { p1, p2, p3 })
end