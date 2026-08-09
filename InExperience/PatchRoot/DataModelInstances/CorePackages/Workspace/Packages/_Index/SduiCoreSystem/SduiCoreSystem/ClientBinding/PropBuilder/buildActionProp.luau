local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.Signals)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local getSduiActionHandlerRegistryModule = require(sduiCoreSystem.getSduiActionHandlerRegistry)
local getSduiServiceDependenciesStoreModule = require(sduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)
local logActionTelemetryModule = require(sduiCoreSystem.Analytics.logActionTelemetry)
local reportUnifiedLoggingActionModule = require(sduiCoreSystem.Analytics.reportUnifiedLoggingAction)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local buildPropTable = sduiClientBindingBuilderModule.buildPropTable
local _ = require(sduiCoreSystem.SduiActionType)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local fFlagSduiActionsShouldTakeOverrides = require(parent.SharedFlags).FFlagSduiActionsShouldTakeOverrides
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiOptionSelectorCollection = require(parent.SharedFlags).FFlagSduiOptionSelectorCollection

local function mergeTemplateParamsWithOverrides(p0, p1) --[[ line: 45 ]]
	if typeof(p1) ~= "table" then
		return p0
	end
	local var12 = if p0 then table.clone(p0) else {}
	
	for i, v in p1 do
		var12[i] = v
	end
	return var12
end

local function buildActionProp(p2, p3, p4, p5, p6, p7) --[[ line: 59 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), protoVariableMapperModule (ref), getSduiActionHandlerRegistryModule (ref), getSduiServiceDependenciesStoreModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiActionTelemetryHandler (ref), sduiClientBindingBuilderModule (ref), propResultCategory (ref), buildPropTable (ref), fFlagSduiActionsShouldTakeOverrides (ref), mergeTemplateParamsWithOverrides (ref), logActionTelemetryModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), reportUnifiedLoggingActionModule (ref), fFlagSduiChartsSupport (ref), fFlagSduiOptionSelectorCollection (ref), sduiPropUtilsModule (ref), buildActionProp (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p6.currentComponentType
		currentParserName = p6.currentParserName
	end
	if p2 == "value" then
		local var13 = nil
		local ok, status = pcall(function() --[[ line: 76 ]]
			-- upvalues: p6 (ref), p3 (ref), var13 (write), protoVariableMapperModule (copy), getSduiActionHandlerRegistryModule (copy), getSduiServiceDependenciesStoreModule (copy), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), fFlagSduiActionTelemetryHandler (copy), sduiClientBindingBuilderModule (copy), p4 (ref), p5 (ref), p7 (ref), propResultCategory (copy), buildPropTable (copy), fFlagSduiActionsShouldTakeOverrides (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), reportUnifiedLoggingActionModule (copy), fFlagSduiChartsSupport (copy), fFlagSduiOptionSelectorCollection (copy)
			local appPage = p6.appPage
			local value = typeof(p3) == "table" and (p3.kind and (p3.kind.value or nil))
			var13 = if value and value.action_type then protoVariableMapperModule.mapActionTypeToLua(value.action_type) else nil
			
			if not var13 then
				error(`Could not map actionType: {value and value.action_type}`)
			end
			local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(var13)
			
			if not actionHandlerConfig then
				error(`Could not find action for actionType: {var13}`)
			end
			return function(_, p8, p9) --[[ line: 99 ]]
				-- upvalues: getSduiServiceDependenciesStoreModule (copy), appPage (ref), fFlagSduiExperienceDetailsSupport (copy), fFlagSduiEventDetailsSupport (copy), p6 (copy), fFlagSduiActionTelemetryHandler (copy), p3 (copy), sduiClientBindingBuilderModule (copy), p4 (copy), p5 (copy), p7 (copy), propResultCategory (copy), value (ref), var13 (copy), buildPropTable (copy), fFlagSduiActionsShouldTakeOverrides (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetryModule (copy), actionHandlerConfig (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (copy), currentParserName (copy), reportUnifiedLoggingActionModule (copy), fFlagSduiChartsSupport (copy), fFlagSduiOptionSelectorCollection (copy)
				local t = {
					dependencies = getSduiServiceDependenciesStoreModule().getDependencies(appPage),
					appPage = appPage,
					configKey = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then p6.configKey else nil
				}
				local var17 = nil
				
				if fFlagSduiActionTelemetryHandler and p3 and p3.telemetry_handler then
					local telemetryHandler = p3.telemetry_handler
					
					if telemetryHandler.kind and telemetryHandler.kind.type then
						local var18, var19 = sduiClientBindingBuilderModule.buildProp(telemetryHandler, p4, p5, p6, p7)
						var17 = if var19 == propResultCategory.PropSignal then var18(false).data else var18
					end
				end
				local actionParams = value and value.action_params
				local t_1 = { actionType = var13, telemetryHandler = var17 }
				local var22 = nil
				
				if actionParams and next(actionParams) then
					local var23, var24 = buildPropTable(actionParams, p4, p5, p6, p7)
					
					if var24 then
						for i, v in var24 do
							var23[i] = v(false).data
						end
					end
					if fFlagSduiActionsShouldTakeOverrides then
						var22 = var23
					else
						t_1.actionParams = var23
					end
				end
				if fFlagSduiActionsShouldTakeOverrides then
					t_1.actionParams = mergeTemplateParamsWithOverrides(var22, p9)
				end
				if fFlagSduiActionTelemetryHandler then
					logActionTelemetryModule(var17, actionHandlerConfig, t_1, p7, t)
				elseif not actionHandlerConfig.skipUnifiedLogging then
					if p7 == nil then
						sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.NilAnalyticsContext, {
							message = `Could not reportUnifiedLoggingAction. Missing analyticsContext {var13}`,
							name = var13,
							componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
							parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
						}, appPage)
					else
						reportUnifiedLoggingActionModule(t, t_1, p7)
					end
				end
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
		return function(_, _, _) --[[ line: 199 ]]
			-- upvalues: sduiLoggerModule (copy), sduiErrorsModule (copy), var13 (write), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
			sduiLoggerModule.reportCounter(sduiErrorsModule.SduiCounterName.ExecutedInvalidAction, {
				name = var13,
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