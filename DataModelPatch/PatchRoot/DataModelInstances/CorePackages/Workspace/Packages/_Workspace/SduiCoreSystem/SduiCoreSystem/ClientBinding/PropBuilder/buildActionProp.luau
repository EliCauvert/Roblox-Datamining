local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.Signals)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local GetSduiActionHandlerRegistryModule = require(SduiCoreSystem.getSduiActionHandlerRegistry)
local GetSduiServiceDependenciesStoreModule = require(SduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)
local LogActionTelemetryModule = require(SduiCoreSystem.Analytics.logActionTelemetry)
local ReportUnifiedLoggingActionModule = require(SduiCoreSystem.Analytics.reportUnifiedLoggingAction)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SduiClientBindingBuilderModule = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local BuildPropTableFunction = SduiClientBindingBuilderModule.buildPropTable
local _ = require(SduiCoreSystem.SduiActionType)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local _ = require(SduiCoreSystem.SduiComponentType)
local FFlagSduiActionsShouldTakeOverrides = require(Parent.SharedFlags).FFlagSduiActionsShouldTakeOverrides
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiActionTelemetryHandler = require(Parent.SharedFlags).FFlagSduiActionTelemetryHandler
local FFlagSduiImprovedErrorDimensions = require(Parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = require(Parent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagSduiOptionSelectorCollection = require(Parent.SharedFlags).FFlagSduiOptionSelectorCollection

local function mergeTemplateParamsWithOverrides(Tbl, List)
	if typeof(List) ~= "table" then
		return Tbl
	end
	local Copy = if Tbl then table.clone(Tbl) else {}
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end

local function buildActionProp(p1, p2, p3, p4, p5, p6)
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), ProtoVariableMapperModule (copy), GetSduiActionHandlerRegistryModule (copy), GetSduiServiceDependenciesStoreModule (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy), FFlagSduiActionTelemetryHandler (copy), SduiClientBindingBuilderModule (copy), PropResultCategory (copy), BuildPropTableFunction (copy), FFlagSduiActionsShouldTakeOverrides (copy), mergeTemplateParamsWithOverrides (copy), LogActionTelemetryModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), ReportUnifiedLoggingActionModule (copy), FFlagSduiChartsSupport (copy), FFlagSduiOptionSelectorCollection (copy), SduiPropUtilsModule (copy), buildActionProp (copy)
	local CurrentComponentType = nil
	local CurrentParserName = nil
	
	if FFlagSduiImprovedErrorDimensions then
		CurrentComponentType = p5.currentComponentType
		CurrentParserName = p5.currentParserName
	end
	if p1 == "value" then
		local MapActionTypeToLuaResult = nil
		local Success, Result = pcall(function()
			-- upvalues: p5 (copy), p2 (copy), MapActionTypeToLuaResult (ref), ProtoVariableMapperModule (upval), GetSduiActionHandlerRegistryModule (upval), GetSduiServiceDependenciesStoreModule (upval), FFlagSduiExperienceDetailsSupport (upval), FFlagSduiEventDetailsSupport (upval), FFlagSduiActionTelemetryHandler (upval), SduiClientBindingBuilderModule (upval), p3 (copy), p4 (copy), p6 (copy), PropResultCategory (upval), BuildPropTableFunction (upval), FFlagSduiActionsShouldTakeOverrides (upval), mergeTemplateParamsWithOverrides (upval), LogActionTelemetryModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref), ReportUnifiedLoggingActionModule (upval), FFlagSduiChartsSupport (upval), FFlagSduiOptionSelectorCollection (upval)
			local AppPage = p5.appPage
			local Value = typeof(p2) == "table" and p2.kind and p2.kind.value or nil
			MapActionTypeToLuaResult = if Value and Value.action_type then ProtoVariableMapperModule.mapActionTypeToLua(Value.action_type) else nil
			
			if not MapActionTypeToLuaResult then
				error(`Could not map actionType: {Value and Value.action_type}`)
			end
			local ActionHandlerConfig = GetSduiActionHandlerRegistryModule().getActionHandlerConfig(MapActionTypeToLuaResult)
			
			if not ActionHandlerConfig then
				error(`Could not find action for actionType: {MapActionTypeToLuaResult}`)
			end
			return function(_, p7, p8)
				-- upvalues: GetSduiServiceDependenciesStoreModule (upval), AppPage (copy), FFlagSduiExperienceDetailsSupport (upval), FFlagSduiEventDetailsSupport (upval), p5 (upval), FFlagSduiActionTelemetryHandler (upval), p2 (upval), SduiClientBindingBuilderModule (upval), p3 (upval), p4 (upval), p6 (upval), PropResultCategory (upval), Value (copy), MapActionTypeToLuaResult (upval), BuildPropTableFunction (upval), FFlagSduiActionsShouldTakeOverrides (upval), mergeTemplateParamsWithOverrides (upval), LogActionTelemetryModule (upval), ActionHandlerConfig (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (upval), CurrentParserName (upval), ReportUnifiedLoggingActionModule (upval), FFlagSduiChartsSupport (upval), FFlagSduiOptionSelectorCollection (upval)
				local config = {
					dependencies = GetSduiServiceDependenciesStoreModule().getDependencies(AppPage),
					appPage = AppPage,
					configKey = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then p5.configKey else nil
				}
				local TelemetryHandler = nil
				
				if FFlagSduiActionTelemetryHandler and p2 and p2.telemetry_handler then
					local TelemetryHandler1 = p2.telemetry_handler
					
					if TelemetryHandler1.kind and TelemetryHandler1.kind.type then
						local Prop, Prop2 = SduiClientBindingBuilderModule.buildProp(TelemetryHandler1, p3, p4, p5, p6)
						TelemetryHandler = if Prop2 == PropResultCategory.PropSignal then Prop(false).data else Prop
					end
				end
				local ActionParams = Value and Value.action_params
				local config1 = {
					actionType = MapActionTypeToLuaResult,
					telemetryHandler = TelemetryHandler
				}
				local v1 = nil
				
				if ActionParams and next(ActionParams) then
					local PropTable, PropTable2 = BuildPropTableFunction(ActionParams, p3, p4, p5, p6)
					
					if PropTable2 then
						for i, value in PropTable2 do
							PropTable[i] = value(false).data
						end
					end
					if FFlagSduiActionsShouldTakeOverrides then
						v1 = PropTable
					else
						config1.actionParams = PropTable
					end
				end
				if FFlagSduiActionsShouldTakeOverrides then
					config1.actionParams = mergeTemplateParamsWithOverrides(v1, p8)
				end
				if FFlagSduiActionTelemetryHandler then
					LogActionTelemetryModule(TelemetryHandler, ActionHandlerConfig, config1, p6, config)
				elseif not ActionHandlerConfig.skipUnifiedLogging then
					if p6 == nil then
						SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.NilAnalyticsContext, {
							message = `Could not reportUnifiedLoggingAction. Missing analyticsContext {MapActionTypeToLuaResult}`,
							name = MapActionTypeToLuaResult,
							componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
							parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
						}, AppPage)
					else
						ReportUnifiedLoggingActionModule(config, config1, p6)
					end
				end
				if ActionHandlerConfig.handler then
					if FFlagSduiChartsSupport or FFlagSduiOptionSelectorCollection then
						return ActionHandlerConfig.handler(config1, p6, config, p7)
					end
					ActionHandlerConfig.handler(config1, p6, config, p7)
				end
			end
		end)
		
		if Success then
			return Result, PropResultCategory.Literal
		else
			return function(_, _, _)
				-- upvalues: SduiLoggerModule (upval), SduiErrorsModule (upval), MapActionTypeToLuaResult (ref), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref)
				SduiLoggerModule.reportCounter(SduiErrorsModule.SduiCounterName.ExecutedInvalidAction, {
					name = MapActionTypeToLuaResult,
					componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
					parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else "buildActionProp"
				})
			end, PropResultCategory.Failed, Result
		end
	elseif p1 ~= "conditional" then
		local MapActionTypeToLuaResult: (any) -> () = error
		MapActionTypeToLuaResult(`Could not build prop. Unknown propDefinitionType: {p1}`)
		
		return
	else
		local MapActionTypeToLuaResult = SduiPropUtilsModule
		MapActionTypeToLuaResult = MapActionTypeToLuaResult.generateConditionalPropValue
		MapActionTypeToLuaResult = MapActionTypeToLuaResult(p2, p3, p5, p6, p4, buildActionProp)
		
		return MapActionTypeToLuaResult, PropResultCategory.PropSignal
	end
end

return buildActionProp