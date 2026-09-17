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
local sduiActionTypeModule = require(sduiCoreSystem.SduiActionType)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local fFlagSduiActionSkipUnifiedLogging = require(parent.SharedFlags).FFlagSduiActionSkipUnifiedLogging
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiExperimentalComponent = require(parent.SharedFlags).FFlagSduiExperimentalComponent

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
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiExperimentalComponent (ref), sduiActionTypeModule (ref), protoVariableMapperModule (ref), getSduiActionHandlerRegistryModule (ref), getSduiServiceDependenciesStoreModule (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), fFlagSduiActionSkipUnifiedLogging (ref), buildPropTable (ref), mergeTemplateParamsWithOverrides (ref), logActionTelemetryModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiPropUtilsModule (ref), buildActionProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p7.currentComponentType
		currentParserName = p7.currentParserName
	end
	if p3 == "value" then
		local var2 = nil
		local ok, status = pcall(function()
			-- upvalues: p7 (ref), p4 (ref), fFlagSduiExperimentalComponent (copy), var2 (write), sduiActionTypeModule (copy), protoVariableMapperModule (copy), getSduiActionHandlerRegistryModule (copy), getSduiServiceDependenciesStoreModule (copy), sduiClientBindingBuilderModule (copy), p5 (ref), p6 (ref), p8 (ref), propResultCategory (copy), fFlagSduiActionSkipUnifiedLogging (copy), buildPropTable (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy)
			local appPage = p7.appPage
			local value = typeof(p4) == "table" and (p4.kind and (p4.kind.value or nil))
			local var3 = if fFlagSduiExperimentalComponent and value then value.experimental_type else nil
			var2 = if var3 then sduiActionTypeModule[var3] elseif value and value.action_type then protoVariableMapperModule.mapActionTypeToLua(value.action_type) else nil
			
			if not var2 then
				error(`Could not map actionType: {var3 or value and value.action_type}`)
			end
			local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(var2)
			
			if not actionHandlerConfig then
				error(`Could not find action for actionType: {var2}`)
			end
			return function(_, p9, p10)
				-- upvalues: getSduiServiceDependenciesStoreModule (copy), appPage (ref), p7 (copy), p4 (copy), sduiClientBindingBuilderModule (copy), p5 (copy), p6 (copy), p8 (copy), propResultCategory (copy), fFlagSduiActionSkipUnifiedLogging (copy), value (ref), var2 (copy), buildPropTable (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy), actionHandlerConfig (ref)
				local t = {
					dependencies = getSduiServiceDependenciesStoreModule().getDependencies(appPage),
					appPage = appPage,
					configKey = p7.configKey
				}
				local var4 = nil
				
				if p4 and p4.telemetry_handler then
					local telemetryHandler = p4.telemetry_handler
					
					if telemetryHandler.kind and telemetryHandler.kind.type then
						local var5, var6 = sduiClientBindingBuilderModule.buildProp(telemetryHandler, p5, p6, p7, p8)
						var4 = if var6 == propResultCategory.PropSignal then var5(false).data else var5
					end
				end
				local var7 = nil
				
				if fFlagSduiActionSkipUnifiedLogging and p4 and p4.skip_unified_logging then
					local skipUnifiedLogging = p4.skip_unified_logging
					
					if skipUnifiedLogging.kind and skipUnifiedLogging.kind.type then
						local var8, var9 = sduiClientBindingBuilderModule.buildProp(skipUnifiedLogging, p5, p6, p7, p8)
						var7 = if var9 == propResultCategory.PropSignal then var8(false).data else var8
					end
				end
				local actionParams = value and value.action_params
				local t_1 = {
					actionType = var2,
					telemetryHandler = var4,
					skipUnifiedLogging = var7
				}
				local var10 = nil
				
				if actionParams and next(actionParams) then
					local var11, var12 = buildPropTable(actionParams, p5, p6, p7, p8)
					
					if var12 then
						for i, v in var12 do
							var11[i] = v(false).data
						end
					end
					var10 = var11
				end
				t_1.actionParams = mergeTemplateParamsWithOverrides(var10, p10)
				logActionTelemetryModule(var4, actionHandlerConfig, t_1, p8, t)
				
				if actionHandlerConfig.handler then
					return actionHandlerConfig.handler(t_1, p8, t, p9)
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