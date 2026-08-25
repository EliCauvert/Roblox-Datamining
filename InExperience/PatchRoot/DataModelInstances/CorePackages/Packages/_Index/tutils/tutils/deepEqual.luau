local function deepEqual(p0, p1, p2)
	-- upvalues: deepEqual (ref)
	if p0 == p1 then
		return true
	end
	local var1 = type(p0)
	
	if var1 ~= type(p1) then
		return false
	elseif var1 ~= "table" then
		return false
	elseif not p2 then
		local var2 = getmetatable(p0)
		
		if var2 and var2.__eq then
			return p0 == p1
		end
	end
	local t = {}
	
	for i, v in pairs(p0) do
		local var4 = p1[i]
		
		if var4 ~= nil and deepEqual(v, var4, p2) then
			t[i] = true
			continue
		end
		return false
	end
	for i_1, v in pairs(p1) do
		if not t[i_1] then
			return false
		end
	end
	return true
end

return deepEqual