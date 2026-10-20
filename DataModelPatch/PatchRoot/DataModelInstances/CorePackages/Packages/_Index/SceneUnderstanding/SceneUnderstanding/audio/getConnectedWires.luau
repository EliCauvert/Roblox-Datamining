return function(p1, p2)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		return p1:GetConnectedWires(p2)
	end)
	
	return if Success then Result else {}
end