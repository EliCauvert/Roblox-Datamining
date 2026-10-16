local function deepcopy(p1) --[[ Line: 1 ]]
	-- upvalues: deepcopy (copy)
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, value in next, p1 do
		t[deepcopy(i)] = deepcopy(value)
	end
	setmetatable(t, deepcopy((getmetatable(p1))))
	
	return t
end

return deepcopy