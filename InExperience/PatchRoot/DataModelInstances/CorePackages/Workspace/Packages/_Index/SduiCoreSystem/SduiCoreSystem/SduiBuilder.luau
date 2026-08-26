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
	getComponentType = function(p1, p2)
		if not p1.__isClientBinding and p2.templateRegistry:shouldResolveTemplate(p1) then
			p2.templateRegistry:resolveTemplateForConfig(p1, p2)
		end
		return p1.componentType
	end,
	buildAnalyticsContext = function(p1, p2, p3)
		-- upvalues: t (ref), cryoModule (ref)
		p2 = p2 or t
		local var1 = p1.analyticsData or t
		local var2 = cryoModule.Dictionary.join(p2.ancestorAnalyticsData or t, p2.analyticsData or t)
		local getCollectionData = p2.getCollectionData
		
		if p3 then
			var1 = cryoModule.Dictionary.join(var1, p3)
		end
		return {
			analyticsData = var1,
			ancestorAnalyticsData = var2,
			getCollectionData = getCollectionData
		}
	end,
	tryCreateEagerProcessedComponentConfig = function(p1, p2, p3, p4, p5)
		-- upvalues: sduiErrorType (ref), tutilsModule (ref), validateInterfaceModule (ref), uiComponentInterface (ref), mapServerBindingProps (ref), serverBindingPropMap (ref), fFlagSduiUsageTelemetry (ref), recordV1ComponentUsageModule (ref), sduiUsageRecorderModule (ref), parsePropsModule (ref), sduiBuilderProcessingPhase (ref)
		local instrumentation = p2.dependencies.instrumentation
		instrumentation:startTimerFlow("EagerProcess")
		
		if not p1 then
			p2.dependencies.logger.reportError(sduiErrorType.NilComponentConfig, { name = p3 }, p2.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return false, p1
		end
		assert(p1, "componentConfig must exist")
		
		if p1.__processed then
			p2.dependencies.logger.reportError(sduiErrorType.EagerReprocessing, {
				message = "Eagerly evaluating a component that has already been processed",
				componentType = p1.componentType,
				name = p3
			}, p2.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return true, p1
		end
		local var1 = if p5 then tutilsModule.deepCopy(p1) else p1
		
		if p2.templateRegistry:shouldResolveTemplate(var1) then
			local props = var1.props
			
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
			if not p2.templateRegistry:resolveTemplateForConfig(var1, p2) then
				instrumentation:stopTimerFlow("EagerProcess", p2, true)
				
				return false, p1
			end
		end
		local componentType = var1.componentType
		
		if p2.componentDefinitions:getComponent(componentType) == nil then
			p2.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = p3 }, p2.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return false, p1
		end
		local var2, var3 = validateInterfaceModule(var1, uiComponentInterface, false)
		
		if not var2 then
			p2.dependencies.logger.reportError(sduiErrorType.InvalidComponentConfig, {
				message = `(Eager) Invalid config for component. err: {var3}`,
				componentType = componentType,
				name = p3,
				value = var1
			}, p2.appPage)
			instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return false, p1
		elseif var1.props then
			local var4, var5 = mapServerBindingProps(var1.props, serverBindingPropMap)
			
			if var4 then
				for i, v in var4 do
					var1.props[i] = v
				end
			end
			if var5 then
				p2.dependencies.logger.reportError(sduiErrorType.UnmappedServerBindingProp, {
					componentType = componentType,
					name = p3,
					message = `Unmapped PascalCase props detected: {table.concat(var5, ", ")}. These props will not reach the camelCase component.`
				}, p2.appPage)
			end
		end
		if fFlagSduiUsageTelemetry and not var1.__usageRecorded then
			recordV1ComponentUsageModule(p2.appPage, var1)
			var1.__usageRecorded = true
			sduiUsageRecorderModule.scheduleFlush()
		end
		if var1.props then
			parsePropsModule(componentType, var1.props, p3, p2, p4, nil, sduiBuilderProcessingPhase.Eager)
		end
		if var1.conditionalProps then
			for i, v in var1.conditionalProps do
				local var6, var7 = mapServerBindingProps(v.propOverrides, serverBindingPropMap)
				
				if var6 then
					for i_1, v_1 in var6 do
						v.propOverrides[i_1] = v_1
					end
				end
				if var7 then
					p2.dependencies.logger.reportError(sduiErrorType.UnmappedServerBindingProp, {
						componentType = componentType,
						name = p3,
						message = `Unmapped PascalCase conditional props detected: {table.concat(var7, ", ")}. These props will not reach the camelCase component.`
					}, p2.appPage)
				end
				parsePropsModule(componentType, v.propOverrides, p3, p2, p4, nil, sduiBuilderProcessingPhase.Eager)
			end
		end
		local var8 = p2.componentDefinitions:getPropInterface(componentType)
		
		if var8 then
			local _ = nil
			local var9, var10 = validateInterfaceModule(var1.props, var8)
			local var11 = var10
			
			if var9 then
				var1.__processed = true
				instrumentation:stopTimerFlow("EagerProcess", p2)
				
				return true, var1
			else
				p2.dependencies.logger.reportError(sduiErrorType.InvalidProps, {
					componentType = componentType,
					name = p3,
					message = var11
				}, p2.appPage)
				instrumentation:stopTimerFlow("EagerProcess", p2, true)
				
				return false, p1
			end
		end
	end
}