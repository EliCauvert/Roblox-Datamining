local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local sduiBuilderModule = require(sduiCoreSystem.SduiBuilder)
local sduiBuilderTypesModule = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local sduiConditionalPropWrapperModule = require(sduiCoreSystem.ConditionalProps.SduiConditionalPropWrapper)
local sduiConfigTypesModule = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiErrorType = sduiErrorsModule.SduiErrorType
local sduiBuilderProcessingPhase = sduiBuilderTypesModule.SduiBuilderProcessingPhase
local compareSduiPropsModule = require(sduiCoreSystem.compareSduiProps)
local compareSduiAnalyticsContextModule = require(sduiCoreSystem.compareSduiAnalyticsContext)
local sduiCompatModule = require(parent.SduiCompat)
local mapServerBindingProps = sduiCompatModule.mapServerBindingProps
local serverBindingPropMap = sduiCompatModule.ServerBindingPropMap
local parsePropsModule = require(sduiCoreSystem.parseProps)
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)
local uiComponentInterface = sduiConfigTypesModule.UiComponentInterface
local sduiUsageRecorderModule = require(sduiCoreSystem.Analytics.SduiUsageRecorder)
local recordV1ComponentUsageModule = require(sduiCoreSystem.Analytics.recordV1ComponentUsage)
local fFlagSduiUsageTelemetry = require(parent.SharedFlags).FFlagSduiUsageTelemetry
local t = {}
local var1 = nil

local function SduiErrorComponent(_)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local var2 = reactModule.memo(function(p1)
	-- upvalues: sduiBuilderProcessingPhase (ref), reactModule (ref), sduiBuilderModule (ref), compareSduiAnalyticsContextModule (ref), sduiErrorType (ref), SduiErrorComponent (ref), cryoModule (ref), t (ref), mapServerBindingProps (ref), serverBindingPropMap (ref), parsePropsModule (ref), validateInterfaceModule (ref), var1 (write)
	local processed = p1.componentConfig.__processed
	local var3 = if processed then sduiBuilderProcessingPhase.Render else sduiBuilderProcessingPhase.Lazy
	local componentConfig = p1.componentConfig
	local sduiContext = p1.sduiContext
	local debugName = p1.debugName
	local parentAnalyticsContext = p1.parentAnalyticsContext
	local localAnalyticsData = p1.localAnalyticsData
	local extraLocalProps = p1.extraLocalProps
	local conditionalProps = p1.conditionalProps
	local instrumentation = sduiContext.dependencies.instrumentation
	instrumentation:startTimerFlow("BuildPropsAndChildren")
	local var4 = reactModule.useRef(nil)
	
	if var4.current == nil then
		var4.current = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
	else
		local var5 = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
		
		if not compareSduiAnalyticsContextModule(var4.current, var5) then
			var4.current = var5
		end
	end
	local current = var4.current
	local componentType = sduiBuilderModule.getComponentType(componentConfig, sduiContext)
	
	if componentType == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NilComponentType, {
			message = `Unable to resolve componentType for component with template {if componentConfig then componentConfig.templateKey else nil}`,
			name = debugName
		}, sduiContext.appPage)
		instrumentation:stopTimerFlow("BuildPropsAndChildren", sduiContext, true)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	local var6 = sduiContext.componentDefinitions:getComponent(componentType)
	
	if var6 == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = debugName }, sduiContext.appPage)
		instrumentation:stopTimerFlow("BuildPropsAndChildren", sduiContext, true)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	local _ = nil
	instrumentation:startTimerFlow("ParseProps")
	local var7 = cryoModule.Dictionary.join(componentConfig.props or t, conditionalProps or t)
	
	if not processed then
		local var8, var9 = mapServerBindingProps(var7, serverBindingPropMap)
		
		if var8 then
			for i, v in var8 do
				var7[i] = v
			end
		end
		if var9 then
			sduiContext.dependencies.logger.reportError(sduiErrorType.UnmappedServerBindingProp, {
				componentType = componentType,
				name = debugName,
				message = `Unmapped PascalCase props detected: {table.concat(var9, ", ")}. These props will not reach the camelCase component.`
			}, sduiContext.appPage)
		end
	end
	parsePropsModule(componentType, var7, debugName, sduiContext, current, nil, var3)
	
	if extraLocalProps then
		var7 = cryoModule.Dictionary.join(var7, extraLocalProps)
	end
	var7.componentConfig = componentConfig
	var7.sduiContext = sduiContext
	var7.debugName = debugName
	var7.analyticsContext = current
	
	if not processed then
		local var10 = sduiContext.componentDefinitions:getPropInterface(componentType)
		
		if var10 then
			local var11, var12 = validateInterfaceModule(var7, var10)
			
			if not var11 then
				instrumentation:stopTimerFlow("ParseProps", sduiContext, true)
				sduiContext.dependencies.logger.reportError(sduiErrorType.InvalidProps, {
					componentType = componentType,
					name = debugName,
					message = var12
				}, sduiContext.appPage)
				
				return reactModule.createElement(SduiErrorComponent)
			end
		end
	end
	instrumentation:stopTimerFlow("ParseProps", sduiContext)
	local var13 = if componentConfig.children then {} else nil
	
	if componentConfig.children then
		assert(var13, "reactChildren must exist")
		
		for i, v in componentConfig.children do
			local componentType_1 = `{v.componentType}_{i}`
			var13[componentType_1] = reactModule.createElement(var1, {
				componentConfig = v,
				sduiContext = sduiContext,
				parentAnalyticsContext = current,
				extraLocalProps = { index = i, layoutOrder = i },
				debugName = componentType_1
			})
		end
	end
	instrumentation:stopTimerFlow("BuildPropsAndChildren", sduiContext)
	
	return reactModule.createElement(var6, var7, var13)
