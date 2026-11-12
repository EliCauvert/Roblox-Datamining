local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local TutilsModule = require(Parent.tutils)
local SduiBuilderProcessingPhase = require(SduiCoreSystem.SduiBuilderTypes).SduiBuilderProcessingPhase
local _ = require(SduiCoreSystem.SduiComponentType)
local SduiErrorType = require(SduiCoreSystem.SduiErrors).SduiErrorType
local ParsePropsModule = require(SduiCoreSystem.parseProps)
local ValidateInterfaceModule = require(SduiCoreSystem.validateInterface)
local UiComponentInterface = require(SduiCoreSystem.SduiConfigTypes).UiComponentInterface
local SduiCompatModule = require(Parent.SduiCompat)
local MapServerBindingPropsFunction = SduiCompatModule.mapServerBindingProps
local ServerBindingPropMap = SduiCompatModule.ServerBindingPropMap
local SduiUsageRecorderModule = require(SduiCoreSystem.Analytics.SduiUsageRecorder)
local RecordV1ComponentUsageModule = require(SduiCoreSystem.Analytics.recordV1ComponentUsage)
local t = {}

return {
	getComponentType = function(p1, p2)
		if not p1.__isClientBinding and p2.templateRegistry:shouldResolveTemplate(p1) then
			p2.templateRegistry:resolveTemplateForConfig(p1, p2)
		end
		return p1.componentType
	end,
	buildAnalyticsContext = function(p1, p2, p3)
		-- upvalues: t (copy), CryoModule (copy)
		local P3 = p2 or t
		local AnalyticsData = p1.analyticsData or t
		local JoinResult = CryoModule.Dictionary.join(P3.ancestorAnalyticsData or t, P3.analyticsData or t)
		local GetCollectionData = P3.getCollectionData
		
		if p3 then
			AnalyticsData = CryoModule.Dictionary.join(AnalyticsData, p3)
		end
		return {
			analyticsData = AnalyticsData,
			ancestorAnalyticsData = JoinResult,
			getCollectionData = GetCollectionData
		}
	end,
	tryCreateEagerProcessedComponentConfig = function(p1, p2, Name, p3, p4)
		-- upvalues: SduiErrorType (copy), TutilsModule (copy), ValidateInterfaceModule (copy), UiComponentInterface (copy), MapServerBindingPropsFunction (copy), ServerBindingPropMap (copy), RecordV1ComponentUsageModule (copy), SduiUsageRecorderModule (copy), ParsePropsModule (copy), SduiBuilderProcessingPhase (copy)
		local Instrumentation = p2.dependencies.instrumentation
		Instrumentation:startTimerFlow("EagerProcess")
		
		if not p1 then
			p2.dependencies.logger.reportError(SduiErrorType.NilComponentConfig, { name = Name }, p2.appPage)
			Instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return false, p1
		end
		assert(p1, "componentConfig must exist")
		
		if p1.__processed then
			p2.dependencies.logger.reportError(SduiErrorType.EagerReprocessing, {
				message = "Eagerly evaluating a component that has already been processed",
				componentType = p1.componentType,
				name = Name
			}, p2.appPage)
			Instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return true, p1
		end
		local DeepCopyResult = if p4 then TutilsModule.deepCopy(p1) else p1
		
		if p2.templateRegistry:shouldResolveTemplate(DeepCopyResult) then
			local Props = DeepCopyResult.props
			
			if Props and Props.itemTemplateKey then
				if Props.items then
					for _, item in Props.items do
						if item.templateKey == nil then
							item.templateKey = Props.itemTemplateKey
						end
					end
				elseif Props.item and Props.item.templateKey == nil then
					Props.item.templateKey = Props.itemTemplateKey
				end
			end
			if not p2.templateRegistry:resolveTemplateForConfig(DeepCopyResult, p2) then
				Instrumentation:stopTimerFlow("EagerProcess", p2, true)
				
				return false, p1
			end
		end
		local ComponentType = DeepCopyResult.componentType
		
		if p2.componentDefinitions:getComponent(ComponentType) == nil then
			p2.dependencies.logger.reportError(SduiErrorType.NoComponentRegistered, { componentType = ComponentType, name = Name }, p2.appPage)
			Instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return false, p1
		end
		local ValidateInterfaceModuleResult, ValidateInterfaceModuleResult2 = ValidateInterfaceModule(DeepCopyResult, UiComponentInterface, false)
		
		if not ValidateInterfaceModuleResult then
			p2.dependencies.logger.reportError(SduiErrorType.InvalidComponentConfig, {
				message = `(Eager) Invalid config for component. err: {ValidateInterfaceModuleResult2}`,
				componentType = ComponentType,
				name = Name,
				value = DeepCopyResult
			}, p2.appPage)
			Instrumentation:stopTimerFlow("EagerProcess", p2, true)
			
			return false, p1
		end
		if DeepCopyResult.props then
			local MapServerBindingPropsResult1, MapServerBindingPropsResult2_1 = MapServerBindingPropsFunction(DeepCopyResult.props, ServerBindingPropMap)
			
			if MapServerBindingPropsResult1 then
				for i1, value1 in MapServerBindingPropsResult1 do
					DeepCopyResult.props[i1] = value1
				end
			end
			if MapServerBindingPropsResult2_1 then
				p2.dependencies.logger.reportError(SduiErrorType.UnmappedServerBindingProp, {
					componentType = ComponentType,
					name = Name,
					message = `Unmapped PascalCase props detected: {table.concat(MapServerBindingPropsResult2_1, ", ")}. These props will not reach the camelCase component.`
				}, p2.appPage)
			end
		end
		if not DeepCopyResult.__usageRecorded then
			RecordV1ComponentUsageModule(p2.appPage, DeepCopyResult)
			DeepCopyResult.__usageRecorded = true
			SduiUsageRecorderModule.scheduleFlush()
		end
		if DeepCopyResult.props then
			ParsePropsModule(ComponentType, DeepCopyResult.props, Name, p2, p3, nil, SduiBuilderProcessingPhase.Eager)
		end
		if DeepCopyResult.conditionalProps then
			for _, conditionalProp in DeepCopyResult.conditionalProps do
				local MapServerBindingPropsResult, MapServerBindingPropsResult2 = MapServerBindingPropsFunction(conditionalProp.propOverrides, ServerBindingPropMap)
				
				if MapServerBindingPropsResult then
					for i, value in MapServerBindingPropsResult do
						conditionalProp.propOverrides[i] = value
					end
				end
				if MapServerBindingPropsResult2 then
					p2.dependencies.logger.reportError(SduiErrorType.UnmappedServerBindingProp, {
						componentType = ComponentType,
						name = Name,
						message = `Unmapped PascalCase conditional props detected: {table.concat(MapServerBindingPropsResult2, ", ")}. These props will not reach the camelCase component.`
					}, p2.appPage)
				end
				ParsePropsModule(ComponentType, conditionalProp.propOverrides, Name, p2, p3, nil, SduiBuilderProcessingPhase.Eager)
			end
		end
		local PropInterface = p2.componentDefinitions:getPropInterface(ComponentType)
		
		if PropInterface then
			local ValidateInterfaceModuleResult1, ValidateInterfaceModuleResult2_1 = ValidateInterfaceModule(DeepCopyResult.props, PropInterface)
			
			if not ValidateInterfaceModuleResult1 then
				p2.dependencies.logger.reportError(SduiErrorType.InvalidProps, {
					componentType = ComponentType,
					name = Name,
					message = ValidateInterfaceModuleResult2_1
				}, p2.appPage)
				Instrumentation:stopTimerFlow("EagerProcess", p2, true)
				
				return false, p1
			end
		end
		DeepCopyResult.__processed = true
		Instrumentation:stopTimerFlow("EagerProcess", p2)
		
		return true, DeepCopyResult
	end
}