local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local tutilsModule = require(parent.tutils)
local compareSduiPropsModule = require(sduiCoreSystem.compareSduiProps)
local sduiErrorType = require(sduiCoreSystem.SduiErrors).SduiErrorType
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local getSduiComponentRegistryModule = require(sduiCoreSystem.getSduiComponentRegistry)
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)
local fFlagSduiNestedComponentListProp = require(parent.SharedFlags).FFlagSduiNestedComponentListProp
local fFlagSduiComponentList = require(parent.SharedFlags).FFlagSduiComponentList
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local sduiDataBindingShallowEquals = game:DefineFastFlag("SduiDataBindingShallowEquals", false)

local function SduiErrorComponent(_) --[[ line: 26 ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local t = {}

local function buildWrappedComponent(p0, p1, p2) --[[ line: 43 ]]
	-- upvalues: fFlagSduiNestedComponentListProp (ref), t (ref), reactModule (ref), fFlagSduiComponentList (ref), getSduiComponentRegistryModule (ref), sduiErrorType (ref), SduiErrorComponent (ref), validateInterfaceModule (ref)
	local componentType = p1.componentConfig.componentType
	local sduiContext = p1.sduiContext
	
	if p1.localAnalyticsData then
		p1.componentConfig.analyticsContext.setLocalAnalyticsData(p1.localAnalyticsData)
	end
	local var12 = if p1.componentConfig.props then table.clone(p1.componentConfig.props) else {}
	local var13 = if fFlagSduiNestedComponentListProp and p1.componentConfig.nestedComponentConfigListPropSignalNames then p1.componentConfig.nestedComponentConfigListPropSignalNames else t
	
	if p2 then
		for i, v in p2 do
			if not v.isNestedComponentConfig and (not fFlagSduiNestedComponentListProp or not var13[i]) then
				var12[i] = v.data
			end
		end
	end
	if p1.extraLocalProps then
		for i, v in p1.extraLocalProps do
			var12[i] = v
		end
	end
	var12.componentConfig = p1.componentConfig
	var12.sduiContext = p1.sduiContext
	var12.debugName = p1.debugName
	var12.analyticsContext = p1.componentConfig.analyticsContext
	local var14 = nil
	
	if p2 then
		for i, v in p2 do
			if v.isNestedComponentConfig then
				if var14 == nil then
					var14 = if p1.componentConfig.nestedComponentConfigs then table.clone(p1.componentConfig.nestedComponentConfigs) else {}
				end
				var14[i] = v.data
			end
		end
	end
	local var14_1 = var14 or p1.componentConfig.nestedComponentConfigs
	
	if var14_1 then
		for i, v in var14_1 do
			var12[i] = reactModule.createElement(p0(v), {
				sduiContext = p1.sduiContext,
				componentConfig = v,
				debugName = `{p1.debugName}.{i}`
			})
		end
	end
	if fFlagSduiNestedComponentListProp and p2 and next(var13) then
		for i in var13 do
			local var16 = p2[i]
			
			if var16 then
				local data = var16.data
				
				if data then
					local t_1 = {}
					
					for i_1, v in data do
						t_1[if fFlagSduiComponentList then `{i}_{i_1}_{v.componentType}` else `{i}_{i_1}`] = reactModule.createElement(p0(v), {
							sduiContext = p1.sduiContext,
							componentConfig = v,
							extraLocalProps = { layoutOrder = i_1 },
							debugName = `{p1.debugName}.{i}[{i_1}]`
						})
					end
					var12[i] = t_1
				end
			end
		end
	end
	local componentDefinition = getSduiComponentRegistryModule().getComponentDefinition(componentType)
	local var19 = if componentDefinition then componentDefinition.component else nil
	
	if var19 == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = p1.debugName }, sduiContext.appPage)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	local propInterface = componentDefinition and componentDefinition.propInterface
	
	return if propInterface and not validateInterfaceModule(var12, propInterface) then nil else reactModule.createElement(var19, var12)
end

return function(p3) --[[ line: 174 | named "createSduiClientBindingWrappers" ]]
	-- upvalues: reactModule (ref), buildWrappedComponent (ref), compareSduiPropsModule (ref), fFlagSduiPoolBackedFeed (ref), signalsModule (ref), sduiDataBindingShallowEquals (ref), tutilsModule (ref), fFlagSduiComponentList (ref), signalsReactModule (ref)
	return {
		SduiClientBindingThinWrapper = reactModule.memo(function(p4) --[[ line: 180 ]]
			-- upvalues: buildWrappedComponent (copy), p3 (ref)
			return buildWrappedComponent(p3, p4)
		end, compareSduiPropsModule),
		SduiDataBindingWrapper = reactModule.memo(function(p5) --[[ line: 186 ]]
			-- upvalues: fFlagSduiPoolBackedFeed (copy), reactModule (copy), signalsModule (copy), sduiDataBindingShallowEquals (copy), tutilsModule (copy), fFlagSduiComponentList (copy), signalsReactModule (copy), buildWrappedComponent (copy), p3 (ref)
			local propSignals = p5.componentConfig.propSignals
			local isComponentFilteredSignal = p5.componentConfig.isComponentFilteredSignal
			local var21 = if fFlagSduiPoolBackedFeed then p5.extraLocalPropSignals else nil
			local var22 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 194 ]]
				-- upvalues: propSignals (ref), isComponentFilteredSignal (ref), var21 (ref), signalsModule (copy), fFlagSduiPoolBackedFeed (copy), sduiDataBindingShallowEquals (copy), tutilsModule (copy)
				assert(propSignals or (isComponentFilteredSignal or var21), "propSignals, isComponentFilteredSignal, or extraLocalPropSignals must exist")
				
				return signalsModule.createComputed(function(p6) --[[ line: 199 ]]
					-- upvalues: propSignals (copy), fFlagSduiPoolBackedFeed (copy), var21 (copy), isComponentFilteredSignal (copy)
					local t = {}
					
					if propSignals then
						for i, v in propSignals do
							t[i] = v(p6)
						end
					end
					if fFlagSduiPoolBackedFeed and var21 then
						for i, v in var21 do
							t[i] = { data = v(p6) }
						end
					end
					if isComponentFilteredSignal and isComponentFilteredSignal(p6).data == true then
						t.__isComponentFiltered = true
					end
					return t
				end, if sduiDataBindingShallowEquals then tutilsModule.shallowEqual else nil)
			end, {
				propSignals,
				isComponentFilteredSignal,
				if fFlagSduiPoolBackedFeed then var21 else nil,
				if fFlagSduiComponentList then p5.componentConfig.componentType else nil
			}))
			
			return if var22.__isComponentFiltered == true then nil else buildWrappedComponent(p3, p5, var22)
		end, compareSduiPropsModule)
	}
end