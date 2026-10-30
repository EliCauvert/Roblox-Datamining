local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SignalsModule = require(Parent.Signals)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local BuildDataBindingSourcesForTemplateModule = require(SduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local BuildAnalyticsContextForClientBindingModule = require(SduiCoreSystem.ClientBinding.buildAnalyticsContextForClientBinding)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiComponentTypeModule = require(SduiCoreSystem.SduiComponentType)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local FFlagSduiExperimentalComponent = require(Parent.SharedFlags).FFlagSduiExperimentalComponent

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
	-- upvalues: ProtoVariableMapperModule (copy), buildProp (copy), PropResultCategory (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
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
			-- upvalues: buildProp (upval), Value (copy), Computed (copy), p4 (copy), p5 (copy), AnalyticsContext (copy), PropResultCategory (upval), T (ref), MapPropNameResult (copy), T1 (ref), T2 (ref), t (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (copy)
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
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `ClientBinding - failed to build prop {MapPropNameResult}: {Prop}, {Prop3}`,
					propName = `{MapPropNameResult}`,
					name = p5.debugName,
					componentType = CurrentComponentType,
					parserName = Value.descriptor.name,
					value = Value
				}, p5.appPage)
				
				return
			else
				if Prop2 == PropResultCategory.Literal then
					t[MapPropNameResult] = Prop
					
					return
				else
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `ClientBinding - unexpected propResultCategory: {Prop2}. {MapPropNameResult}: {Prop}, {Prop3}`,
						propName = `{MapPropNameResult}`,
						name = p5.debugName,
						componentType = CurrentComponentType,
						parserName = Value.descriptor.name,
						value = Value
					}, p5.appPage)
					t[MapPropNameResult] = Prop
				end
			end
		end)
		
		if not Success then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - failed to build prop {MapPropNameResult}: {Result}. {Result}`,
				propName = `{MapPropNameResult}`,
				name = p5.debugName,
				componentType = CurrentComponentType,
				parserName = Value.descriptor.name,
				value = Value
			}, p5.appPage)
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
	buildConfigForComponent = function(p6, Callback, p7, p8, _, p9, p10)
		-- upvalues: resolveComponentType (copy), SignalsModule (copy), BuildDataBindingSourcesForTemplateModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), config (copy), buildPropTable (copy), BuildAnalyticsContextForClientBindingModule (copy), buildProp (copy), PropResultCategory (copy)
		if not p6 or not next(p6) then
			error("Attempt to buildConfigForComponent with nil template")
		end
		local Value = p6.kind.value
		local ResolveComponentTypeResult = resolveComponentType(Value)
		p7.currentComponentType = ResolveComponentTypeResult
		local Computed = nil
		
		if p9 == nil then
			local Data = Value.shared and Value.shared.data or {}
			Computed = SignalsModule.createComputed(function(p11)
				-- upvalues: BuildDataBindingSourcesForTemplateModule (upval), Callback (copy), Data (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), p7 (copy), ResolveComponentTypeResult (copy), SduiParseHelpersModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: BuildDataBindingSourcesForTemplateModule (upval), Callback (upval), p11 (copy), Data (upval)
					return BuildDataBindingSourcesForTemplateModule(Callback(p11), Data)
				end)
				
				if Success then
					return Result
				else
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToBuildBindingSources, {
						name = p7.debugName,
						componentType = ResolveComponentTypeResult,
						message = SduiParseHelpersModule.stringifyValue(Result)
					}, p7.appPage)
					
					return {}
				end
			end)
		else
			Computed = p9
		end
		local P19 = p10 or {}
		P19.__processed = true
		P19.__isClientBinding = true
		P19.componentType = ResolveComponentTypeResult
		setmetatable(P19, config)
		local v3 = nil
		local v4 = nil
		
		if Value.shared and Value.shared.analytics_data then
			v3, v49 = buildPropTable(Value.shared.analytics_data, Computed, Callback, p7, nil)
		end
		P19.analyticsContext = BuildAnalyticsContextForClientBindingModule(v3, v4, p8, p7)
		
		if Value.props then
			local PropTable2, PropTable3, PropTable4
			P19.props, PropTable2, PropTable3, PropTable4 = buildPropTable(Value.props, Computed, Callback, p7, P19.analyticsContext)
			
			if PropTable2 ~= nil and next(PropTable2) then
				P19.propSignals = PropTable2
			end
			if PropTable3 ~= nil and next(PropTable3) then
				P19.nestedComponentConfigs = PropTable3
			end
			if PropTable4 ~= nil and next(PropTable4) then
				P19.nestedComponentConfigListPropSignalNames = PropTable4
			end
		end
		if Value.shared and Value.shared.is_component_filtered then
			local IsComponentFiltered = Value.shared.is_component_filtered
			local Success, Result, Result3, Result4 = pcall(function()
				-- upvalues: buildProp (upval), IsComponentFiltered (copy), Computed (ref), Callback (copy), p7 (copy), P19 (copy)
				return buildProp(IsComponentFiltered, Computed, Callback, p7, P19.analyticsContext)
			end)
			
			if Success and not Result4 and Result3 ~= PropResultCategory.Failed then
				if Result3 == PropResultCategory.PropSignal then
					P19.isComponentFilteredSignal = Result
				elseif Result3 == PropResultCategory.Literal then
					function P19.isComponentFilteredSignal()
						-- upvalues: Result (copy)
						return { data = Result }
					end
				end
			else
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build is_component_filtered prop: {if Result4 then SduiParseHelpersModule.stringifyValue(Result4) else SduiParseHelpersModule.stringifyValue(Result)}`,
					name = p7.debugName,
					componentType = ResolveComponentTypeResult,
					value = SduiParseHelpersModule.stringifyValue(IsComponentFiltered)
				}, p7.appPage)
			end
		end
		return P19
	end
}