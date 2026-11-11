return function(Name)
	local Success, Result = pcall(function()
		-- upvalues: Name (copy)
		return game:GetEngineFeature(Name)
	end)
	
	return Success and Result
end