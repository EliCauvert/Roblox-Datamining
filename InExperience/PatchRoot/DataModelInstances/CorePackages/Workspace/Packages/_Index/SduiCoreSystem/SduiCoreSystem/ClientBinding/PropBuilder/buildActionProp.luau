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

local function mergeTemplateParamsWithOverrides(p1, p2)
	if typeof(p2) ~= "table" then
		return p1
	end
	local var1 = if p1 then table.clone(p1) else {}
	
	for i, v in p2 do
		var1[i] = v
	end
	return var1
end

local function buildActionProp(p3, p4, p5, p6, p7, p8)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), protoVariableMapperModule (ref), getSduiActionHandlerRegistryModule (ref), getSduiServiceDependenciesStoreModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiChartsSortDetailGenreFilter (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), fFlagSduiActionSkipUnifiedLogging (ref), buildPropTable (ref), mergeTemplateParamsWithOverrides (ref), logActionTelemetryModule (ref), fFlagSduiChartsSupport (ref), fFlagSduiOptionSelectorCollection (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiPropUtilsModule (ref), buildActionProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p7.currentComponentType
		currentParserName = p7.currentParserName
	end
	if p3 == "value" then
		local var2 = nil
		local ok, status = pcall(function()
			-- upvalues: p7 (ref), p4 (ref), var2 (write), protoVariableMapperModule (copy), getSduiActionHandlerRegistryModule (copy), getSduiServiceDependenciesStoreModule (copy), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), fFlagSduiChartsSortDetailGenreFilter (copy), sduiClientBindingBuilderModule (copy), p5 (ref), p6 (ref), p8 (ref), propResultCategory (copy), fFlagSduiActionSkipUnifiedLogging (copy), buildPropTable (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy), fFlagSduiChartsSupport (copy), fFlagSduiOptionSelectorCollection (copy)
			local appPage = p7.appPage
			local value = typeof(p4) == "table" and (p4.kind and (p4.kind.value or nil))
			var2 = if value and value.action_type then protoVariableMapperModule.mapActionTypeToLua(value.action_type) else nil
			
			if not var2 then
				error(`Could not map actionType: {value and value.action_type}`)
			end
			local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(var2)
			
			if not actionHandlerConfig then
				error(`Could not find action for actionType: {var2}`)
			end
			return function(_, p9, p10)
				-- upvalues: getSduiServiceDependenciesStoreModule (copy), appPage (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), fFlagSduiChartsSortDetailGenreFilter (copy), p7 (copy), p4 (copy), sduiClientBindingBuilderModule (copy), p5 (copy), p6 (copy), p8 (copy), propResultCategory (copy), fFlagSduiActionSkipUnifiedLogging (copy), value (ref), var2 (copy), buildPropTable (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy), actionHandlerConfig (ref), fFlagSduiChartsSupport (copy), fFlagSduiOptionSelectorCollection (copy)
				local t = {
					dependencies = getSduiServiceDependenciesStoreModule().getDependencies(appPage),
					appPage = appPage,
					configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport or fFlagSduiChartsSortDetailGenreFilter then p7.configKey else nil
				}
				local var3 = nil
				
				if p4 and p4.telemetry_handler then
					local telemetryHandler = p4.telemetry_handler
					
					if telemetryHandler.kind and telemetryHandler.kind.type then
						local var4, var5 = sduiClientBindingBuilderModule.buildProp(telemetryHandler, p5, p6, p7, p8)
						var3 = if var5 == propResultCategory.PropSignal then var4(false).data else var4
					end
				end
				local var6 = nil
				
				if fFlagSduiActionSkipUnifiedLogging and p4 and p4.skip_unified_logging then
					local skipUnifiedLogging = p4.skip_unified_logging
					
					if skipUnifiedLogging.kind and skipUnifiedLogging.kind.type then
						local var7, var8 = sduiClientBindingBuilderModule.buildProp(skipUnifiedLogging, p5, p6, p7, p8)
						var6 = if var8 == propResultCategory.PropSignal then var7(false).data else var7
					end
				end
				local actionParams = value and value.action_params
				local t_1 = {
					actionType = var2,
					telemetryHandler = var3,
					skipUnifiedLogging = var6
				}
				local var9 = nil
				
				if actionParams and next(actionParams) then
					local var10, var11 = buildPropTable(actionParams, p5, p6, p7, p8)
					
					if var11 then
						for i, v in var11 do
							var10[i] = v(false).data
						end
					end
					var9 = var10
				end
				t_1.actionParams = mergeTemplateParamsWithOverrides(var9, p10)
				logActionTelemetryModule(var3, actionHandlerConfig, t_1, p8, t)
				
				if actionHandlerConfig.handler then
					if fFlagSduiChartsSupport or fFlagSduiOptionSelectorCollection then
						return actionHandlerConfig.handler(t_1, p8, t, p9)
					end
					actionHandlerConfig.handler(t_1, p8, t, p9)
				end
			end
		end)
		
		if ok then
			return status, propResultCategory.Literal
		end
		return function(_, _, _)
			-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), var2 (write), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
			sduiLoggerModule.reportCounter(sduiErrorsModule.SduiCounterName.ExecutedInvalidAction, {
				name = var2,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else "buildActionProp"
			})
		end, propResultCategory.Failed, status
	elseif p3 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p4, p5, p7, p8, p6, buildActionProp), propResultCategory.PropSignal
	end
	error(`Could not build prop. Unknown propDefinitionType: {p3}`)
end

return buildActionProp