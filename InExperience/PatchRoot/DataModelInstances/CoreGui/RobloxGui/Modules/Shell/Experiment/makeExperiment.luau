local IXPService = game:GetService("IXPService")

return function(p1, p2, p3, p4, p5)
	-- upvalues: IXPService (ref)
	for i, v in {
		p1,
		p2,
		p3,
		p4,
		p5
	} do
		if not IXPService[v] then
			error("makeExperiment factory expects configured members to exist on IXPService. Member " .. v .. " not found")
		end
	end
	return function(p6, p7, p8, p9)
		-- upvalues: IXPService (copy), p3 (ref), p5 (ref), p4 (ref), p2 (ref), p1 (ref)
		if p9 == nil then
			p9 = true
		end
		assert(type(p7) == "table", "makeExperiment expects layerNames to be a list of layers")
		assert(type(p8) == "function", "makeExperiment expects mapLayers to be a function")
		
		local function updateStateLayerData(p10)
			-- upvalues: p7 (ref), IXPService (copy), p3 (copy), p8 (ref)
			local t = {}
			
			for i, v in ipairs(p7) do
				t[v] = IXPService[p3](IXPService, v)
			end
			p8({ layerToVariables = t, layerLoadingStatus = p10 })
		end
		
		local function logAllLayersExposure()
			-- upvalues: p7 (ref), IXPService (copy), p5 (copy), p4 (copy)
			for i, v in ipairs(p7) do
				if IXPService[p5](IXPService, v) == Enum.IXPLoadingStatus.Initialized then
					IXPService[p4](IXPService, v)
				end
			end
		end
		
		updateStateLayerData(IXPService[p2](IXPService))
		local var1 = IXPService[p1]:Connect(function()
			-- upvalues: IXPService (copy), p2 (copy), updateStateLayerData (ref), p9 (write), logAllLayersExposure (ref)
			local var2 = IXPService[p2](IXPService)
			updateStateLayerData(var2)
			
			if p9 and var2 == Enum.IXPLoadingStatus.Initialized then
				logAllLayersExposure()
			end
		end)
		p6.Destroying:Once(function()
			-- upvalues: var1 (ref)
			var1:Disconnect()
		end)
		
		return var1
	end
end