return function(p1, List)
	local t = {}
	
	for i, value in pairs(List) do
		t[p1[i]] = value
	end
	local Meta = getmetatable(p1)
	local Index = Meta.__index
	
	function Meta:__index(p2)
		-- upvalues: t (copy), Index (copy)
		return if p2 == "toRawValue" then function(p3)
			-- upvalues: t (upval)
			return t[p3]
		end else Index[p2]
	end
end