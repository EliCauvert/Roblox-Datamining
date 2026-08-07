return function(p0, p1) --[[ line: 7 ]]
	local t = {}
	
	for i, v in pairs(p1) do
		t[p0[i]] = v
	end
	local var1 = getmetatable(p0)
	local index = var1.__index
	
	function var1:__index(p2) --[[ line: 15 ]]
		-- upvalues: t (ref), index (ref)
		return if p2 == "toRawValue" then function(p3) --[[ line: 17 ]]
			-- upvalues: t (copy)
			return t[p3]
		end else index[p2]
	end
end