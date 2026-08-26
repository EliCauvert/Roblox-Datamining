return function(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return Enum[p1][p2]
	end)
	
	return if ok then status else nil
end