return function(p1, p2, p3)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1[p2]
	end)
	
	return if ok then status else p3
end