local function deepEqual(p1, p2, p3)
	-- upvalues: deepEqual (ref)
	if p1 == p2 then
		return true
	end
	local var1 = type(p1)
	
	if var1 ~= type(p2) then
		return false
	elseif var1 ~= "table" then
		return false
	elseif not p3 then
		local var2 = getmetatable(p1)
		
		if var2 and var2.__eq then
			return p1 == p2
		end
	end
	local t = {}
	
	for i, v in pairs(p1) do
		local var3 = p2[i]
		
		if var3 ~= nil and deepEqual(v, var3, p3) then
			t[i] = true
			continue
		end
		return false
	end
	for i_1, v in pairs(p2) do
		if not t[i_1] then
			return false
		end
	end
	return true
end

return deepEqual