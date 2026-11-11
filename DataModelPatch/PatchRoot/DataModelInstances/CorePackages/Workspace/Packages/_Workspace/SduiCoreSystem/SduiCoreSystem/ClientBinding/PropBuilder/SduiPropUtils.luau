local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.ServiceContractsProto)
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local TutilsModule = require(Parent.tutils)
local SduiDataBinderModule = require(SduiCoreSystem.ClientBinding.SduiDataBinder)
local TryGetPathFromDataModule = require(SduiCoreSystem.ClientBinding.tryGetPathFromData)
local SplitDottedPathModule = require(SduiCoreSystem.ClientBinding.splitDottedPath)
local BuildDataBindingSourcesForTemplateModule = require(SduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local SduiDataBindingContentTypeModule = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local GetSduiTokensStoreModule = require(SduiCoreSystem.ClientBinding.getSduiTokensStore)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local SduiParsersModule = require(SduiCoreSystem.SduiParsers)
local _ = require(SduiCoreSystem.SduiComponentType)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local ApplyFormatArgFormatterFunction = require(SduiCoreSystem.ClientBinding.PropBuilder.applyFormatArgFormatter).applyFormatArgFormatter
local DataStatus = require(Parent.DataHydration).DataHydrationTypes.DataStatus
local FFlagSduiLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiImprovedErrorDimensions = require(Parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local FFlagSduiFormatArgFormatters = require(Parent.SharedFlags).FFlagSduiFormatArgFormatters
local FFlagSduiInlineNestedComponentSchema = require(Parent.SharedFlags).FFlagSduiInlineNestedComponentSchema
local FFlagSduiIsEmptyConditions = require(Parent.SharedFlags).FFlagSduiIsEmptyConditions
local FFlagSduiHydrationFetchIfMissing = require(Parent.SharedFlags).FFlagSduiHydrationFetchIfMissing
local FFlagSduiClientPageScope = require(Parent.SharedFlags).FFlagSduiClientPageScope
local FFlagSduiFocusNavActionsStructured = require(Parent.SharedFlags).FFlagSduiFocusNavActionsStructured
local FFlagSduiRenderPerf = require(Parent.SharedFlags).FFlagSduiRenderPerf
local SduiPropBuilderSupportNilHydration = game:DefineFastFlag("SduiPropBuilderSupportNilHydration", false)
local Frozen = table.freeze({ status = DataStatus.Failed })
local Frozen1 = table.freeze({})

local function resolveHydrationBinding(Entry, p1, p2, p3)
	-- upvalues: SduiPropBuilderSupportNilHydration (copy), SduiDataBindingContentTypeModule (copy), FFlagSduiHydrationFetchIfMissing (copy), SduiDataBinderModule (copy)
	local Joined = table.concat(Entry, ".")
	local Entry1 = Entry[1]
	local v1 = p1 and p1[Entry1]
	
	if v1 == nil then
		if SduiPropBuilderSupportNilHydration then
			if SduiDataBindingContentTypeModule[Entry1] ~= nil then
				error(`Could not find data bindingSource for key {Entry1}, bindingPath: {Joined}`)
			end
			return nil, nil
		else
			error(`Could not find data bindingSource for key {Entry1}, bindingPath: {Joined}`)
		end
	end
	local ContentType = v1.contentType
	local Id = v1.id
	
	if #Entry < 2 then
		error(`Unsupported path for contentType {ContentType}, bindingPath: {Joined}`)
	end
	local FieldValue, FieldValue2 = SduiDataBinderModule.getFieldValue(ContentType, Entry, Id, p2, FFlagSduiHydrationFetchIfMissing and v1.fetchIfMissing or p3)
	
	return FieldValue, FieldValue2
end

local function resolveBindingPathValue(p4, Entry, Callback2, Callback, Callback1, p5, p6)
	-- upvalues: TryGetPathFromDataModule (copy), SduiDataBinderModule (copy), FFlagSduiClientPageScope (copy), resolveHydrationBinding (copy), FFlagSduiRenderPerf (copy), SduiParseHelpersModule (copy)
	local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(Callback(p4), Entry)
	
	if TryGetPathFromDataModuleResult and TryGetPathFromDataModuleResult2 ~= nil then
		return if Callback1 then Callback1(TryGetPathFromDataModuleResult2, p4) else TryGetPathFromDataModuleResult2
	end
	local Entry1 = Entry and Entry[1]
	
	if SduiDataBinderModule.isClientContentType(Entry1) then
		local FieldValueForClientContentType = SduiDataBinderModule.getFieldValueForClientContentType(Entry1, Entry, p4, if FFlagSduiClientPageScope then p6 else nil)
		
		return if Callback1 and FieldValueForClientContentType ~= nil then Callback1(FieldValueForClientContentType, p4) else FieldValueForClientContentType
	end
	local ResolveHydrationBindingResult, ResolveHydrationBindingResult2 = resolveHydrationBinding(Entry, Callback2(p4), p4, p5)
	
	if Callback1 and ResolveHydrationBindingResult ~= nil then
		if FFlagSduiRenderPerf then
			ResolveHydrationBindingResult = Callback1(ResolveHydrationBindingResult, p4)
		else
			local Success, Result = pcall(function()
				-- upvalues: Callback1 (copy), ResolveHydrationBindingResult (ref), p4 (copy)
				return Callback1(ResolveHydrationBindingResult, p4)
			end)
			
			if not Success then
				error(`Parser failed for bindingPath: {table.concat(Entry, ".")}. err{SduiParseHelpersModule.stringifyValue(Result)}`)
			end
			ResolveHydrationBindingResult = Result
		end
	end
	return ResolveHydrationBindingResult, ResolveHydrationBindingResult2
end

local function generateDynamicBindingPropValue(Text: string, p7, p8, p9, p10, p11)
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy), SignalsModule (copy), resolveBindingPathValue (copy), FFlagSduiClientPageScope (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), Frozen (copy), TutilsModule (copy)
	local CurrentComponentType = nil
	local CurrentParserName = nil
	
	if FFlagSduiImprovedErrorDimensions then
		CurrentComponentType = p8.currentComponentType
		CurrentParserName = p8.currentParserName
	end
	local SplitDottedPathModuleResult = if FFlagSduiRenderPerf then SplitDottedPathModule(Text) else string.split(Text, ".")
	
	if not SplitDottedPathModuleResult or #SplitDottedPathModuleResult == 0 then
		error(`Invalid bindingPath: {Text}`)
	end
	return SignalsModule.createComputed(function(p12)
		-- upvalues: resolveBindingPathValue (upval), SplitDottedPathModuleResult (copy), p7 (copy), p9 (copy), p10 (copy), p11 (copy), FFlagSduiClientPageScope (upval), p8 (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), Text (copy), SduiParseHelpersModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref), Frozen (upval)
		local Success, Result, Result3 = pcall(function()
			-- upvalues: resolveBindingPathValue (upval), p12 (copy), SplitDottedPathModuleResult (upval), p7 (upval), p9 (upval), p10 (upval), p11 (upval), FFlagSduiClientPageScope (upval), p8 (upval)
			local ResolveBindingPathValueResult, ResolveBindingPathValueResult2 = resolveBindingPathValue(p12, SplitDottedPathModuleResult, p7, p9, p10, p11, if FFlagSduiClientPageScope then p8 else nil)
			
			return ResolveBindingPathValueResult, ResolveBindingPathValueResult2
		end)
		
		if Success then
			return { data = Result, status = Result3 }
		else
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToComputeDynamicBinding, {
				value = Text,
				message = SduiParseHelpersModule.stringifyValue(Result),
				name = p8.debugName,
				componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
				parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
			}, p8.appPage)
			
			return Frozen
		end
	end, TutilsModule.shallowEqual)
