return function(p0, p1, p2) --[[ line: 15 | named "safelyAccessProperty" ]]
	local ok, status = pcall(function() --[[ line: 16 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return p0[p1]
	end)
	
	return if ok then status else p2
end