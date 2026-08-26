return function(value)
	if typeof(value) == "number" then
		return value
	end
	local var1 = tonumber(value:match("(%d+)$"))
	
	return var1 or -1
end