local IXPService = game:GetService("IXPService")

return {
	getIxpLayerData = function(LayerName) --[[ Line: 3 ]]
		-- upvalues: IXPService (copy)
		local Success, Result = pcall(function() --[[ Line: 4 ]]
			-- upvalues: IXPService (upval), LayerName (copy)
			return IXPService:GetUserLayerVariables(LayerName)
		end)
		
		return Success and Result or nil
	end,
	logUserLayerExposure = function(LayerName) --[[ Line: 11 ]]
		-- upvalues: IXPService (copy)
		pcall(function() --[[ Line: 12 ]]
			-- upvalues: IXPService (upval), LayerName (copy)
			IXPService:LogUserLayerExposure(LayerName)
		end)
	end
}