end

local function validateNumbers(Op, p7: number?, p8: number?)
	if typeof(p7) ~= "number" then
		p7 = tonumber(p7)
	end
	if typeof(p8) ~= "number" then
		p8 = tonumber(p8)
	end
	if typeof(p7) ~= "number" or typeof(p8) ~= "number" then
		error(`{Op} without numbers, {p7}: {typeof(p7)}, {p8}: {typeof(p8)}`)
	end
	return p7, p8
end

local function _(p7): boolean
	return p7 == nil or (if type(p7) == "string" then p7 == "" else type(p7) == "table" and next(p7) == nil)
end

local function isSame(Number, Number1): boolean
	-- upvalues: SduiParsersModule (copy)
	if Number == Number1 then
		return true
	end
	if Number == nil then
		return false
	end
	local ValueType = typeof(Number1)
	
	if typeof(Number) ~= ValueType then
		if ValueType == "string" then
			Number = tostring(Number)
		elseif ValueType == "number" then
			Number = tonumber(Number)
		elseif ValueType == "boolean" then
			Number = SduiParsersModule.parseBooleanProp_(Number, nil, nil)
		end
	end
	return Number == Number1
end

local function evaluateCondition(p7, Condition, p8, p9, p10)
	-- upvalues: FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy), resolveBindingPathValue (copy), FFlagSduiClientPageScope (copy), DataStatus (copy), validateNumbers (copy), isSame (copy), FFlagSduiIsEmptyConditions (copy), evaluateCondition (copy)
	if Condition == nil then
		return true
	end
	local Type = Condition and (Condition.kind and Condition.kind.type)
	local Value = Condition and (Condition.kind and Condition.kind.value)
	
	if Type == nil then
		error("nil conditionType in condition")
	end
	if Value == nil then
		error("nil conditionValue in condition")
	end
	local function getFieldObject(Text: string)
		-- upvalues: FFlagSduiRenderPerf (upval), SplitDottedPathModule (upval), resolveBindingPathValue (upval), p7 (copy), p8 (copy), p10 (copy), FFlagSduiClientPageScope (upval), p9 (copy)
		local SplitDottedPathModuleResult = if FFlagSduiRenderPerf then SplitDottedPathModule(Text) else string.split(Text, ".")
		local Success, Result, Result3 = pcall(function()
			-- upvalues: resolveBindingPathValue (upval), p7 (upval), SplitDottedPathModuleResult (copy), p8 (upval), p10 (upval), FFlagSduiClientPageScope (upval), p9 (upval)
			return resolveBindingPathValue(p7, SplitDottedPathModuleResult, p8, p10, nil, true, if FFlagSduiClientPageScope then p9 else nil)
		end)
		
		if Success then
			return Result, Result3
		else
			return nil, Result3
		end
	end
	
	if Type == "comparison" then
		local FieldObject, FieldObject2 = getFieldObject(Value.field)
		
		if FieldObject == nil or FieldObject2 and FieldObject2 ~= DataStatus.Ready then
			return nil, FieldObject2
		end
		local Value1 = Value.kind.value
		local Op = Value.op
		
		if Op == "OP_LT" then
			FieldObject, Value1 = validateNumbers(Op, FieldObject, Value1)
			
			return FieldObject < Value1
		end
		if Op == "OP_LTE" then
			FieldObject, Value1 = validateNumbers(Op, FieldObject, Value1)
			
			return FieldObject <= Value1
		end
		if Op == "OP_GT" then
			FieldObject, Value1 = validateNumbers(Op, FieldObject, Value1)
			
			return Value1 < FieldObject
		end
		if Op == "OP_GTE" then
			FieldObject, Value1 = validateNumbers(Op, FieldObject, Value1)
			
			return Value1 <= FieldObject
		end
		if Op == "OP_E" then
			return (isSame(FieldObject, Value1))
		end
		if Op == "OP_NE" then
			return not isSame(FieldObject, Value1)
		end
		error(`Unknown operator for comparison {Op}`)
	elseif Type == "is_null" then
		local FieldObject1, FieldObject2_1 = getFieldObject(Value.field)
		
		if FieldObject2_1 and FieldObject2_1 ~= DataStatus.Ready then
			return nil, FieldObject2_1
		else
			return FieldObject1 == nil
		end
	elseif Type == "is_not_null" then
		local FieldObject3, FieldObject2_2 = getFieldObject(Value.field)
		
		if FieldObject2_2 and FieldObject2_2 ~= DataStatus.Ready then
			return nil, FieldObject2_2
		else
			return FieldObject3 ~= nil
		end
	elseif FFlagSduiIsEmptyConditions and Type == "is_empty" then
		local FieldObject4, FieldObject2_3 = getFieldObject(Value.field)
		
		if FieldObject2_3 and FieldObject2_3 ~= DataStatus.Ready then
			return nil, FieldObject2_3
		else
			return FieldObject4 == nil or (if type(FieldObject4) == "string" then FieldObject4 == "" else type(FieldObject4) == "table" and next(FieldObject4) == nil)
		end
	elseif FFlagSduiIsEmptyConditions and Type == "is_not_empty" then
		local FieldObject5, FieldObject2_4 = getFieldObject(Value.field)
		
		if FieldObject2_4 and FieldObject2_4 ~= DataStatus.Ready then
			return nil, FieldObject2_4
		else
			return not (FieldObject5 == nil or (if type(FieldObject5) == "string" then FieldObject5 == "" else type(FieldObject5) == "table" and next(FieldObject5) == nil))
		end
	elseif Type == "and_condition" then
		local EvaluateConditionResult = nil
		local EvaluateConditionResult2 = nil
		for _, condition in Value.conditions do
			EvaluateConditionResult, EvaluateConditionResult2 = evaluateCondition(p7, condition, p8, p9, p10)
			
			if EvaluateConditionResult2 and EvaluateConditionResult2 ~= DataStatus.Ready then
				return EvaluateConditionResult, EvaluateConditionResult2
			elseif not EvaluateConditionResult then
				return EvaluateConditionResult
			end
		end
		return true
	elseif Type == "or_condition" then
		local EvaluateConditionResult1 = nil
		local EvaluateConditionResult2_1 = nil
		for _, condition1 in Value.conditions do
			EvaluateConditionResult1, EvaluateConditionResult2_1 = evaluateCondition(p7, condition1, p8, p9, p10)
			
			if EvaluateConditionResult2_1 and EvaluateConditionResult2_1 ~= DataStatus.Ready then
				return EvaluateConditionResult1, EvaluateConditionResult2_1
			elseif EvaluateConditionResult1 or EvaluateConditionResult1 == nil then
				return EvaluateConditionResult1, EvaluateConditionResult2_1
			end
		end
		return false
	end
	return nil
