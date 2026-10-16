return function(p1, p2) --[[ Line: 10 | Named "zip" ]]
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local v4 = nil
	
	return function() --[[ Line: 12 ]]
		-- upvalues: v1 (ref), v3 (ref), p1 (copy), v2 (ref), v4 (ref), p2 (copy)
		v1, v2 = next(p1, v1)
		v2, v3 = next(p2, v2)
		
		if v3 and v4 then
			return v3, v4
		else
			return nil
		end
	end
end