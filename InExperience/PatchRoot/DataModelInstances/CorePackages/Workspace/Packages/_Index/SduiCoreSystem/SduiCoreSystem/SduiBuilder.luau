local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local tutilsModule = require(parent.tutils)
local sduiBuilderProcessingPhase = require(sduiCoreSystem.SduiBuilderTypes).SduiBuilderProcessingPhase
local _ = require(sduiCoreSystem.SduiComponentType)
local sduiConfigTypesModule = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorType = require(sduiCoreSystem.SduiErrors).SduiErrorType
local parsePropsModule = require(sduiCoreSystem.parseProps)
local validateInterfaceModule = require(sduiCoreSystem.validateInterface)
local uiComponentInterface = sduiConfigTypesModule.UiComponentInterface
local sduiCompatModule = require(parent.SduiCompat)
local mapServerBindingProps = sduiCompatModule.mapServerBindingProps
local serverBindingPropMap = sduiCompatModule.ServerBindingPropMap
local sduiUsageRecorderModule = require(sduiCoreSystem.Analytics.SduiUsageRecorder)
local recordV1ComponentUsageModule = require(sduiCoreSystem.Analytics.recordV1ComponentUsage)
local fFlagSduiUsageTelemetry = require(parent.SharedFlags).FFlagSduiUsageTelemetry
local t = {}

return {
	getComponentType = function(p0, p1)
		if not p0.__isClientBinding and p1.templateRegistry:shouldResolveTemplate(p0) then
			p1.templateRegistry:resolveTemplateForConfig(p0, p1)
		end
		return p0.componentType
	end,
	buildAnalyticsContext = function(p2, p3, p4)
		-- upvalues: t (ref), cryoModule (ref)
		p3 = p3 or t
		local var11 = p2.analyticsData or t
		local var12 = cryoModule.Dictionary.join(p3.ancestorAnalyticsData or t, p3.analyticsData or t)
		local getCollectionData = p3.getCollectionData
		
		if p4 then
			var11 = cryoModule.Dictionary.join(var11, p4)
		end
		return {
			analyticsData = var11,
			ancestorAnalyticsData = var12,
			getCollectionData = getCollectionData
		}
	end,
	tryCreateEagerProcessedComponentConfig = function(p5, p6, p7, p8, p9)
		-- upvalues: sduiErrorType (ref), tutilsModule (ref), validateInterfaceModule (ref), uiComponentInterface (ref), mapServerBindingProps (ref), serverBindingPropMap (ref), fFlagSduiUsageTelemetry (ref), recordV1ComponentUsageModule (ref), sduiUsageRecorderModule (ref), parsePropsModule (ref), sduiBuilderProcessingPhase (ref)
		local instrumentation = p6.dependencies.instrumentation
		instrumentation:startTimerFlow("EagerProcess")
		
		if not p5 then
			p6.dependencies.logger.reportError(sduiErrorType.NilComponentConfig, { name = p7 }, p6.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p6, true)
			
			return false, p5
		end
		assert(p5, "componentConfig must exist")
		
		if p5.__processed then
			p6.dependencies.logger.reportError(sduiErrorType.EagerReprocessing, {
				message = "Eagerly evaluating a component that has already been processed",
				componentType = p5.componentType,
				name = p7
			}, p6.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p6, true)
			
			return true, p5
		end
		local var13 = if p9 then tutilsModule.deepCopy(p5) else p5
		
		if p6.templateRegistry:shouldResolveTemplate(var13) then
			local props = var13.props
			
			if props and props.itemTemplateKey then
				if props.items then
					for i, v in props.items do
						if v.templateKey == nil then
							v.templateKey = props.itemTemplateKey
						end
					end
				elseif props.item and props.item.templateKey == nil then
					props.item.templateKey = props.itemTemplateKey
				end
			end
			if not p6.templateRegistry:resolveTemplateForConfig(var13, p6) then
				instrumentation:stopTimerFlow("EagerProcess", p6, true)
				
				return false, p5
			end
		end
		local componentType = var13.componentType
		
		if p6.componentDefinitions:getComponent(componentType) == nil then
			p6.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = p7 }, p6.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p6, true)
			
			return false, p5
		end
		local var14, var15 = validateInterfaceModule(var13, uiComponentInterface, false)
		
		if not var14 then
			p6.dependencies.logger.reportError(sduiErrorType.InvalidComponentConfig, {
				message = `(Eager) Invalid config for component. err: {var15}`,
				componentType = componentType,
				name = p7,
				value = var13
			}, p6.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p6, true)
			
			return false, p5
		elseif var13.props then
			local var16, var17 = mapServerBindingProps(var13.props, serverBindingPropMap)
			
			if var16 then
				for i, v in var16 do
					var13.props[i] = v
				end
			end
			if var17 then
				p6.dependencies.logger.reportError(sduiErrorType.UnmappedServerBindingProp, {
					componentType = componentType,
					name = p7,
					message = `Unmapped PascalCase props detected: {table.concat(var17, ", ")}. These props will not reach the camelCase component.`
				}, p6.appPage)
			end
		end
		if fFlagSduiUsageTelemetry and not var13.__usageRecorded then
			recordV1ComponentUsageModule(p6.appPage, var13)
			var13.__usageRecorded = true
			sduiUsageRecorderModule.scheduleFlush()
		end
		if var13.props then
			parsePropsModule(componentType, var13.props, p7, p6, p8, nil, sduiBuilderProcessingPhase.Eager)
		end
		if var13.conditionalProps then
			for i, v in var13.conditionalProps do
				local var18, var19 = mapServerBindingProps(v.propOverrides, serverBindingPropMap)
				
				if var18 then
					for i_1, v_1 in var18 do
						v.propOverrides[i_1] = v_1
					end
				end
				if var19 then
					p6.dependencies.logger.reportError(sduiErrorType.UnmappedServerBindingProp, {
						componentType = componentType,
						name = p7,
						message = `Unmapped PascalCase conditional props detected: {table.concat(var19, ", ")}. These props will not reach the camelCase component.`
					}, p6.appPage)
				end
				parsePropsModule(componentType, v.propOverrides, p7, p6, p8, nil, sduiBuilderProcessingPhase.Eager)
			end
		end
		local var20 = p6.componentDefinitions:getPropInterface(componentType)
		
		if var20 then
			local _ = nil
			local var21, var22 = validateInterfaceModule(var13.props, var20)
			local var23 = var22
			
			if var21 then
				var13.__processed = true
				instrumentation:stopTimerFlow("EagerProcess", p6)
				
				return true, var13
			else
				p6.dependencies.logger.reportError(sduiErrorType.InvalidProps, {
					componentType = componentType,
					name = p7,
					message = var23
				}, p6.appPage)
				instrumentation:stopTimerFlow("EagerProcess", p6, true)
				
				return false, p5
			end
		end
	end
}