end

local function selectConditionalOption(p11, Options, p12, p13, p14)
	-- upvalues: evaluateCondition (copy), DataStatus (copy)
	local EvaluateConditionResult = nil
	local EvaluateConditionResult2 = nil
	for _, option in Options do
		EvaluateConditionResult, EvaluateConditionResult2 = evaluateCondition(p11, option.condition, p12, p13, p14)
		
		if EvaluateConditionResult then
			return option, EvaluateConditionResult2
		elseif EvaluateConditionResult2 and EvaluateConditionResult2 ~= DataStatus.Ready then
			return EvaluateConditionResult, EvaluateConditionResult2
		end
	end
	return nil
end

local function resolveTablePropValue(p15, p16, List, p17, _, _, _, _, _)
	-- upvalues: FFlagSduiRenderPerf (copy), CryoModule (copy), Frozen1 (copy), DataStatus (copy)
	local JoinResult = if FFlagSduiRenderPerf then CryoModule.Dictionary.join(p17 or Frozen1, p16 or Frozen1) else CryoModule.Dictionary.join(p17 or {}, p16 or {})
	local v2 = nil
	
	if List then
		for i, value in List do
			JoinResult[i] = value(p15).data
			local Status = value(p15).status
			
			if Status and Status ~= DataStatus.Ready then
				v2 = Status
			end
		end
	end
	return JoinResult, v2
