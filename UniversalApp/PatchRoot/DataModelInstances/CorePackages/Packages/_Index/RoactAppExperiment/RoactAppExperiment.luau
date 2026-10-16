local RunService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
local RoactModule = require(script.Parent.Roact)
local TModule = require(script.Parent.t)
local CryoModule = require(script.Parent.Cryo)
local ExperimentContextModule = require(script.ExperimentContext)
local IxpServiceProp = require(script.Symbol).named("IxpServiceProp")

local function connect(p1, p2, p3, p4, p5) --[[ Line: 79 ]]
	-- upvalues: TModule (copy), RoactModule (copy), IxpServiceProp (copy), CryoModule (copy), ExperimentContextModule (copy)
	assert(TModule.string(p1))
	assert(TModule.string(p2))
	assert(TModule.string(p3))
	assert(TModule.string(p4))
	assert(TModule.string(p5))
	
	return function(p6, Callback, p7: boolean) --[[ Line: 95 ]]
		-- upvalues: RoactModule (upval), IxpServiceProp (upval), p3 (copy), p5 (copy), p4 (copy), p2 (copy), CryoModule (upval), p1 (copy), ExperimentContextModule (upval)
		if p7 == nil then
			p7 = true
		end
		local Traceback = debug.traceback()
		assert(type(p6) == "table", "connect expects layerNames to be a list of layers")
		assert(type(Callback) == "function", "connect expects mapLayersToProps to be a function")
		
		return function(p8) --[[ Line: 104 ]]
			-- upvalues: Traceback (copy), RoactModule (upval), IxpServiceProp (upval), p6 (copy), p3 (upval), p7 (ref), p5 (upval), p4 (upval), p2 (upval), CryoModule (upval), Callback (copy), p1 (upval), ExperimentContextModule (upval)
			if p8 == nil then
				error(string.format("connect returns a function that must be passed a component.\n Check the connection at:\n %s", Traceback), 2)
			end
			local ExtendResult = RoactModule.PureComponent:extend((("AppExperiment(%s)"):format((tostring(p8)))))
			
			function ExtendResult.init(p9) --[[ Line: 117 ]]
				-- upvalues: IxpServiceProp (upval), p6 (upval), p3 (upval), p7 (upval), p5 (upval), p4 (upval), p2 (upval)
				p9.onLoadingStatusChangeConnection = nil
				p9.state = {
					layerToVariables = {},
					layerLoadingStatus = Enum.IXPLoadingStatus.None
				}
				
				function p9.updateStateLayerData(LayerLoadingStatus) --[[ Line: 124 ]]
					-- upvalues: p9 (copy), IxpServiceProp (upval), p6 (upval), p3 (upval)
					local Prop = p9.props[IxpServiceProp]
					
					if Prop ~= nil then
						local LayerToVariables = {}
						
						for _, value in ipairs(p6) do
							LayerToVariables[value] = Prop[p3](Prop, value)
						end
						p9:setState({
							layerToVariables = LayerToVariables,
							layerLoadingStatus = LayerLoadingStatus
						})
					end
				end
				
				function p9.logAllLayersExposure(LayerLoadingStatus) --[[ Line: 140 ]]
					-- upvalues: p9 (copy), IxpServiceProp (upval), p7 (upval), p6 (upval), p5 (upval), p4 (upval)
					local Prop = p9.props[IxpServiceProp]
					
					if Prop ~= nil and LayerLoadingStatus == Enum.IXPLoadingStatus.Initialized and p7 then
						for _, value in ipairs(p6) do
							if Prop[p5](Prop, value) == Enum.IXPLoadingStatus.Initialized then
								Prop[p4](Prop, value)
							end
						end
					end
				end
				
				local Prop = p9.props[IxpServiceProp]
				
				if Prop ~= nil then
					p9.updateStateLayerData((Prop[p2](Prop)))
				end
			end
			
			function ExtendResult.render(p10) --[[ Line: 163 ]]
				-- upvalues: CryoModule (upval), IxpServiceProp (upval), Callback (upval), RoactModule (upval), p8 (copy)
				local JoinResult = CryoModule.Dictionary.join(p10.props, { [IxpServiceProp] = CryoModule.None })
				
				return RoactModule.createElement(p8, (CryoModule.Dictionary.join(JoinResult, (Callback(p10.state.layerToVariables, JoinResult)))))
			end
			
			function ExtendResult.didMount(p10) --[[ Line: 172 ]]
				-- upvalues: IxpServiceProp (upval), p1 (upval), p2 (upval), p3 (upval)
				local Prop = p10.props[IxpServiceProp]
				
				if Prop ~= nil then
					p10.onLoadingStatusChangeConnection = Prop[p1]:Connect(function(_) --[[ Line: 177 ]]
						-- upvalues: Prop (copy), p2 (upval), p10 (copy), p3 (upval)
						local LayerLoadingStatus = Prop[p2](Prop)
						
						if p10.state.layerLoadingStatus ~= LayerLoadingStatus then
							p10.updateStateLayerData(LayerLoadingStatus, p3)
							p10.logAllLayersExposure(LayerLoadingStatus)
						end
					end)
					local LayerLoadingStatus = Prop[p2](Prop)
					
					if p10.state.layerLoadingStatus ~= LayerLoadingStatus then
						p10.updateStateLayerData(LayerLoadingStatus, p3)
					end
					p10.logAllLayersExposure(LayerLoadingStatus)
				end
			end
			
			function ExtendResult.willUnmount(p10) --[[ Line: 200 ]]
				if p10.onLoadingStatusChangeConnection ~= nil then
					p10.onLoadingStatusChangeConnection:Disconnect()
				end
			end
			
			return function(p10) --[[ Line: 206 ]]
				-- upvalues: RoactModule (upval), ExperimentContextModule (upval), IxpServiceProp (upval), CryoModule (upval), ExtendResult (copy)
				return RoactModule.createElement(ExperimentContextModule.Consumer, {
					render = function(p11) --[[ Line: 208 ]]
						-- upvalues: p10 (copy), IxpServiceProp (upval), CryoModule (upval), RoactModule (upval), ExtendResult (upval)
						assert(p10[IxpServiceProp] == nil, "Symbol 'IxpServiceProp' should never exist in the incoming props.")
						
						return RoactModule.createElement(ExtendResult, (CryoModule.Dictionary.join(p10, { [IxpServiceProp] = p11 })))
					end
				})
			end
		end
	end
end

return {
	Provider = ExperimentContextModule.Provider,
	Consumer = ExperimentContextModule.Consumer,
	Context = ExperimentContextModule,
	registerUserLayers = function(List) --[[ Line: 31 ]]
		-- upvalues: TModule (copy), IXPService (copy), RunService (copy)
		assert(TModule.table(List))
		
		if IXPService ~= nil then
			if RunService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			local List1 = {}
			
			for _, value in pairs(List) do
				table.insert(List1, value)
			end
			IXPService:RegisterUserLayers(List1)
		end
	end,
	initializeUserLayers = function(UserId) --[[ Line: 54 ]]
		-- upvalues: IXPService (copy)
		if IXPService ~= nil then
			IXPService:InitializeUserLayers(UserId)
		end
	end,
	clearUserLayers = function() --[[ Line: 66 ]]
		-- upvalues: IXPService (copy)
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