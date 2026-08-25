return function(p0, p1)
	local ok, status = pcall(function()
		-- upvalues: p0 (ref), p1 (ref)
		return p0:GetConnectedWires(p1)
	end)
	
	return if ok then status else {}
end