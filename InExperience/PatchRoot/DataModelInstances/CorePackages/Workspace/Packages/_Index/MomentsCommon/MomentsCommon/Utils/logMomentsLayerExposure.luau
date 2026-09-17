return function(p1, p2)
	if p1 == "" then return end
	local var1 = p2
	
	if var1 == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		var1 = game:GetService("IXPService")
	end
	pcall(function()
		-- upvalues: var1 (write), p1 (ref)
		var1:LogFlagLinkedUserLayerExposure(p1)
	end)
end