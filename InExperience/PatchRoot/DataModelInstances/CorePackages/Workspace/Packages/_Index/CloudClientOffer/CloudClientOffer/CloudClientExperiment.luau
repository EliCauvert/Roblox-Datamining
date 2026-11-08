return function(IXPService, LayerName)
	return {
		isTreatment = function(): boolean
			-- upvalues: LayerName (copy), IXPService (copy)
			if LayerName == "" then
				return true
			else
				local Success, Result = pcall(function()
					-- upvalues: IXPService (upval), LayerName (upval)
					return IXPService:GetUserLayerVariables(LayerName)
				end)
				
				return Success and (type(Result) == "table" and Result.EnableCloudClientOffer == true)
			end
		end,
		logExposure = function()
			-- upvalues: LayerName (copy), IXPService (copy)
			if LayerName ~= "" then
				pcall(function()
					-- upvalues: IXPService (upval), LayerName (upval)
					IXPService:LogUserLayerExposure(LayerName)
				end)
				
				return
			end
		end
	}
end