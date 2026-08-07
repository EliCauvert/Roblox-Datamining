local IXPService = game:GetService("IXPService")

return function(p0, p1, p2, p3, p4) --[[ line: 23 | named "makeExperiment" ]]
	-- upvalues: IXPService (ref)
	for i, v in {
		p0,
		p1,
		p2,
		p3,
		p4
	} do
		if not IXPService[v] then
			error("makeExperiment factory expects configured members to exist on IXPService. Member " .. v .. " not found")
		end
	end
	return function(p5, p6, p7, p8) --[[ line: 44 ]]
		-- upvalues: IXPService (copy), p2 (ref), p4 (ref), p3 (ref), p1 (ref), p0 (ref)
		if p8 == nil then
			p8 = true
		end
		assert(type(p6) == "table", "makeExperiment expects layerNames to be a list of layers")
		assert(type(p7) == "function", "makeExperiment expects mapLayers to be a function")
		
		local function updateStateLayerData(p9) --[[ line: 57 ]]
			-- upvalues: p6 (ref), IXPService (copy), p2 (copy), p7 (ref)
			local t = {}
			
			for i, v in ipairs(p6) do
				t[v] = IXPService[p2](IXPService, v)
			end
			p7({ layerToVariables = t, layerLoadingStatus = p9 })
		end
		
		local function logAllLayersExposure() --[[ line: 69 ]]
			-- upvalues: p6 (ref), IXPService (copy), p4 (copy), p3 (copy)
			for i, v in ipairs(p6) do
				if IXPService[p4](IXPService, v) == Enum.IXPLoadingStatus.Initialized then
					IXPService[p3](IXPService, v)
				end
			end
		end
		
		updateStateLayerData(IXPService[p1](IXPService))
		local var3 = IXPService[p0]:Connect(function() --[[ line: 81 ]]
			-- upvalues: IXPService (copy), p1 (copy), updateStateLayerData (ref), p8 (write), logAllLayersExposure (ref)
			local var5 = IXPService[p1](IXPService)
			updateStateLayerData(var5)
			
			if p8 and var5 == Enum.IXPLoadingStatus.Initialized then
				logAllLayersExposure()
			end
		end)
		p5.Destroying:Once(function() --[[ line: 95 ]]
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end)
		
		return var3
	end
end