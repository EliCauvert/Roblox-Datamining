local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
local roactModule = require(script.Parent.Roact)
local tModule = require(script.Parent.t)
local cryoModule = require(script.Parent.Cryo)
local experimentContextModule = require(script.ExperimentContext)
local ixpServiceProp = require(script.Symbol).named("IxpServiceProp")

local function connect(p1, p2, p3, p4, p5)
	-- upvalues: tModule (ref), roactModule (ref), ixpServiceProp (ref), cryoModule (ref), experimentContextModule (ref)
	assert(tModule.string(p1))
	assert(tModule.string(p2))
	assert(tModule.string(p3))
	assert(tModule.string(p4))
	assert(tModule.string(p5))
	
	return function(p6, p7, p8)
		-- upvalues: roactModule (copy), ixpServiceProp (copy), p3 (ref), p5 (ref), p4 (ref), p2 (ref), cryoModule (copy), p1 (ref), experimentContextModule (copy)
		if p8 == nil then
			p8 = true
		end
		local trac = debug.traceback()
		assert(type(p6) == "table", "connect expects layerNames to be a list of layers")
		assert(type(p7) == "function", "connect expects mapLayersToProps to be a function")
		
		return function(p9)
			-- upvalues: trac (ref), roactModule (copy), ixpServiceProp (copy), p6 (ref), p3 (copy), p8 (write), p5 (copy), p4 (copy), p2 (copy), cryoModule (copy), p7 (ref), p1 (copy), experimentContextModule (copy)
			if p9 == nil then
				error(string.format("connect returns a function that must be passed a component.\n Check the connection at:\n %s", trac), 2)
			end
			local var1 = roactModule.PureComponent:extend(("AppExperiment(%s)"):format(tostring(p9)))
			
			function var9.init(p10)
				-- upvalues: ixpServiceProp (copy), p6 (copy), p3 (copy), p8 (copy), p5 (copy), p4 (copy), p2 (copy)
				p10.onLoadingStatusChangeConnection = nil
				p10.state = {
					layerToVariables = {},
					layerLoadingStatus = Enum.IXPLoadingStatus.None
				}
				
				function p9.updateStateLayerData(p11)
					-- upvalues: p10 (ref), ixpServiceProp (copy), p6 (copy), p3 (copy)
					local var2 = p10.props[ixpServiceProp]
					
					if var2 ~= nil then
						local t = {}
						
						for i, v in ipairs(p6) do
							t[v] = var2[p3](var2, v)
						end
						p10:setState({ layerToVariables = t, layerLoadingStatus = p11 })
					end
				end
				
				function p9.logAllLayersExposure(p12)
					-- upvalues: p10 (ref), ixpServiceProp (copy), p8 (copy), p6 (copy), p5 (copy), p4 (copy)
					local var3 = p10.props[ixpServiceProp]
					
					if var3 ~= nil and p12 == Enum.IXPLoadingStatus.Initialized and p8 then
						for i, v in ipairs(p6) do
							if var3[p5](var3, v) == Enum.IXPLoadingStatus.Initialized then
								var3[p4](var3, v)
							end
						end
					end
				end
				
				local var4 = p10.props[ixpServiceProp]
				
				if var4 ~= nil then
					p10.updateStateLayerData(var4[p2](var4))
				end
			end
			
			function var9.render(p12)
				-- upvalues: cryoModule (copy), ixpServiceProp (copy), p7 (copy), roactModule (copy), p9 (ref)
				local var3 = cryoModule.Dictionary.join(p12.props, { [ixpServiceProp] = cryoModule.None })
				
				return roactModule.createElement(p9, cryoModule.Dictionary.join(var3, p7(p12.state.layerToVariables, var3)))
			end
			
			function var9.didMount(p12)
				-- upvalues: ixpServiceProp (copy), p1 (copy), p2 (copy), p3 (copy)
				local var3 = p12.props[ixpServiceProp]
				
				if var3 ~= nil then
					p12.onLoadingStatusChangeConnection = var3[p1]:Connect(function(_)
						-- upvalues: var3 (ref), p2 (copy), p12 (ref), p3 (copy)
						local var4 = var3[p2](var3)
						
						if p12.state.layerLoadingStatus ~= var4 then
							p12.updateStateLayerData(var4, p3)
							p12.logAllLayersExposure(var4)
						end
					end)
					local var4 = var3[p2](var3)
					
					if p12.state.layerLoadingStatus ~= var4 then
						p12.updateStateLayerData(var4, p3)
					end
					p12.logAllLayersExposure(var4)
				end
			end
			
			function var9.willUnmount(p12)
				if p12.onLoadingStatusChangeConnection ~= nil then
					p12.onLoadingStatusChangeConnection:Disconnect()
				end
			end
			
			return function(p12)
				-- upvalues: roactModule (copy), experimentContextModule (copy), ixpServiceProp (copy), cryoModule (copy), var1 (ref)
				return roactModule.createElement(experimentContextModule.Consumer, {
					render = function(p13)
						-- upvalues: p12 (ref), ixpServiceProp (copy), cryoModule (copy), roactModule (copy), var1 (copy)
						assert(p12[ixpServiceProp] == nil, "Symbol 'IxpServiceProp' should never exist in the incoming props.")
						
						return roactModule.createElement(var1, cryoModule.Dictionary.join(p12, { [ixpServiceProp] = p13 }))
					end
				})
			end
		end
	end
end

return {
	Provider = experimentContextModule.Provider,
	Consumer = experimentContextModule.Consumer,
	Context = experimentContextModule,
	registerUserLayers = function(p9)
		-- upvalues: tModule (ref), IXPService (ref), runService (ref)
		assert(tModule.table(p9))
		
		if IXPService ~= nil then
			if runService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			local t = {}
			
			for i, v in pairs(p9) do
				table.insert(t, v)
			end
			IXPService:RegisterUserLayers(t)
		end
	end,
	initializeUserLayers = function(p10)
		-- upvalues: IXPService (ref)
		if IXPService ~= nil then
			IXPService:InitializeUserLayers(p10)
		end
	end,
	clearUserLayers = function()
		-- upvalues: IXPService (ref)
		if IXPService ~= nil then
			IXPService:ClearUserLayers()
		end
	end,
	useBrowserTrackerExperiment = require(script.useBrowserTrackerExperiment),
	useUserExperiment = require(script.useUserExperiment),
	useIXPService = require(script.useIXPService),
	connectBrowserTrackerLayer = connect("OnBrowserTrackerLayerLoadingStatusChanged", "GetBrowserTrackerLayerLoadingStatus", "GetBrowserTrackerLayerVariables", "LogBrowserTrackerLayerExposure", "GetBrowserTrackerStatusForLayer"),
	connectUserLayer = connect("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer"),
	MockIXPService = require(script.MockIXPService)
}