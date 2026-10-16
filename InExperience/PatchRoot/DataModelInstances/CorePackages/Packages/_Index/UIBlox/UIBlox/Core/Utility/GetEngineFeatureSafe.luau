return function(Name) --[[ Line: 8 | Named "GetEngineFeatureSafe" ]]
	local Success, Result = pcall(function() --[[ Line: 9 ]]
		-- upvalues: Name (copy)
		return game:GetEngineFeature(Name)
	end)
	
	return Success and Result
end