end

local function resolveTemplate_legacy(p18, p19)
	if p18 == nil then
		error("Missing roblox_component")
	end
	local TemplateForRobloxComponent = p19.getTemplateForRobloxComponent(p18)
	
	if TemplateForRobloxComponent == nil then
		error(`Could not find template for roblox_component {p18}`)
	end
	return TemplateForRobloxComponent
end

local function resolveTemplate(p20, p21, p22)
	if p21 ~= nil then
		return p21
	end
	if p20 == nil or p20 == "" then
		error("Missing roblox_component")
	end
	local TemplateForRobloxComponent = p22.getTemplateForRobloxComponent(p20)
	
	if TemplateForRobloxComponent == nil then
		error(`Could not find template for roblox_component {p20}`)
	end
	return TemplateForRobloxComponent
end

local function resolveTemplateFromData(p23, p24)
	local InlineComponent = p23.inline_component
	local RobloxComponent = p23.roblox_component
	
	if InlineComponent ~= nil then
		return InlineComponent
	end
	if RobloxComponent == nil or RobloxComponent == "" then
		error("Missing roblox_component")
	end
	local TemplateForRobloxComponent = p24.getTemplateForRobloxComponent(RobloxComponent)
	
	if TemplateForRobloxComponent == nil then
		error(`Could not find template for roblox_component {RobloxComponent}`)
	end
	return TemplateForRobloxComponent
