local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SduiBuilderModule = require(SduiCoreSystem.SduiBuilder)
local _ = require(SduiCoreSystem.SduiComponentType)
local SduiConditionalPropWrapperModule = require(SduiCoreSystem.ConditionalProps.SduiConditionalPropWrapper)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiErrorType = SduiErrorsModule.SduiErrorType
local SduiBuilderProcessingPhase = require(SduiCoreSystem.SduiBuilderTypes).SduiBuilderProcessingPhase
local CompareSduiPropsModule = require(SduiCoreSystem.compareSduiProps)
local CompareSduiAnalyticsContextModule = require(SduiCoreSystem.compareSduiAnalyticsContext)
local SduiCompatModule = require(Parent.SduiCompat)
local MapServerBindingPropsFunction = SduiCompatModule.mapServerBindingProps
local ServerBindingPropMap = SduiCompatModule.ServerBindingPropMap
local ParsePropsModule = require(SduiCoreSystem.parseProps)
local ValidateInterfaceModule = require(SduiCoreSystem.validateInterface)
local UiComponentInterface = require(SduiCoreSystem.SduiConfigTypes).UiComponentInterface
local SduiUsageRecorderModule = require(SduiCoreSystem.Analytics.SduiUsageRecorder)
local RecordV1ComponentUsageModule = require(SduiCoreSystem.Analytics.recordV1ComponentUsage)
local t = {}
local v1 = nil

local function SduiErrorComponent(_)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: SduiBuilderProcessingPhase (copy), ReactModule (copy), SduiBuilderModule (copy), CompareSduiAnalyticsContextModule (copy), SduiErrorType (copy), SduiErrorComponent (copy), CryoModule (copy), t (copy), MapServerBindingPropsFunction (copy), ServerBindingPropMap (copy), ParsePropsModule (copy), ValidateInterfaceModule (copy), v1 (ref)
	local Processed = p1.componentConfig.__processed
	local Render = if Processed then SduiBuilderProcessingPhase.Render else SduiBuilderProcessingPhase.Lazy
	local ComponentConfig = p1.componentConfig
	local SduiContext = p1.sduiContext
	local DebugName = p1.debugName
	local ParentAnalyticsContext = p1.parentAnalyticsContext
	local LocalAnalyticsData = p1.localAnalyticsData
	local ExtraLocalProps = p1.extraLocalProps
	local ConditionalProps = p1.conditionalProps
	local Instrumentation = SduiContext.dependencies.instrumentation
	Instrumentation:startTimerFlow("BuildPropsAndChildren")
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = SduiBuilderModule.buildAnalyticsContext(ComponentConfig, ParentAnalyticsContext, LocalAnalyticsData)
	else
		local AnalyticsContext = SduiBuilderModule.buildAnalyticsContext(ComponentConfig, ParentAnalyticsContext, LocalAnalyticsData)
		
		if not CompareSduiAnalyticsContextModule(UseRefResult.current, AnalyticsContext) then
			UseRefResult.current = AnalyticsContext
		end
	end
	local Current = UseRefResult.current
	local ComponentType = SduiBuilderModule.getComponentType(ComponentConfig, SduiContext)
	
	if ComponentType == nil then
		SduiContext.dependencies.logger.reportError(SduiErrorType.NilComponentType, {
			message = `Unable to resolve componentType for component with template {ComponentConfig and ComponentConfig.templateKey or nil}`,
			name = DebugName
		}, SduiContext.appPage)
		Instrumentation:stopTimerFlow("BuildPropsAndChildren", SduiContext, true)
		
		return ReactModule.createElement(SduiErrorComponent)
	end
	local Component = SduiContext.componentDefinitions:getComponent(ComponentType)
	
	if Component == nil then
		SduiContext.dependencies.logger.reportError(SduiErrorType.NoComponentRegistered, { componentType = ComponentType, name = DebugName }, SduiContext.appPage)
		Instrumentation:stopTimerFlow("BuildPropsAndChildren", SduiContext, true)
		
		return ReactModule.createElement(SduiErrorComponent)
	end
	Instrumentation:startTimerFlow("ParseProps")
	local JoinResult = CryoModule.Dictionary.join(ComponentConfig.props or t, ConditionalProps or t)
	
	if not Processed then
		local MapServerBindingPropsResult, MapServerBindingPropsResult2 = MapServerBindingPropsFunction(JoinResult, ServerBindingPropMap)
		
		if MapServerBindingPropsResult then
			for i, value in MapServerBindingPropsResult do
				JoinResult[i] = value
			end
		end
		if MapServerBindingPropsResult2 then
			SduiContext.dependencies.logger.reportError(SduiErrorType.UnmappedServerBindingProp, {
				componentType = ComponentType,
				name = DebugName,
				message = `Unmapped PascalCase props detected: {table.concat(MapServerBindingPropsResult2, ", ")}. These props will not reach the camelCase component.`
			}, SduiContext.appPage)
		end
	end
	ParsePropsModule(ComponentType, JoinResult, DebugName, SduiContext, Current, nil, Render)
	
	if ExtraLocalProps then
		JoinResult = CryoModule.Dictionary.join(JoinResult, ExtraLocalProps)
	end
	JoinResult.componentConfig = ComponentConfig
	JoinResult.sduiContext = SduiContext
	JoinResult.debugName = DebugName
	JoinResult.analyticsContext = Current
	
	if not Processed then
		local PropInterface = SduiContext.componentDefinitions:getPropInterface(ComponentType)
		
		if PropInterface then
			local ValidateInterfaceModuleResult, ValidateInterfaceModuleResult2 = ValidateInterfaceModule(JoinResult, PropInterface)
			
			if not ValidateInterfaceModuleResult then
				Instrumentation:stopTimerFlow("ParseProps", SduiContext, true)
				SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidProps, {
					componentType = ComponentType,
					name = DebugName,
					message = ValidateInterfaceModuleResult2
				}, SduiContext.appPage)
				
				return ReactModule.createElement(SduiErrorComponent)
			end
		end
	end
	Instrumentation:stopTimerFlow("ParseProps", SduiContext)
	local T = if ComponentConfig.children then {} else nil
	
	if ComponentConfig.children then
		assert(T, "reactChildren must exist")
		
		for Index, child in ComponentConfig.children do
			local Text: string = `{child.componentType}_{Index}`
			T[Text] = ReactModule.createElement(v1, {
				componentConfig = child,
				sduiContext = SduiContext,
				parentAnalyticsContext = Current,
				extraLocalProps = { index = Index, layoutOrder = Index },
				debugName = Text
			})
		end
	end
	Instrumentation:stopTimerFlow("BuildPropsAndChildren", SduiContext)
	
	return ReactModule.createElement(Component, JoinResult, T)
