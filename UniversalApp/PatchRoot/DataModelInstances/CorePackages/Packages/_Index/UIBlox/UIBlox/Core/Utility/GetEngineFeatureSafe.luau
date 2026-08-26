return function(p1)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return game:GetEngineFeature(p1)
	end)
	
	return ok and status
end