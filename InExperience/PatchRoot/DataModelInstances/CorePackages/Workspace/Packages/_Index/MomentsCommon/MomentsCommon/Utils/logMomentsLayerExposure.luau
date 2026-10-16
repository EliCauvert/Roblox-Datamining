return function(LayerName, IXPService) --[[ Line: 7 | Named "logMomentsLayerExposure" ]]
	if LayerName == "" then return end
	local IXPService1 = IXPService
	
	if IXPService1 == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		IXPService1 = game:GetService("IXPService")
	end
	pcall(function() --[[ Line: 20 ]]
		-- upvalues: IXPService1 (ref), LayerName (copy)
		IXPService1:LogFlagLinkedUserLayerExposure(LayerName)
	end)
end