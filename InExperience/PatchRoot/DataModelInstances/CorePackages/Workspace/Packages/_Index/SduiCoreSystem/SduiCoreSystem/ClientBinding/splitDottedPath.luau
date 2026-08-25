local t = {}

return function(vectorA)
	-- upvalues: t (ref)
	local var1 = t[vectorA]
	
	if var1 == nil then
		local parts = string.split(vectorA, ".")
		table.freeze(parts)
		t[vectorA] = parts
		
		return parts
	end
	return var1
end