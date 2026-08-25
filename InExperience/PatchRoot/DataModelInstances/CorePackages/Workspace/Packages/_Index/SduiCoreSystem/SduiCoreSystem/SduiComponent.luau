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
local var16 = nil

local function SduiErrorComponent(_)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local var18 = reactModule.memo(function(p0)
	-- upvalues: sduiBuilderProcessingPhase (ref), reactModule (ref), sduiBuilderModule (ref), compareSduiAnalyticsContextModule (ref), sduiErrorType (ref), SduiErrorComponent (ref), cryoModule (ref), t (ref), mapServerBindingProps (ref), serverBindingPropMap (ref), parsePropsModule (ref), validateInterfaceModule (ref), var16 (write)
	local processed = p0.componentConfig.__processed
	local var19 = if processed then sduiBuilderProcessingPhase.Render else sduiBuilderProcessingPhase.Lazy
	local componentConfig = p0.componentConfig
	local sduiContext = p0.sduiContext
	local debugName = p0.debugName
	local parentAnalyticsContext = p0.parentAnalyticsContext
	local localAnalyticsData = p0.localAnalyticsData
	local extraLocalProps = p0.extraLocalProps
	local conditionalProps = p0.conditionalProps
	local instrumentation = sduiContext.dependencies.instrumentation
	instrumentation:startTimerFlow("BuildPropsAndChildren")
	local var20 = reactModule.useRef(nil)
	
	if var20.current == nil then
		var20.current = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
	else
		local var21 = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
		
		if not compareSduiAnalyticsContextModule(var20.current, var21) then
			var20.current = var21
		end
	end
	local current = var20.current
	local componentType = sduiBuilderModule.getComponentType(componentConfig, sduiContext)
	
	if componentType == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NilComponentType, {
			message = `Unable to resolve componentType for component with template {if componentConfig then componentConfig.templateKey else nil}`,
			name = debugName
		}, sduiContext.appPage)
		instrumentation:stopTimerFlow("BuildPropsAndChildren", sduiContext, true)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	local var23 = sduiContext.componentDefinitions:getComponent(componentType)
	
	if var23 == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = debugName }, sduiContext.appPage)
		instrumentation:stopTimerFlow("BuildPropsAndChildren", sduiContext, true)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	local _ = nil
	instrumentation:startTimerFlow("ParseProps")
	local var24 = cryoModule.Dictionary.join(componentConfig.props or t, conditionalProps or t)
	
	if not processed then
		local var25, var26 = mapServerBindingProps(var24, serverBindingPropMap)
		
		if var25 then
			for i, v in var25 do
				var24[i] = v
			end
		end
		if var26 then
			sduiContext.dependencies.logger.reportError(sduiErrorType.UnmappedServerBindingProp, {
				componentType = componentType,
				name = debugName,
				message = `Unmapped PascalCase props detected: {table.concat(var26, ", ")}. These props will not reach the camelCase component.`
			}, sduiContext.appPage)
		end
	end
	parsePropsModule(componentType, var24, debugName, sduiContext, current, nil, var19)
	
	if extraLocalProps then
		var24 = cryoModule.Dictionary.join(var24, extraLocalProps)
	end
	var24.componentConfig = componentConfig
	var24.sduiContext = sduiContext
	var24.debugName = debugName
	var24.analyticsContext = current
	
	if not processed then
		local var27 = sduiContext.componentDefinitions:getPropInterface(componentType)
		
		if var27 then
			local var28, var29 = validateInterfaceModule(var24, var27)
			
			if not var28 then
				instrumentation:stopTimerFlow("ParseProps", sduiContext, true)
				sduiContext.dependencies.logger.reportError(sduiErrorType.InvalidProps, {
					componentType = componentType,
					name = debugName,
					message = var29
				}, sduiContext.appPage)
				
				return reactModule.createElement(SduiErrorComponent)
			end
		end
	end
	instrumentation:stopTimerFlow("ParseProps", sduiContext)
	local var30 = if componentConfig.children then {} else nil
	
	if componentConfig.children then
		assert(var30, "reactChildren must exist")
		
		for i, v in componentConfig.children do
			local componentType_1 = `{v.componentType}_{i}`
			var30[componentType_1] = reactModule.createElement(var16, {
				componentConfig = v,
				sduiContext = sduiContext,
				parentAnalyticsContext = current,
				extraLocalProps = { index = i, layoutOrder = i },
				debugName = componentType_1
			})
		end
	end
	instrumentation:stopTimerFlow("BuildPropsAndChildren", sduiContext)
	
	return reactModule.createElement(var23, var24, var30)
end, compareSduiPropsModule)

return reactModule.memo(function(p1)
	-- upvalues: sduiErrorType (ref), reactModule (ref), SduiErrorComponent (ref), validateInterfaceModule (ref), uiComponentInterface (ref), sduiErrorsModule (ref), fFlagSduiUsageTelemetry (ref), recordV1ComponentUsageModule (ref), sduiUsageRecorderModule (ref), sduiConditionalPropWrapperModule (ref), var18 (ref)
	if not p1.componentConfig then
		p1.sduiContext.dependencies.logger.reportError(sduiErrorType.NilComponentConfig, { name = p1.debugName }, p1.sduiContext.appPage)
		
		return reactModule.createElement(SduiErrorComponent)
	elseif not p1.componentConfig.__processed then
		if p1.sduiContext.templateRegistry:shouldResolveTemplate(p1.componentConfig) then
			p1.sduiContext.templateRegistry:resolveTemplateForConfig(p1.componentConfig, p1.sduiContext)
		end
		local var32, var33 = validateInterfaceModule(p1.componentConfig, uiComponentInterface, false)
		
		if not var32 then
			p1.sduiContext.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.InvalidComponentConfig, {
				message = `Invalid config for component. err: {var33}`,
				componentType = p1.componentConfig.componentType,
				name = p1.debugName
			}, p1.sduiContext.appPage)
		end
	end
	if fFlagSduiUsageTelemetry and not p1.componentConfig.__usageRecorded then
		recordV1ComponentUsageModule(p1.sduiContext.appPage, p1.componentConfig)
		p1.componentConfig.__usageRecorded = true
		sduiUsageRecorderModule.scheduleFlush()
	end
	return if p1.componentConfig.conditionalProps then reactModule.createElement(sduiConditionalPropWrapperModule, {
		wrappedComponent = var18,
		sduiContext = p1.sduiContext,
		parentAnalyticsContext = p1.parentAnalyticsContext,
		extraLocalProps = p1.extraLocalProps,
		componentConfig = p1.componentConfig,
		debugName = p1.debugName,
		localAnalyticsData = p1.localAnalyticsData
	}) else reactModule.createElement(var18, p1)
end, compareSduiPropsModule)