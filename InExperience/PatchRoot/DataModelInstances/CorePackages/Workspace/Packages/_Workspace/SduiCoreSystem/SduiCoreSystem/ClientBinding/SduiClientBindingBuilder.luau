local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SignalsModule = require(Parent.Signals)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local AddSduiErrorContextFieldsModule = require(SduiCoreSystem.addSduiErrorContextFields)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local BuildDataBindingSourcesForTemplateModule = require(SduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local BuildAnalyticsContextForClientBindingModule = require(SduiCoreSystem.ClientBinding.buildAnalyticsContextForClientBinding)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiComponentTypeModule = require(SduiCoreSystem.SduiComponentType)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiExperimentalComponent = SharedFlagsModule.FFlagSduiExperimentalComponent
local FFlagSduiErrorPaths = SharedFlagsModule.FFlagSduiErrorPaths

local function buildProp(IsComponentFiltered, Computed, p1, p2, AnalyticsContext, p3)
	-- upvalues: FFlagSduiExperimentalComponent (copy), buildProp (copy)
	if IsComponentFiltered.oneof_prop and IsComponentFiltered.oneof_prop.value then
		local v1 = p3
		
		if FFlagSduiExperimentalComponent then
			local PropBuilder = IsComponentFiltered.prop_builder
			
			if PropBuilder ~= nil then
				v1 = PropBuilder
			end
		end
		return buildProp(IsComponentFiltered.oneof_prop.value, Computed, p1, p2, AnalyticsContext, v1)
	else
		if typeof(IsComponentFiltered) == "table" and IsComponentFiltered.descriptor == nil then
			return p2.getPropBuilder("ContainerProp")(nil, IsComponentFiltered, Computed, p1, p2, AnalyticsContext)
		end
		local Type = IsComponentFiltered and (IsComponentFiltered.kind and IsComponentFiltered.kind.type)
		
		if Type == nil then
			error("No propDefinitionType provided")
		end
		if IsComponentFiltered.descriptor == nil then
			error(`No propDefinitionType descriptor provided for {Type}`)
		end
		local Name = IsComponentFiltered.descriptor.name
		local v2: boolean = FFlagSduiExperimentalComponent and p3 ~= nil
		local Name1 = if v2 then p3 else Name
		p2.currentParserName = Name1
		local PropBuilder = p2.getPropBuilder(Name1, v2)
		local Value = IsComponentFiltered.kind and IsComponentFiltered.kind.value
		
		if Value == nil then
			error(`No propDefinitionValue provided for {Type}`)
		end
		local PropBuilderResult, PropBuilderResult2, PropBuilderResult3 = PropBuilder(Type, Value, Computed, p1, p2, AnalyticsContext)
		
		return PropBuilderResult, PropBuilderResult2, PropBuilderResult3
	end
end

local function buildPropTable(AnalyticsData, Computed, p4, p5, AnalyticsContext)
	-- upvalues: ProtoVariableMapperModule (copy), buildProp (copy), PropResultCategory (copy), FFlagSduiErrorPaths (copy), AddSduiErrorContextFieldsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
	local t = {}
	
	if AnalyticsData == nil then
		error("Attempt to buildPropTable with nil")
	end
	local CurrentComponentType = p5.currentComponentType
	local T = nil
	local T1 = nil
	local T2 = nil
	
	for i, Value in AnalyticsData do
		local MapPropNameResult = ProtoVariableMapperModule.mapPropName(i)
		local Success, Result = pcall(function()
			-- upvalues: buildProp (upval), Value (copy), Computed (copy), p4 (copy), p5 (copy), AnalyticsContext (copy), PropResultCategory (upval), T (ref), MapPropNameResult (copy), T1 (ref), T2 (ref), t (copy), CurrentComponentType (copy), FFlagSduiErrorPaths (upval), AddSduiErrorContextFieldsModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval)
			local Prop, Prop2, Prop3 = buildProp(Value, Computed, p4, p5, AnalyticsContext)
			
			if Prop2 == PropResultCategory.PropSignal then
				if T == nil then
					T = {}
				end
				T[MapPropNameResult] = Prop
				
				return
			elseif Prop2 == PropResultCategory.NestedComponentConfig then
				if T1 == nil then
					T1 = {}
				end
				T1[MapPropNameResult] = Prop
				
				return
			elseif Prop2 == PropResultCategory.NestedComponentConfigListPropSignal then
				if T == nil then
					T = {}
				end
				T[MapPropNameResult] = Prop
				
				if T2 == nil then
					T2 = {}
				end
				T2[MapPropNameResult] = true
				
				return
			elseif Prop2 == PropResultCategory.Failed then
				t[MapPropNameResult] = Prop
				local config = {
					message = `ClientBinding - failed to build prop {MapPropNameResult}: {Prop}, {Prop3}`,
					propName = `{MapPropNameResult}`,
					name = p5.debugName,
					componentType = CurrentComponentType,
					parserName = Value.descriptor.name,
					value = Value
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config, p5.errorContext)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, config, p5.appPage)
				
				return
			else
				if Prop2 == PropResultCategory.Literal then
					t[MapPropNameResult] = Prop
					
					return
				end
				local config = {
					message = `ClientBinding - unexpected propResultCategory: {Prop2}. {MapPropNameResult}: {Prop}, {Prop3}`,
					propName = `{MapPropNameResult}`,
					name = p5.debugName,
					componentType = CurrentComponentType,
					parserName = Value.descriptor.name,
					value = Value
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config, p5.errorContext)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, config, p5.appPage)
				t[MapPropNameResult] = Prop
			end
		end)
		
		if not Success then
			local config = {
				message = `ClientBinding - failed to build prop {MapPropNameResult}: {Result}. {Result}`,
				propName = `{MapPropNameResult}`,
				name = p5.debugName,
				componentType = CurrentComponentType,
				parserName = Value.descriptor.name,
				value = Value
			}
			
			if FFlagSduiErrorPaths then
				AddSduiErrorContextFieldsModule(config, p5.errorContext)
			end
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, config, p5.appPage)
		end
	end
	return t, T, T1, T2
