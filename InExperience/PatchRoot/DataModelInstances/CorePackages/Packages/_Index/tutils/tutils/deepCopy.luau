local function deepCopy(Key, p1) --[[ Line: 9 ]]
	-- upvalues: deepCopy (copy)
	if type(Key) ~= "table" then
		return Key
	end
	if p1 and p1[Key] then
		return p1[Key]
	end
	local P1 = p1 or {}
	local self = setmetatable({}, (getmetatable(Key)))
	P1[Key] = self
	
	for i, value in pairs(Key) do
		self[deepCopy(i, P1)] = deepCopy(value, P1)
	end
	return self
end

return deepCopy