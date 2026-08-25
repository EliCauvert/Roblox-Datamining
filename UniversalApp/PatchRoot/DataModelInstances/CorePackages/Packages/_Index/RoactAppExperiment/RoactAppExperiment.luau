local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
local roactModule = require(script.Parent.Roact)
local tModule = require(script.Parent.t)
local cryoModule = require(script.Parent.Cryo)
local experimentContextModule = require(script.ExperimentContext)
local ixpServiceProp = require(script.Symbol).named("IxpServiceProp")

local function connect(p0, p1, p2, p3, p4)
	-- upvalues: tModule (ref), roactModule (ref), ixpServiceProp (ref), cryoModule (ref), experimentContextModule (ref)
	assert(tModule.string(p0))
	assert(tModule.string(p1))
	assert(tModule.string(p2))
	assert(tModule.string(p3))
	assert(tModule.string(p4))
	
	return function(p5, p6, p7)
		-- upvalues: roactModule (copy), ixpServiceProp (copy), p2 (ref), p4 (ref), p3 (ref), p1 (ref), cryoModule (copy), p0 (ref), experimentContextModule (copy)
		if p7 == nil then
			p7 = true
		end
		local trac = debug.traceback()
		assert(type(p5) == "table", "connect expects layerNames to be a list of layers")
		assert(type(p6) == "function", "connect expects mapLayersToProps to be a function")
		
		return function(p8)
			-- upvalues: trac (ref), roactModule (copy), ixpServiceProp (copy), p5 (ref), p2 (copy), p7 (write), p4 (copy), p3 (copy), p1 (copy), cryoModule (copy), p6 (ref), p0 (copy), experimentContextModule (copy)
			if p8 == nil then
				error(string.format("connect returns a function that must be passed a component.\n Check the connection at:\n %s", trac), 2)
			end
			local var9 = roactModule.PureComponent:extend(("AppExperiment(%s)"):format(tostring(p8)))
			
			function var9.init(p9)
				-- upvalues: ixpServiceProp (copy), p5 (copy), p2 (copy), p7 (copy), p4 (copy), p3 (copy), p1 (copy)
				p9.onLoadingStatusChangeConnection = nil
				p9.state = {
					layerToVariables = {},
					layerLoadingStatus = Enum.IXPLoadingStatus.None
				}
				
				function p9.updateStateLayerData(p10)
					-- upvalues: p9 (ref), ixpServiceProp (copy), p5 (copy), p2 (copy)
					local var11 = p9.props[ixpServiceProp]
					
					if var11 ~= nil then
						local t = {}
						
						for i, v in ipairs(p5) do
							t[v] = var11[p2](var11, v)
						end
						p9:setState({ layerToVariables = t, layerLoadingStatus = p10 })
					end
				end
				
				function p9.logAllLayersExposure(p11)
					-- upvalues: p9 (ref), ixpServiceProp (copy), p7 (copy), p5 (copy), p4 (copy), p3 (copy)
					local var13 = p9.props[ixpServiceProp]
					
					if var13 ~= nil and p11 == Enum.IXPLoadingStatus.Initialized and p7 then
						for i, v in ipairs(p5) do
							if var13[p4](var13, v) == Enum.IXPLoadingStatus.Initialized then
								var13[p3](var13, v)
							end
						end
					end
				end
				
				local var10 = p9.props[ixpServiceProp]
				
				if var10 ~= nil then
					p9.updateStateLayerData(var10[p1](var10))
				end
			end
			
			function var9.render(p12)
				-- upvalues: cryoModule (copy), ixpServiceProp (copy), p6 (copy), roactModule (copy), p8 (ref)
				local var14 = cryoModule.Dictionary.join(p12.props, { [ixpServiceProp] = cryoModule.None })
				
				return roactModule.createElement(p8, cryoModule.Dictionary.join(var14, p6(p12.state.layerToVariables, var14)))
			end
			
			function var9.didMount(p13)
				-- upvalues: ixpServiceProp (copy), p0 (copy), p1 (copy), p2 (copy)
				local var15 = p13.props[ixpServiceProp]
				
				if var15 ~= nil then
					p13.onLoadingStatusChangeConnection = var15[p0]:Connect(function(_)
						-- upvalues: var15 (ref), p1 (copy), p13 (ref), p2 (copy)
						local var17 = var15[p1](var15)
						
						if p13.state.layerLoadingStatus ~= var17 then
							p13.updateStateLayerData(var17, p2)
							p13.logAllLayersExposure(var17)
						end
					end)
					local var16 = var15[p1](var15)
					
					if p13.state.layerLoadingStatus ~= var16 then
						p13.updateStateLayerData(var16, p2)
					end
					p13.logAllLayersExposure(var16)
				end
			end
			
			function var9.willUnmount(p14)
				if p14.onLoadingStatusChangeConnection ~= nil then
					p14.onLoadingStatusChangeConnection:Disconnect()
				end
			end
			
			return function(p15)
				-- upvalues: roactModule (copy), experimentContextModule (copy), ixpServiceProp (copy), cryoModule (copy), var9 (ref)
				return roactModule.createElement(experimentContextModule.Consumer, {
					render = function(p16)
						-- upvalues: p15 (ref), ixpServiceProp (copy), cryoModule (copy), roactModule (copy), var9 (copy)
						assert(p15[ixpServiceProp] == nil, "Symbol 'IxpServiceProp' should never exist in the incoming props.")
						
						return roactModule.createElement(var9, cryoModule.Dictionary.join(p15, { [ixpServiceProp] = p16 }))
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
	registerUserLayers = function(p17)
		-- upvalues: tModule (ref), IXPService (ref), runService (ref)
		assert(tModule.table(p17))
		
		if IXPService ~= nil then
			if runService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			local t = {}
			
			for i, v in pairs(p17) do
				table.insert(t, v)
			end
			IXPService:RegisterUserLayers(t)
		end
	end,
	initializeUserLayers = function(p18)
		-- upvalues: IXPService (ref)
		if IXPService ~= nil then
			IXPService:InitializeUserLayers(p18)
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