local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.Signals)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local getSduiActionHandlerRegistryModule = require(sduiCoreSystem.getSduiActionHandlerRegistry)
local getSduiServiceDependenciesStoreModule = require(sduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)
local logActionTelemetryModule = require(sduiCoreSystem.Analytics.logActionTelemetry)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local buildPropTable = sduiClientBindingBuilderModule.buildPropTable
local _ = require(sduiCoreSystem.SduiActionType)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiChartsSortDetailGenreFilter = require(parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local fFlagSduiActionSkipUnifiedLogging = require(parent.SharedFlags).FFlagSduiActionSkipUnifiedLogging
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiOptionSelectorCollection = require(parent.SharedFlags).FFlagSduiOptionSelectorCollection

local function mergeTemplateParamsWithOverrides(p0, p1)
	if typeof(p1) ~= "table" then
		return p0
	end
	local var11 = if p0 then table.clone(p0) else {}
	
	for i, v in p1 do
		var11[i] = v
	end
	return var11
end

local function buildActionProp(p2, p3, p4, p5, p6, p7)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), protoVariableMapperModule (ref), getSduiActionHandlerRegistryModule (ref), getSduiServiceDependenciesStoreModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiChartsSortDetailGenreFilter (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), fFlagSduiActionSkipUnifiedLogging (ref), buildPropTable (ref), mergeTemplateParamsWithOverrides (ref), logActionTelemetryModule (ref), fFlagSduiChartsSupport (ref), fFlagSduiOptionSelectorCollection (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiPropUtilsModule (ref), buildActionProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p6.currentComponentType
		currentParserName = p6.currentParserName
	end
	if p2 == "value" then
		local var12 = nil
		local ok, status = pcall(function()
			-- upvalues: p6 (ref), p3 (ref), var12 (write), protoVariableMapperModule (copy), getSduiActionHandlerRegistryModule (copy), getSduiServiceDependenciesStoreModule (copy), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), fFlagSduiChartsSortDetailGenreFilter (copy), sduiClientBindingBuilderModule (copy), p4 (ref), p5 (ref), p7 (ref), propResultCategory (copy), fFlagSduiActionSkipUnifiedLogging (copy), buildPropTable (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy), fFlagSduiChartsSupport (copy), fFlagSduiOptionSelectorCollection (copy)
			local appPage = p6.appPage
			local value = typeof(p3) == "table" and (p3.kind and (p3.kind.value or nil))
			var12 = if value and value.action_type then protoVariableMapperModule.mapActionTypeToLua(value.action_type) else nil
			
			if not var12 then
				error(`Could not map actionType: {value and value.action_type}`)
			end
			local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(var12)
			
			if not actionHandlerConfig then
				error(`Could not find action for actionType: {var12}`)
			end
			return function(_, p8, p9)
				-- upvalues: getSduiServiceDependenciesStoreModule (copy), appPage (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), fFlagSduiChartsSortDetailGenreFilter (copy), p6 (copy), p3 (copy), sduiClientBindingBuilderModule (copy), p4 (copy), p5 (copy), p7 (copy), propResultCategory (copy), fFlagSduiActionSkipUnifiedLogging (copy), value (ref), var12 (copy), buildPropTable (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy), actionHandlerConfig (ref), fFlagSduiChartsSupport (copy), fFlagSduiOptionSelectorCollection (copy)
				local t = {
					dependencies = getSduiServiceDependenciesStoreModule().getDependencies(appPage),
					appPage = appPage,
					configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport or fFlagSduiChartsSortDetailGenreFilter then p6.configKey else nil
				}
				local var16 = nil
				
				if p3 and p3.telemetry_handler then
					local telemetryHandler = p3.telemetry_handler
					
					if telemetryHandler.kind and telemetryHandler.kind.type then
						local var17, var18 = sduiClientBindingBuilderModule.buildProp(telemetryHandler, p4, p5, p6, p7)
						var16 = if var18 == propResultCategory.PropSignal then var17(false).data else var17
					end
				end
				local var19 = nil
				
				if fFlagSduiActionSkipUnifiedLogging and p3 and p3.skip_unified_logging then
					local skipUnifiedLogging = p3.skip_unified_logging
					
					if skipUnifiedLogging.kind and skipUnifiedLogging.kind.type then
						local var20, var21 = sduiClientBindingBuilderModule.buildProp(skipUnifiedLogging, p4, p5, p6, p7)
						var19 = if var21 == propResultCategory.PropSignal then var20(false).data else var20
					end
				end
				local actionParams = value and value.action_params
				local t_1 = {
					actionType = var12,
					telemetryHandler = var16,
					skipUnifiedLogging = var19
				}
				local var24 = nil
				
				if actionParams and next(actionParams) then
					local var25, var26 = buildPropTable(actionParams, p4, p5, p6, p7)
					
					if var26 then
						for i, v in var26 do
							var25[i] = v(false).data
						end
					end
					var24 = var25
				end
				t_1.actionParams = mergeTemplateParamsWithOverrides(var24, p9)
				logActionTelemetryModule(var16, actionHandlerConfig, t_1, p7, t)
				
				if actionHandlerConfig.handler then
					if fFlagSduiChartsSupport or fFlagSduiOptionSelectorCollection then
						return actionHandlerConfig.handler(t_1, p7, t, p8)
					end
					actionHandlerConfig.handler(t_1, p7, t, p8)
				end
			end
		end)
		
		if ok then
			return status, propResultCategory.Literal
		end
		return function(_, _, _)
			-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), var12 (write), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
			sduiLoggerModule.reportCounter(sduiErrorsModule.SduiCounterName.ExecutedInvalidAction, {
				name = var12,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else "buildActionProp"
			})
		end, propResultCategory.Failed, status
	elseif p2 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p3, p4, p6, p7, p5, buildActionProp), propResultCategory.PropSignal
	end
	error(`Could not build prop. Unknown propDefinitionType: {p2}`)
end

return buildActionProp