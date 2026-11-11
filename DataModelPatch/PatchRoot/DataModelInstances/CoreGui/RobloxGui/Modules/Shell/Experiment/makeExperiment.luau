local IXPService = game:GetService("IXPService")

return function(p1, p2, p3, p4, p5)
	-- upvalues: IXPService (copy)
	for _, value in {
		p1,
		p2,
		p3,
		p4,
		p5
	} do
		if not IXPService[value] then
			error("makeExperiment factory expects configured members to exist on IXPService. Member " .. value .. " not found")
		end
	end
	return function(p6, p7, Callback, p8: boolean)
		-- upvalues: IXPService (upval), p3 (copy), p5 (copy), p4 (copy), p2 (copy), p1 (copy)
		if p8 == nil then
			p8 = true
		end
		assert(type(p7) == "table", "makeExperiment expects layerNames to be a list of layers")
		assert(type(Callback) == "function", "makeExperiment expects mapLayers to be a function")
		
		local function updateStateLayerData(LayerLoadingStatus)
			-- upvalues: p7 (copy), IXPService (upval), p3 (upval), Callback (copy)
			local LayerToVariables = {}
			
			for _, value in ipairs(p7) do
				LayerToVariables[value] = IXPService[p3](IXPService, value)
			end
			Callback({
				layerToVariables = LayerToVariables,
				layerLoadingStatus = LayerLoadingStatus
			})
		end
		
		local function logAllLayersExposure()
			-- upvalues: p7 (copy), IXPService (upval), p5 (upval), p4 (upval)
			for _, value in ipairs(p7) do
				if IXPService[p5](IXPService, value) == Enum.IXPLoadingStatus.Initialized then
					IXPService[p4](IXPService, value)
				end
			end
		end
		
		updateStateLayerData((IXPService[p2](IXPService)))
		local Connection = IXPService[p1]:Connect(function()
			-- upvalues: IXPService (upval), p2 (upval), updateStateLayerData (copy), p8 (ref), logAllLayersExposure (copy)
			local IXPLoadingStatus = IXPService[p2](IXPService)
			updateStateLayerData(IXPLoadingStatus)
			
			if p8 and IXPLoadingStatus == Enum.IXPLoadingStatus.Initialized then
				logAllLayersExposure()
			end
		end)
		p6.Destroying:Once(function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end)
		
		return Connection
	end
end