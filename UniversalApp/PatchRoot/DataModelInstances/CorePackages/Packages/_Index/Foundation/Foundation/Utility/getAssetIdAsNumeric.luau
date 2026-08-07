return function(value) --[[ line: 3 | named "getAssetIdAsNumeric" ]]
	if typeof(value) == "number" then
		return value
	end
	local var0 = tonumber(value:match("(%d+)$"))
	
	return var0 or -1
end