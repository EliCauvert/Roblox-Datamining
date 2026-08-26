local function deepcopy(p1)
	-- upvalues: deepcopy (ref)
	local _ = nil
	
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, v in next, p1 do
		t[deepcopy(i)] = deepcopy(v)
	end
	setmetatable(t, deepcopy(getmetatable(p1)))
	
	return t
end

return deepcopy