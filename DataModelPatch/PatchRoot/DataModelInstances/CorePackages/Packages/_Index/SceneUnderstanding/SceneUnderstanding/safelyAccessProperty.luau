return function(p1, p2, p3)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2]
	end)
	
	return if Success then Result else p3
end