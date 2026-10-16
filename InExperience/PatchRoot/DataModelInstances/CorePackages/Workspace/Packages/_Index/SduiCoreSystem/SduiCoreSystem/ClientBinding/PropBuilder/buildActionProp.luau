local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.Signals)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local GetSduiActionHandlerRegistryModule = require(SduiCoreSystem.getSduiActionHandlerRegistry)
local GetSduiServiceDependenciesStoreModule = require(SduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)
local LogActionTelemetryModule = require(SduiCoreSystem.Analytics.logActionTelemetry)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SduiClientBindingBuilderModule = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local BuildPropTableFunction = SduiClientBindingBuilderModule.buildPropTable
local SduiActionTypeModule = require(SduiCoreSystem.SduiActionType)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local _ = require(SduiCoreSystem.SduiComponentType)
local FFlagSduiExperimentalComponent = require(Parent.SharedFlags).FFlagSduiExperimentalComponent

local function mergeTemplateParamsWithOverrides(Tbl, List) --[[ Line: 37 ]]
	if typeof(List) ~= "table" then
		return Tbl
	end
	local Copy = if Tbl then table.clone(Tbl) else {}
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end

local function buildActionProp(p1, p2, p3, p4, p5, p6) --[[ Line: 51 ]]
	-- upvalues: FFlagSduiExperimentalComponent (copy), SduiActionTypeModule (copy), ProtoVariableMapperModule (copy), GetSduiActionHandlerRegistryModule (copy), GetSduiServiceDependenciesStoreModule (copy), SduiClientBindingBuilderModule (copy), PropResultCategory (copy), BuildPropTableFunction (copy), mergeTemplateParamsWithOverrides (copy), LogActionTelemetryModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiPropUtilsModule (copy), buildActionProp (copy)
	local CurrentComponentType = p5.currentComponentType
	local CurrentParserName = p5.currentParserName
	
	if p1 == "value" then
		local MapActionTypeToLuaResult = nil
		local Success, Result = pcall(function() --[[ Line: 64 ]]
			-- upvalues: p5 (copy), p2 (copy), FFlagSduiExperimentalComponent (upval), MapActionTypeToLuaResult (ref), SduiActionTypeModule (upval), ProtoVariableMapperModule (upval), GetSduiActionHandlerRegistryModule (upval), GetSduiServiceDependenciesStoreModule (upval), SduiClientBindingBuilderModule (upval), p3 (copy), p4 (copy), p6 (copy), PropResultCategory (upval), BuildPropTableFunction (upval), mergeTemplateParamsWithOverrides (upval), LogActionTelemetryModule (upval)
			local AppPage = p5.appPage
			local Value = typeof(p2) == "table" and p2.kind and p2.kind.value or nil
			local ExperimentalType = if FFlagSduiExperimentalComponent and Value then Value.experimental_type else nil
			MapActionTypeToLuaResult = if ExperimentalType then SduiActionTypeModule[ExperimentalType] elseif Value and Value.action_type then ProtoVariableMapperModule.mapActionTypeToLua(Value.action_type) else nil
			
			if not MapActionTypeToLuaResult then
				error(`Could not map actionType: {ExperimentalType or Value and Value.action_type}`)
			end
			local ActionHandlerConfig = GetSduiActionHandlerRegistryModule().getActionHandlerConfig(MapActionTypeToLuaResult)
			
			if not ActionHandlerConfig then
				error(`Could not find action for actionType: {MapActionTypeToLuaResult}`)
			end
			return function(_, p7, p8) --[[ Line: 96 ]]
				-- upvalues: GetSduiServiceDependenciesStoreModule (upval), AppPage (copy), p5 (upval), p2 (upval), SduiClientBindingBuilderModule (upval), p3 (upval), p4 (upval), p6 (upval), PropResultCategory (upval), Value (copy), MapActionTypeToLuaResult (upval), BuildPropTableFunction (upval), mergeTemplateParamsWithOverrides (upval), LogActionTelemetryModule (upval), ActionHandlerConfig (copy)
				local config = {
					dependencies = GetSduiServiceDependenciesStoreModule().getDependencies(AppPage),
					appPage = AppPage,
					configKey = p5.configKey
				}
				local TelemetryHandler = nil
				
				if p2 and p2.telemetry_handler then
					local TelemetryHandler1 = p2.telemetry_handler
					
					if TelemetryHandler1.kind and TelemetryHandler1.kind.type then
						local Prop, Prop2 = SduiClientBindingBuilderModule.buildProp(TelemetryHandler1, p3, p4, p5, p6)
						TelemetryHandler = if Prop2 == PropResultCategory.PropSignal then Prop(false).data else Prop
					end
				end
				local SkipUnifiedLogging = nil
				
				if p2 and p2.skip_unified_logging then
					local SkipUnifiedLogging1 = p2.skip_unified_logging
					
					if SkipUnifiedLogging1.kind and SkipUnifiedLogging1.kind.type then
						local Prop1, Prop2_1 = SduiClientBindingBuilderModule.buildProp(SkipUnifiedLogging1, p3, p4, p5, p6)
						SkipUnifiedLogging = if Prop2_1 == PropResultCategory.PropSignal then Prop1(false).data else Prop1
					end
				end
				local ActionParams = Value and Value.action_params
				local config1 = {
					actionType = MapActionTypeToLuaResult,
					telemetryHandler = TelemetryHandler,
					skipUnifiedLogging = SkipUnifiedLogging
				}
				local v1 = nil
				
				if ActionParams and next(ActionParams) then
					local PropTable, PropTable2 = BuildPropTableFunction(ActionParams, p3, p4, p5, p6)
					
					if PropTable2 then
						for i, value in PropTable2 do
							PropTable[i] = value(false).data
						end
					end
					v1 = PropTable
				end
				config1.actionParams = mergeTemplateParamsWithOverrides(v1, p8)
				LogActionTelemetryModule(TelemetryHandler, ActionHandlerConfig, config1, p6, config)
				
				if not ActionHandlerConfig.handler then return end
				return ActionHandlerConfig.handler(config1, p6, config, p7)
			end
		end)
		
		if Success then
			return Result, PropResultCategory.Literal
		else
			return function(_, _, _) --[[ Line: 177 ]]
				-- upvalues: SduiLoggerModule (upval), SduiErrorsModule (upval), MapActionTypeToLuaResult (ref), CurrentComponentType (copy), CurrentParserName (copy)
				SduiLoggerModule.reportCounter(SduiErrorsModule.SduiCounterName.ExecutedInvalidAction, {
					name = MapActionTypeToLuaResult,
					componentType = CurrentComponentType,
					parserName = CurrentParserName
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