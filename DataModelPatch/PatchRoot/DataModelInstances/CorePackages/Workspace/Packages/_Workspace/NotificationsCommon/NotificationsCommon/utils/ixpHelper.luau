local IXPService = game:GetService("IXPService")

return {
	getIxpLayerData = function(LayerName)
		-- upvalues: IXPService (copy)
		local Success, Result = pcall(function()
			-- upvalues: IXPService (upval), LayerName (copy)
			return IXPService:GetUserLayerVariables(LayerName)
		end)
		
		return Success and Result or nil
	end,
	logUserLayerExposure = function(LayerName)
		-- upvalues: IXPService (copy)
		pcall(function()
			-- upvalues: IXPService (upval), LayerName (copy)
			IXPService:LogUserLayerExposure(LayerName)
		end)
	end
}