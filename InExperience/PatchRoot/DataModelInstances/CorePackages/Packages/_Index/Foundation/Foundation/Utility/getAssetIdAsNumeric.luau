return function(value)
	if typeof(value) == "number" then
		return value
	end
	local var0 = tonumber(value:match("(%d+)$"))
	
	return var0 or -1
end