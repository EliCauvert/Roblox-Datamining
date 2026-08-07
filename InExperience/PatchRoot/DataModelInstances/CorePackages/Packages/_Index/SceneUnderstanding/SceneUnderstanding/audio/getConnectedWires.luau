return function(p0, p1) --[[ line: 1 | named "getConnectedWires" ]]
	local ok, status = pcall(function() --[[ line: 2 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return p0:GetConnectedWires(p1)
	end)
	
	return if ok then status else {}
end