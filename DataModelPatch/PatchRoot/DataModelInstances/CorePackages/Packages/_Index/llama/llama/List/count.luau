local function alwaysTrue(): boolean
	return true
end

return function(p1, p2): number
	-- upvalues: alwaysTrue (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local Callback = p2 or alwaysTrue
	local Count = 0
	
	for i = 1, #p1 do
		if Callback(p1[i], i) then
			Count += 1
		end
	end
	return Count
end