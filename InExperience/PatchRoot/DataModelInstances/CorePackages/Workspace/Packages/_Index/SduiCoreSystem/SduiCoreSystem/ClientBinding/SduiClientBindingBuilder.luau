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

local function buildProp(IsComponentFiltered, Computed, p1, p2, AnalyticsContext)
	-- upvalues: buildProp (copy)
	if IsComponentFiltered.oneof_prop and IsComponentFiltered.oneof_prop.value then
		return buildProp(IsComponentFiltered.oneof_prop.value, Computed, p1, p2, AnalyticsContext)
	end
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
	p2.currentParserName = Name
	local PropBuilder = p2.getPropBuilder(Name)
	local Value = IsComponentFiltered.kind and IsComponentFiltered.kind.value
	
	if Value == nil then
		error(`No propDefinitionValue provided for {Type}`)
	end
	local PropBuilderResult, PropBuilderResult2, PropBuilderResult3 = PropBuilder(Type, Value, Computed, p1, p2, AnalyticsContext)
	
	return PropBuilderResult, PropBuilderResult2, PropBuilderResult3
end

local function buildPropTable(AnalyticsData, Computed, p3, p4, AnalyticsContext)
	-- upvalues: ProtoVariableMapperModule (copy), buildProp (copy), PropResultCategory (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
	local t = {}
	
	if AnalyticsData == nil then
		error("Attempt to buildPropTable with nil")
	end
	local CurrentComponentType = p4.currentComponentType
	local T = nil
	local T1 = nil
	local T2 = nil
	
	for i, Value in AnalyticsData do
		local MapPropNameResult = ProtoVariableMapperModule.mapPropName(i)
		local Success, Result = pcall(function()
			-- upvalues: buildProp (upval), Value (copy), Computed (copy), p3 (copy), p4 (copy), AnalyticsContext (copy), PropResultCategory (upval), T (ref), MapPropNameResult (copy), T1 (ref), T2 (ref), t (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (copy)
			local Prop, Prop2, Prop3 = buildProp(Value, Computed, p3, p4, AnalyticsContext)
			
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
					name = p4.debugName,
					componentType = CurrentComponentType,
					parserName = Value.descriptor.name,
					value = Value
				}, p4.appPage)
				
				return
			else
				if Prop2 == PropResultCategory.Literal then
					t[MapPropNameResult] = Prop
					
					return
				else
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `ClientBinding - unexpected propResultCategory: {Prop2}. {MapPropNameResult}: {Prop}, {Prop3}`,
						propName = `{MapPropNameResult}`,
						name = p4.debugName,
						componentType = CurrentComponentType,
						parserName = Value.descriptor.name,
						value = Value
					}, p4.appPage)
					t[MapPropNameResult] = Prop
				end
			end
		end)
		
		if not Success then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - failed to build prop {MapPropNameResult}: {Result}. {Result}`,
				propName = `{MapPropNameResult}`,
				name = p4.debugName,
				componentType = CurrentComponentType,
				parserName = Value.descriptor.name,
				value = Value
			}, p4.appPage)
		end
	end
	return t, T, T1, T2
end

local config = {
	__index = function(p5, p6)
		return if p6 == "analyticsData" then p5.analyticsContext and p5.analyticsContext.analyticsData else nil
	end
}

local function resolveComponentType(p5)
	-- upvalues: FFlagSduiExperimentalComponent (copy), SduiComponentTypeModule (copy), ProtoVariableMapperModule (copy)
	if FFlagSduiExperimentalComponent then
		local MapUiComponentTypeToLuaResult = nil
		
		if p5.experimental_type then
			MapUiComponentTypeToLuaResult = SduiComponentTypeModule[p5.experimental_type]
		else
			local ComponentType1 = p5.shared and p5.shared.component_type
			
			if ComponentType1 then
				MapUiComponentTypeToLuaResult = ProtoVariableMapperModule.mapUiComponentTypeToLua(ComponentType1)
			end
		end
		if not MapUiComponentTypeToLuaResult then
			error("Could not determine ui component type")
		end
		return MapUiComponentTypeToLuaResult
	else
		local ComponentType = p5.shared and p5.shared.component_type
		
		if not ComponentType then
			error("Could not determine ui component type")
		end
		return (ProtoVariableMapperModule.mapUiComponentTypeToLua(ComponentType))
	end
end

return {
	buildPropTable = buildPropTable,
	buildProp = buildProp,
	buildConfigForComponent = function(p5, Callback, p6, p7, _, p8, p9)
		-- upvalues: resolveComponentType (copy), SignalsModule (copy), BuildDataBindingSourcesForTemplateModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), config (copy), buildPropTable (copy), BuildAnalyticsContextForClientBindingModule (copy), buildProp (copy), PropResultCategory (copy)
		if not p5 or not next(p5) then
			error("Attempt to buildConfigForComponent with nil template")
		end
		local Value = p5.kind.value
		local ResolveComponentTypeResult = resolveComponentType(Value)
		p6.currentComponentType = ResolveComponentTypeResult
		local Computed = nil
		
		if p8 == nil then
			local Data = Value.shared and Value.shared.data or {}
			Computed = SignalsModule.createComputed(function(p10)
				-- upvalues: BuildDataBindingSourcesForTemplateModule (upval), Callback (copy), Data (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), p6 (copy), ResolveComponentTypeResult (copy), SduiParseHelpersModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: BuildDataBindingSourcesForTemplateModule (upval), Callback (upval), p10 (copy), Data (upval)
					return BuildDataBindingSourcesForTemplateModule(Callback(p10), Data)
				end)
				
				if Success then
					return Result
				else
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToBuildBindingSources, {
						name = p6.debugName,
						componentType = ResolveComponentTypeResult,
						message = SduiParseHelpersModule.stringifyValue(Result)
					}, p6.appPage)
					
					return {}
				end
			end)
		else
			Computed = p8
		end
		local P18 = p9 or {}
		P18.__processed = true
		P18.__isClientBinding = true
		P18.componentType = ResolveComponentTypeResult
		setmetatable(P18, config)
		local v1 = nil
		local v2 = nil
		
		if Value.shared and Value.shared.analytics_data then
			v1, v45 = buildPropTable(Value.shared.analytics_data, Computed, Callback, p6, nil)
		end
		P18.analyticsContext = BuildAnalyticsContextForClientBindingModule(v1, v2, p7, p6)
		
		if Value.props then
			local PropTable2, PropTable3, PropTable4
			P18.props, PropTable2, PropTable3, PropTable4 = buildPropTable(Value.props, Computed, Callback, p6, P18.analyticsContext)
			
			if PropTable2 ~= nil and next(PropTable2) then
				P18.propSignals = PropTable2
			end
			if PropTable3 ~= nil and next(PropTable3) then
				P18.nestedComponentConfigs = PropTable3
			end
			if PropTable4 ~= nil and next(PropTable4) then
				P18.nestedComponentConfigListPropSignalNames = PropTable4
			end
		end
		if Value.shared and Value.shared.is_component_filtered then
			local IsComponentFiltered = Value.shared.is_component_filtered
			local Success, Result, Result3, Result4 = pcall(function()
				-- upvalues: buildProp (upval), IsComponentFiltered (copy), Computed (ref), Callback (copy), p6 (copy), P18 (copy)
				return buildProp(IsComponentFiltered, Computed, Callback, p6, P18.analyticsContext)
			end)
			
			if Success and not Result4 and Result3 ~= PropResultCategory.Failed then
				if Result3 == PropResultCategory.PropSignal then
					P18.isComponentFilteredSignal = Result
				elseif Result3 == PropResultCategory.Literal then
					function P18.isComponentFilteredSignal()
						-- upvalues: Result (copy)
						return { data = Result }
					end
				end
			else
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build is_component_filtered prop: {if Result4 then SduiParseHelpersModule.stringifyValue(Result4) else SduiParseHelpersModule.stringifyValue(Result)}`,
					name = p6.debugName,
					componentType = ResolveComponentTypeResult,
					value = SduiParseHelpersModule.stringifyValue(IsComponentFiltered)
				}, p6.appPage)
			end
		end
		return P18
	end
}