end

return {
	generateStaticPropValue = function(p25, Callback)
		return if Callback then Callback(p25) else p25
	end,
	generateDynamicBindingPropValue = generateDynamicBindingPropValue,
	generateTokenBindingPropValue = function(Text: string, p25, _)
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy), SignalsModule (copy), GetSduiTokensStoreModule (copy), TryGetPathFromDataModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), Frozen (copy), DataStatus (copy), TutilsModule (copy)
		local CurrentComponentType = nil
		local CurrentParserName = nil
		
		if FFlagSduiImprovedErrorDimensions then
			CurrentComponentType = p25.currentComponentType
			CurrentParserName = p25.currentParserName
		end
		local SplitDottedPathModuleResult = if FFlagSduiRenderPerf then SplitDottedPathModule(Text) else string.split(Text, ".")
		
		return SignalsModule.createComputed(function(p26)
			-- upvalues: GetSduiTokensStoreModule (upval), p25 (copy), TryGetPathFromDataModule (upval), SplitDottedPathModuleResult (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref), Frozen (upval), DataStatus (upval)
			local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(GetSduiTokensStoreModule().getTokens(p26, p25.appPage), SplitDottedPathModuleResult)
			
			if TryGetPathFromDataModuleResult then
				return {
					data = TryGetPathFromDataModuleResult2,
					status = DataStatus.Ready
				}
			else
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.TokenBindingFailed, {
					message = `Could not find token with tokenPath {table.concat(SplitDottedPathModuleResult, ".")}`,
					name = p25.debugName,
					componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
					parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
				}, p25.appPage)
				
				return Frozen
			end
		end, TutilsModule.shallowEqual)
	end,
	generateFormatStringPropValue = function(p25, p26, p27, p28, Callback)
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiLocalizedLiterals (copy), FFlagSduiFormatArgFormatters (copy), ApplyFormatArgFormatterFunction (copy), Frozen (copy), generateDynamicBindingPropValue (copy), SignalsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), TutilsModule (copy)
		local CurrentComponentType = nil
		local CurrentParserName = nil
		
		if FFlagSduiImprovedErrorDimensions then
			CurrentComponentType = p27.currentComponentType
			CurrentParserName = p27.currentParserName
		end
		if typeof(p25) ~= "table" then
			error(`Unexpected type for stringFormat {typeof(p25)}`)
		end
		local Str = p25.str
		
		if FFlagSduiLocalizedLiterals and (not Str or Str == "") and p25.translation then
			Str = p27.resolveLocalizedLiteral(p25.translation)
		end
		if not Str or Str == "" then
			error("No format string for prop")
		end
		if not p25.args then
			error(`No args found for format. If no args needed, use literal. {Str}`)
		end
		local t = {}
		local Formatters = {}
		
		for i, arg in p25.args do
			local Type = arg.kind.type
			local Value = arg.kind.value
			
			if Type == "literal" then
				if FFlagSduiFormatArgFormatters and arg.formatter then
					local ApplyFormatArgFormatterResult = ApplyFormatArgFormatterFunction(Value, arg.formatter, p27.appPage)
					
					if ApplyFormatArgFormatterResult == nil then
						return function()
							-- upvalues: Frozen (upval)
							return Frozen
						end
					end
					Str = Str:gsub("{" .. i .. "}", ApplyFormatArgFormatterResult)
				else
					Str = Str:gsub("{" .. i .. "}", (tostring(Value)))
				end
			elseif Type == "binding_path" then
				t[i] = generateDynamicBindingPropValue(Value, p26, p27, p28)
				
				if FFlagSduiFormatArgFormatters and arg.formatter then
					Formatters[i] = arg.formatter
				end
			else
				warn(`Unrecognized argType in buildFormatString {Type}`)
			end
		end
		return SignalsModule.createComputed(function(p29)
			-- upvalues: Str (ref), t (copy), FFlagSduiFormatArgFormatters (upval), Formatters (copy), ApplyFormatArgFormatterFunction (upval), p27 (copy), Frozen (upval), Callback (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref)
			local Text = Str
			local Status = nil
			
			for i, value in t do
				local v3 = value(p29)
				local Data = v3.data
				Status = v3.status
				
				if Data == nil then
					return { status = Status }
				end
				local Formatter = if FFlagSduiFormatArgFormatters and Formatters then Formatters[i] else nil
				
				if Formatter then
					local ApplyFormatArgFormatterResult = ApplyFormatArgFormatterFunction(Data, Formatter, p27.appPage)
					
					if ApplyFormatArgFormatterResult == nil then
						return Frozen
					end
					Text = Text and Text:gsub("{" .. i .. "}", ApplyFormatArgFormatterResult)
				else
					Text = Text and Text:gsub("{" .. i .. "}", (tostring(Data)))
				end
			end
			if not Callback then
				return { data = Text }
			end
			local Success, Result = pcall(function()
				-- upvalues: Callback (upval), Text (ref)
				return Callback(Text)
			end)
			
			if Success then
				return { data = Result }
			else
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					value = Text,
					message = `Parser in formatString for str {Str}`,
					name = p27.debugName,
					componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
					parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
				}, p27.appPage)
				
				return Frozen
			end
		end, TutilsModule.shallowEqual)
	end,
	generateConditionalPropValue = function(p30, p31, p32, p33, p34, Callback, p35, IsNestedComponentConfig)
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), SignalsModule (copy), selectConditionalOption (copy), PropResultCategory (copy), DataStatus (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), Frozen (copy), TutilsModule (copy)
		local CurrentComponentType = nil
		local CurrentParserName = nil
		
		if FFlagSduiImprovedErrorDimensions then
			CurrentComponentType = p32.currentComponentType
			CurrentParserName = p32.currentParserName
		end
		local Options = p30.options
		
		return SignalsModule.createComputed(function(p36)
			-- upvalues: selectConditionalOption (upval), Options (copy), p31 (copy), p32 (copy), p34 (copy), Callback (copy), p33 (copy), p35 (copy), PropResultCategory (upval), DataStatus (upval), IsNestedComponentConfig (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref), Frozen (upval)
			local Success, Result, Result3 = pcall(function()
				-- upvalues: selectConditionalOption (upval), p36 (copy), Options (upval), p31 (upval), p32 (upval), p34 (upval), Callback (upval), p33 (upval), p35 (upval), PropResultCategory (upval), DataStatus (upval)
				local SelectConditionalOptionResult, SelectConditionalOptionResult2 = selectConditionalOption(p36, Options, p31, p32, p34)
				
				if SelectConditionalOptionResult == nil then
					return nil, SelectConditionalOptionResult2
				end
				local DataFunction, CallbackResult2 = Callback(SelectConditionalOptionResult and (SelectConditionalOptionResult.kind and SelectConditionalOptionResult.kind.type), SelectConditionalOptionResult and (SelectConditionalOptionResult.kind and SelectConditionalOptionResult.kind.value), p31, p34, p32, p33, p35)
				
				if CallbackResult2 == PropResultCategory.PropSignal then
					local DataResult = DataFunction(p36)
					DataFunction = DataResult.data
					
					if DataResult.status and DataResult.status ~= DataStatus.Ready then
						SelectConditionalOptionResult2 = DataResult.status
					end
				end
				return DataFunction, SelectConditionalOptionResult2
			end)
			
			if Success then
				return {
					data = Result,
					status = Result3,
					isNestedComponentConfig = IsNestedComponentConfig
				}
			else
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToEvaluateConditionalProp, {
					message = SduiParseHelpersModule.stringifyValue(Result),
					name = p32.debugName,
					componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
					parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
				}, p32.appPage)
				
				return Frozen
			end
		end, TutilsModule.shallowEqual)
	end,
	generateTablePropSignalValue = function(p30, p31, p32, p33, p34, Callback, Callback1)
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), SignalsModule (copy), resolveTablePropValue (copy), FFlagSduiFocusNavActionsStructured (copy), SduiParseHelpersModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), Frozen (copy), TutilsModule (copy)
		local CurrentComponentType = nil
		local CurrentParserName = nil
		
		if FFlagSduiImprovedErrorDimensions then
			CurrentComponentType = p32.currentComponentType
			CurrentParserName = p32.currentParserName
		end
		local CallbackResult, CallbackResult2, CallbackResult3 = Callback(p30, p31, p34, p32, p33)
		
		return SignalsModule.createComputed(function(p35)
			-- upvalues: resolveTablePropValue (upval), CallbackResult (copy), CallbackResult2 (copy), CallbackResult3 (copy), p31 (copy), p32 (copy), p33 (copy), p34 (copy), Callback (copy), FFlagSduiFocusNavActionsStructured (upval), Callback1 (copy), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref), Frozen (upval)
			local Success, Result, Result3 = pcall(function()
				-- upvalues: resolveTablePropValue (upval), p35 (copy), CallbackResult (upval), CallbackResult2 (upval), CallbackResult3 (upval), p31 (upval), p32 (upval), p33 (upval), p34 (upval), Callback (upval)
				local ResolveTablePropValueResult, ResolveTablePropValueResult2 = resolveTablePropValue(p35, CallbackResult, CallbackResult2, CallbackResult3, p31, p32, p33, p34, Callback)
				
				return ResolveTablePropValueResult, ResolveTablePropValueResult2
			end)
			
			if not Success then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = SduiParseHelpersModule.stringifyValue(Result),
					name = p32.debugName,
					componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
					parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
				}, p32.appPage)
				
				return Frozen
			end
			if FFlagSduiFocusNavActionsStructured and Callback1 and Result ~= nil then
				local Success1, Result1 = pcall(function()
					-- upvalues: Callback1 (upval), Result (ref)
					return Callback1(Result)
				end)
				
				if not Success1 then
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						value = SduiParseHelpersModule.stringifyValue(Result),
						message = `Failed to apply propParser to table prop {SduiParseHelpersModule.stringifyValue(Result1)}`,
						name = p32.debugName,
						componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
						parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
					}, p32.appPage)
					
					return Frozen
				end
				Result = Result1
			end
			return { data = Result, status = Result3 }
		end, TutilsModule.shallowEqual)
	end,
	selectConditionalOption = selectConditionalOption,
	evaluateCondition = evaluateCondition,
	resolveHydrationBinding = resolveHydrationBinding,
	resolveBindingPathValue = resolveBindingPathValue,
	resolveTablePropValue = resolveTablePropValue,
	resolveSourceArray = function(p30, Text: string, p31, p32, p33, p34)
		-- upvalues: FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy), resolveBindingPathValue (copy), FFlagSduiClientPageScope (copy)
		return if p30 == "binding_path" then resolveBindingPathValue(p31, if FFlagSduiRenderPerf then SplitDottedPathModule(Text) else string.split(Text, "."), p32, p33, nil, nil, if FFlagSduiClientPageScope then p34 else nil) elseif p30 == "literal" then Text and Text.items else nil
	end,
	resolveFieldMap = function(p30, p31, p32, p33, p34, p35, Callback)
		-- upvalues: resolveTablePropValue (copy)
		local CallbackResult, CallbackResult2 = Callback(p30, p31, p32, p33, p34)
		
		return resolveTablePropValue(p35, CallbackResult, CallbackResult2, nil, p31, p33, p34, p32, nil)
	end,
	mapArrayWithFieldMap = function(List, p30, p31, p32, p33, p34, Callback)
		-- upvalues: BuildDataBindingSourcesForTemplateModule (copy), resolveTablePropValue (copy)
		local List1 = {}
		
		for _, value in List do
			local DataBindingSourcesForTemplateModule = BuildDataBindingSourcesForTemplateModule(value, p30)
			
			local function v143()
				-- upvalues: DataBindingSourcesForTemplateModule (copy)
				return DataBindingSourcesForTemplateModule
			end
			
			local function v144()
				-- upvalues: value (copy)
				return value
			end
			
			local CallbackResult, CallbackResult2 = Callback(p31, v143, v144, p32, p33)
			table.insert(List1, (resolveTablePropValue(p34, CallbackResult, CallbackResult2, nil, v143, p32, p33, v144, nil)))
		end
		return List1
	end,
	isComponentVisible = function(p35, p36): boolean
		return p35.isComponentFilteredSignal == nil or p35.isComponentFilteredSignal(p36).data ~= true
	end,
	resolveTemplate = if FFlagSduiInlineNestedComponentSchema then resolveTemplate else resolveTemplate_legacy,
	resolveTemplateFromData = if FFlagSduiInlineNestedComponentSchema then resolveTemplateFromData else nil
}