return function(p0, p1) --[[ line: 1 | named "resolveEnumItem" ]]
	local ok, status = pcall(function() --[[ line: 2 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return Enum[p0][p1]
	end)
	
	return if ok then status else nil
end