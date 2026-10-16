return function(p1, p2) --[[ Line: 1 | Named "getConnectedWires" ]]
	local Success, Result = pcall(function() --[[ Line: 2 ]]
		-- upvalues: p1 (copy), p2 (copy)
		return p1:GetConnectedWires(p2)
	end)
	
	return if Success then Result else {}
end