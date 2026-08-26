local function deepCopy(p1, p2)
	-- upvalues: deepCopy (ref)
	if type(p1) ~= "table" then
		return p1
	elseif p2 and p2[p1] then
		return p2[p1]
	end
	p2 = p2 or {}
	local tbl = setmetatable({}, getmetatable(p1))
	p2[p1] = tbl
	
	for i, v in pairs(p1) do
		tbl[deepCopy(i, p2)] = deepCopy(v, p2)
	end
	return tbl
end

return deepCopy