end, compareSduiPropsModule)

return reactModule.memo(function(p2)
	-- upvalues: sduiErrorType (ref), reactModule (ref), SduiErrorComponent (ref), validateInterfaceModule (ref), uiComponentInterface (ref), sduiErrorsModule (ref), fFlagSduiUsageTelemetry (ref), recordV1ComponentUsageModule (ref), sduiUsageRecorderModule (ref), sduiConditionalPropWrapperModule (ref), var2 (ref)
	if not p2.componentConfig then
		p2.sduiContext.dependencies.logger.reportError(sduiErrorType.NilComponentConfig, { name = p2.debugName }, p2.sduiContext.appPage)
		
		return reactModule.createElement(SduiErrorComponent)
	elseif not p2.componentConfig.__processed then
		if p2.sduiContext.templateRegistry:shouldResolveTemplate(p2.componentConfig) then
			p2.sduiContext.templateRegistry:resolveTemplateForConfig(p2.componentConfig, p2.sduiContext)
		end
		local var14, var15 = validateInterfaceModule(p2.componentConfig, uiComponentInterface, false)
		
		if not var14 then
			p2.sduiContext.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidComponentConfig, {
				message = `Invalid config for component. err: {var15}`,
				componentType = p2.componentConfig.componentType,
				name = p2.debugName
			}, p2.sduiContext.appPage)
		end
	end
	if fFlagSduiUsageTelemetry and not p2.componentConfig.__usageRecorded then
		recordV1ComponentUsageModule(p2.sduiContext.appPage, p2.componentConfig)
		p2.componentConfig.__usageRecorded = true
		sduiUsageRecorderModule.scheduleFlush()
	end
	return if p2.componentConfig.conditionalProps then reactModule.createElement(sduiConditionalPropWrapperModule, {
		wrappedComponent = var2,
		sduiContext = p2.sduiContext,
		parentAnalyticsContext = p2.parentAnalyticsContext,
		extraLocalProps = p2.extraLocalProps,
		componentConfig = p2.componentConfig,
		debugName = p2.debugName,
		localAnalyticsData = p2.localAnalyticsData
	}) else reactModule.createElement(var2, p2)
end, compareSduiPropsModule)