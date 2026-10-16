return function(p1, p2) --[[ Line: 1 | Named "resolveEnumItem" ]]
	local Success, Result = pcall(function() --[[ Line: 2 ]]
		-- upvalues: p1 (copy), p2 (copy)
		return Enum[p1][p2]
	end)
	
	return if Success then Result else nil
end