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
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local sduiDataBindingShallowEquals = game:DefineFastFlag("SduiDataBindingShallowEquals", false)

local function SduiErrorComponent(_)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local t = {}

local function buildWrappedComponent(p1, p2, p3)
	-- upvalues: fFlagSduiNestedComponentListProp (ref), t (ref), reactModule (ref), getSduiComponentRegistryModule (ref), sduiErrorType (ref), SduiErrorComponent (ref), validateInterfaceModule (ref)
	local componentType = p2.componentConfig.componentType
	local sduiContext = p2.sduiContext
	
	if p2.localAnalyticsData then
		p2.componentConfig.analyticsContext.setLocalAnalyticsData(p2.localAnalyticsData)
	end
	local var1 = if p2.componentConfig.props then table.clone(p2.componentConfig.props) else {}
	local var2 = if fFlagSduiNestedComponentListProp and p2.componentConfig.nestedComponentConfigListPropSignalNames then p2.componentConfig.nestedComponentConfigListPropSignalNames else t
	
	if p3 then
		for i, v in p3 do
			if not v.isNestedComponentConfig and (not fFlagSduiNestedComponentListProp or not var2[i]) then
				var1[i] = v.data
			end
		end
	end
	if p2.extraLocalProps then
		for i, v in p2.extraLocalProps do
			var1[i] = v
		end
	end
	var1.componentConfig = p2.componentConfig
	var1.sduiContext = p2.sduiContext
	var1.debugName = p2.debugName
	var1.analyticsContext = p2.componentConfig.analyticsContext
	local var3 = nil
	
	if p3 then
		for i, v in p3 do
			if v.isNestedComponentConfig then
				if var3 == nil then
					var3 = if p2.componentConfig.nestedComponentConfigs then table.clone(p2.componentConfig.nestedComponentConfigs) else {}
				end
				var3[i] = v.data
			end
		end
	end
	local var4 = var3 or p2.componentConfig.nestedComponentConfigs
	
	if var4 then
		for i, v in var4 do
			var1[i] = reactModule.createElement(p1(v), {
				sduiContext = p2.sduiContext,
				componentConfig = v,
				debugName = `{p2.debugName}.{i}`
			})
		end
	end
	if fFlagSduiNestedComponentListProp and p3 and next(var2) then
		for i in var2 do
			local var5 = p3[i]
			
			if var5 then
				local data = var5.data
				
				if data then
					local t_1 = {}
					
					for i_1, v in data do
						t_1[`{i}_{i_1}_{v.componentType}`] = reactModule.createElement(p1(v), {
							sduiContext = p2.sduiContext,
							componentConfig = v,
							extraLocalProps = { layoutOrder = i_1 },
							debugName = `{p2.debugName}.{i}[{i_1}]`
						})
					end
					var1[i] = t_1
				end
			end
		end
	end
	local componentDefinition = getSduiComponentRegistryModule().getComponentDefinition(componentType)
	local var6 = if componentDefinition then componentDefinition.component else nil
	
	if var6 == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = p2.debugName }, sduiContext.appPage)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	local propInterface = componentDefinition and componentDefinition.propInterface
	
	return if propInterface and not validateInterfaceModule(var1, propInterface) then nil else reactModule.createElement(var6, var1)
end

return function(p4)
	-- upvalues: reactModule (ref), buildWrappedComponent (ref), compareSduiPropsModule (ref), fFlagSduiPoolBackedFeed (ref), signalsModule (ref), sduiDataBindingShallowEquals (ref), tutilsModule (ref), signalsReactModule (ref)
	return {
		SduiClientBindingThinWrapper = reactModule.memo(function(p5)
			-- upvalues: buildWrappedComponent (copy), p4 (ref)
			return buildWrappedComponent(p4, p5)
		end, compareSduiPropsModule),
		SduiDataBindingWrapper = reactModule.memo(function(p5)
			-- upvalues: fFlagSduiPoolBackedFeed (copy), reactModule (copy), signalsModule (copy), sduiDataBindingShallowEquals (copy), tutilsModule (copy), signalsReactModule (copy), buildWrappedComponent (copy), p4 (ref)
			local propSignals = p5.componentConfig.propSignals
			local isComponentFilteredSignal = p5.componentConfig.isComponentFilteredSignal
			local var7 = if fFlagSduiPoolBackedFeed then p5.extraLocalPropSignals else nil
			local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: propSignals (ref), isComponentFilteredSignal (ref), var7 (ref), signalsModule (copy), fFlagSduiPoolBackedFeed (copy), sduiDataBindingShallowEquals (copy), tutilsModule (copy)
				assert(propSignals or (isComponentFilteredSignal or var7), "propSignals, isComponentFilteredSignal, or extraLocalPropSignals must exist")
				
				return signalsModule.createComputed(function(p6)
					-- upvalues: propSignals (copy), fFlagSduiPoolBackedFeed (copy), var7 (copy), isComponentFilteredSignal (copy)
					local t = {}
					
					if propSignals then
						for i, v in propSignals do
							t[i] = v(p6)
						end
					end
					if fFlagSduiPoolBackedFeed and var7 then
						for i, v in var7 do
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
				if fFlagSduiPoolBackedFeed then var7 else nil,
				p5.componentConfig.componentType
			}))
			
			return if var8.__isComponentFiltered == true then nil else buildWrappedComponent(p4, p5, var8)
		end, compareSduiPropsModule)
	}
end