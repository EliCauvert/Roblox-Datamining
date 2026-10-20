local function alwaysTrue(): boolean
	return true
end

return function(List, p1): number
	-- upvalues: alwaysTrue (copy)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local Count = 0
	local Callback = p1 or alwaysTrue
	
	for i, value in pairs(List) do
		if Callback(value, i) then
			Count += 1
		end
	end
	return Count
end