end

local config = {
	__index = function(p6, p7)
		return if p7 == "analyticsData" then p6.analyticsContext and p6.analyticsContext.analyticsData else nil
	end
}

local function resolveComponentType(p6)
	-- upvalues: FFlagSduiExperimentalComponent (copy), SduiComponentTypeModule (copy), ProtoVariableMapperModule (copy)
	if FFlagSduiExperimentalComponent then
		local MapUiComponentTypeToLuaResult = nil
		
		if p6.experimental_type then
			MapUiComponentTypeToLuaResult = SduiComponentTypeModule[p6.experimental_type]
		else
			local ComponentType1 = p6.shared and p6.shared.component_type
			
			if ComponentType1 then
				MapUiComponentTypeToLuaResult = ProtoVariableMapperModule.mapUiComponentTypeToLua(ComponentType1)
			end
		end
		if not MapUiComponentTypeToLuaResult then
			error("Could not determine ui component type")
		end
		return MapUiComponentTypeToLuaResult
	else
		local ComponentType = p6.shared and p6.shared.component_type
		
		if not ComponentType then
			error("Could not determine ui component type")
		end
		return (ProtoVariableMapperModule.mapUiComponentTypeToLua(ComponentType))
	end
end

return {
	buildPropTable = buildPropTable,
	buildProp = buildProp,
	buildConfigForComponent = function(p6, Callback, Tbl, p7, _, p8, p9, p10, p11)
		-- upvalues: resolveComponentType (copy), FFlagSduiErrorPaths (copy), SignalsModule (copy), BuildDataBindingSourcesForTemplateModule (copy), SduiParseHelpersModule (copy), AddSduiErrorContextFieldsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), config (copy), buildPropTable (copy), BuildAnalyticsContextForClientBindingModule (copy), buildProp (copy), PropResultCategory (copy)
		if not p6 or not next(p6) then
			error("Attempt to buildConfigForComponent with nil template")
		end
		local Value = p6.kind.value
		local ResolveComponentTypeResult = resolveComponentType(Value)
		local v3 = nil
		
		if FFlagSduiErrorPaths then
			v3 = p9 or {}
			local ErrorContext = Tbl.errorContext
			local FullName = if ErrorContext then ErrorContext.fullName else Tbl.appPage
			local RctPath = if ErrorContext then ErrorContext.rctPath else nil
			local P19 = p10 or (ResolveComponentTypeResult or p6.kind.type)
			v3.errorContext = {
				fullName = if p11 and p11 ~= "" then `{FullName}.{P19}[{p11}]` else `{FullName}.{P19}`,
				rctPath = if p10 then if RctPath then `{RctPath}.{p10}` else p10 else RctPath,
				templateId = if p10 then Tbl.getTemplateIdForRCT and Tbl.getTemplateIdForRCT(p10) else ErrorContext and ErrorContext.templateId
			}
			Tbl = table.clone(Tbl)
			Tbl.errorContext = v3.errorContext
		end
		Tbl.currentComponentType = ResolveComponentTypeResult
		local Computed = nil
		
		if p8 == nil then
			local Data = Value.shared and Value.shared.data or {}
			Computed = SignalsModule.createComputed(function(p12)
				-- upvalues: BuildDataBindingSourcesForTemplateModule (upval), Callback (copy), Data (copy), Tbl (ref), ResolveComponentTypeResult (copy), SduiParseHelpersModule (upval), FFlagSduiErrorPaths (upval), AddSduiErrorContextFieldsModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: BuildDataBindingSourcesForTemplateModule (upval), Callback (upval), p12 (copy), Data (upval)
					return BuildDataBindingSourcesForTemplateModule(Callback(p12), Data)
				end)
				
				if Success then
					return Result
				end
				local config = {
					name = Tbl.debugName,
					componentType = ResolveComponentTypeResult,
					message = SduiParseHelpersModule.stringifyValue(Result)
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config, Tbl.errorContext)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToBuildBindingSources, config, Tbl.appPage)
				
				return {}
			end)
		else
			Computed = p8
		end
		if not FFlagSduiErrorPaths then
			v3 = p9 or {}
		end
		v3.__processed = true
		v3.__isClientBinding = true
		v3.componentType = ResolveComponentTypeResult
		setmetatable(v3, config)
		local v4 = nil
		local v5 = nil
		
		if Value.shared and Value.shared.analytics_data then
			v4, v59 = buildPropTable(Value.shared.analytics_data, Computed, Callback, Tbl, nil)
		end
		v3.analyticsContext = BuildAnalyticsContextForClientBindingModule(v4, v5, p7, Tbl)
		
		if Value.props then
			local PropTable2, PropTable3, PropTable4
			v3.props, PropTable2, PropTable3, PropTable4 = buildPropTable(Value.props, Computed, Callback, Tbl, v3.analyticsContext)
			
			if PropTable2 ~= nil and next(PropTable2) then
				v3.propSignals = PropTable2
			end
			if PropTable3 ~= nil and next(PropTable3) then
				v3.nestedComponentConfigs = PropTable3
			end
			if PropTable4 ~= nil and next(PropTable4) then
				v3.nestedComponentConfigListPropSignalNames = PropTable4
			end
		end
		if Value.shared and Value.shared.is_component_filtered then
			local IsComponentFiltered = Value.shared.is_component_filtered
			local Success, Result, Result3, Result4 = pcall(function()
				-- upvalues: buildProp (upval), IsComponentFiltered (copy), Computed (ref), Callback (copy), Tbl (ref), v3 (ref)
				return buildProp(IsComponentFiltered, Computed, Callback, Tbl, v3.analyticsContext)
			end)
			
			if Success and not Result4 and Result3 ~= PropResultCategory.Failed then
				if Result3 == PropResultCategory.PropSignal then
					v3.isComponentFilteredSignal = Result
				elseif Result3 == PropResultCategory.Literal then
					function v3.isComponentFilteredSignal()
						-- upvalues: Result (copy)
						return { data = Result }
					end
				end
			else
				local config1 = {
					message = `Failed to build is_component_filtered prop: {if Result4 then SduiParseHelpersModule.stringifyValue(Result4) else SduiParseHelpersModule.stringifyValue(Result)}`,
					name = Tbl.debugName,
					componentType = ResolveComponentTypeResult,
					value = SduiParseHelpersModule.stringifyValue(IsComponentFiltered)
				}
				
				if FFlagSduiErrorPaths then
					AddSduiErrorContextFieldsModule(config1, Tbl.errorContext)
				end
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, config1, Tbl.appPage)
			end
		end
		return v3
	end
}