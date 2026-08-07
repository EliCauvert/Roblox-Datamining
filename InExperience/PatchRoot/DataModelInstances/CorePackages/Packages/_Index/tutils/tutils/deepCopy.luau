local function deepCopy(p0, p1) --[[ line: 9 ]]
	-- upvalues: deepCopy (ref)
	if type(p0) ~= "table" then
		return p0
	elseif p1 and p1[p0] then
		return p1[p0]
	end
	p1 = p1 or {}
	local tbl = setmetatable({}, getmetatable(p0))
	p1[p0] = tbl
	
	for i, v in pairs(p0) do
		tbl[deepCopy(i, p1)] = deepCopy(v, p1)
	end
	return tbl
end

return deepCopy