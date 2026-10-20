return function(p1, p2)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return Enum[p1][p2]
	end)
	
	return if Success then Result else nil
end