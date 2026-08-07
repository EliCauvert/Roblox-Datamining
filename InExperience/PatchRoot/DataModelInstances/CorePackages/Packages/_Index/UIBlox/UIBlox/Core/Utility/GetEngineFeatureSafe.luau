return function(p0) --[[ line: 8 | named "GetEngineFeatureSafe" ]]
	local ok, status = pcall(function() --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		return game:GetEngineFeature(p0)
	end)
	
	return ok and status
end