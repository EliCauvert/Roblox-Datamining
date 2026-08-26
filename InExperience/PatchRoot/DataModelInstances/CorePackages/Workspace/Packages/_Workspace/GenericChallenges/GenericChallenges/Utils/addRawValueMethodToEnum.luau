return function(p1, p2)
	local t = {}
	
	for i, v in pairs(p2) do
		t[p1[i]] = v
	end
	local var1 = getmetatable(p1)
	local index = var1.__index
	
	function var1:__index(p3)
		-- upvalues: t (ref), index (ref)
		return if p3 == "toRawValue" then function(p4)
			-- upvalues: t (copy)
			return t[p4]
		end else index[p3]
	end
end