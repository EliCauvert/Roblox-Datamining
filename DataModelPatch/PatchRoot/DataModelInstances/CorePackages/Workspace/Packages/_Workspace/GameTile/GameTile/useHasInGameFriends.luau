local ReactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy)
	return (ReactModule.useMemo(function(): boolean
		-- upvalues: p1 (copy), p2 (copy), p3 (copy)
		if not p1 or not p2 or not p3 then
			return false
		end
		for _, value in pairs(p3) do
			if value ~= p1 then
				local v1 = p2[value]
				
				if v1 and v1.isFriend then
					return true
				end
			end
		end
		return false
	end, { p1, p2, p3 }))
end