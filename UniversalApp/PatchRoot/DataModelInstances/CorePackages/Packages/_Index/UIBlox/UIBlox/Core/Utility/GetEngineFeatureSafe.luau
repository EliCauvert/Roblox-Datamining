return function(p0)
	local ok, status = pcall(function()
		-- upvalues: p0 (ref)
		return game:GetEngineFeature(p0)
	end)
	
	return ok and status
end