end, CompareSduiPropsModule)

v1 = function(p2)
	-- upvalues: SduiErrorType (copy), ReactModule (copy), SduiErrorComponent (copy), ValidateInterfaceModule (copy), UiComponentInterface (copy), SduiErrorsModule (copy), RecordV1ComponentUsageModule (copy), SduiUsageRecorderModule (copy), SduiConditionalPropWrapperModule (copy), MemoResult (copy)
	if not p2.componentConfig then
		p2.sduiContext.dependencies.logger.reportError(SduiErrorType.NilComponentConfig, { name = p2.debugName }, p2.sduiContext.appPage)
		
		return ReactModule.createElement(SduiErrorComponent)
	end
	if not p2.componentConfig.__processed then
		if p2.sduiContext.templateRegistry:shouldResolveTemplate(p2.componentConfig) then
			p2.sduiContext.templateRegistry:resolveTemplateForConfig(p2.componentConfig, p2.sduiContext)
		end
		local ValidateInterfaceModuleResult, ValidateInterfaceModuleResult2 = ValidateInterfaceModule(p2.componentConfig, UiComponentInterface, false)
		
		if not ValidateInterfaceModuleResult then
			p2.sduiContext.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.InvalidComponentConfig, {
				message = `Invalid config for component. err: {ValidateInterfaceModuleResult2}`,
				componentType = p2.componentConfig.componentType,
				name = p2.debugName
			}, p2.sduiContext.appPage)
		end
	end
	if not p2.componentConfig.__usageRecorded then
		RecordV1ComponentUsageModule(p2.sduiContext.appPage, p2.componentConfig)
		p2.componentConfig.__usageRecorded = true
		SduiUsageRecorderModule.scheduleFlush()
	end
	return if p2.componentConfig.conditionalProps then ReactModule.createElement(SduiConditionalPropWrapperModule, {
		wrappedComponent = MemoResult,
		sduiContext = p2.sduiContext,
		parentAnalyticsContext = p2.parentAnalyticsContext,
		extraLocalProps = p2.extraLocalProps,
		componentConfig = p2.componentConfig,
		debugName = p2.debugName,
		localAnalyticsData = p2.localAnalyticsData
	}) else ReactModule.createElement(MemoResult, p2)
end

return ReactModule.memo(v1, CompareSduiPropsModule)