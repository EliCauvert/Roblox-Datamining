return function(p1, p2, p3) --[[ Line: 15 | Named "safelyAccessProperty" ]]
	local Success, Result = pcall(function() --[[ Line: 16 ]]
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2]
	end)
	
	return if Success then Result else p3
end