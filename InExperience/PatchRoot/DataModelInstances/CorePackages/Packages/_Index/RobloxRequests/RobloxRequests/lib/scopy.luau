local function deepcopy(p0)
	-- upvalues: deepcopy (ref)
	local _ = nil
	
	if type(p0) ~= "table" then
		return p0
	end
	local t = {}
	
	for i, v in next, p0 do
		t[deepcopy(i)] = deepcopy(v)
	end
	setmetatable(t, deepcopy(getmetatable(p0)))
	
	return t
end

return deepcopy