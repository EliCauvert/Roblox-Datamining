return function(p0, p1)
	local ok, status = pcall(function()
		-- upvalues: p0 (ref), p1 (ref)
		return Enum[p0][p1]
	end)
	
	return if ok then status else nil
end