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
local FFlagSduiDismissPromptPageScope = require(Parent.SharedFlags).FFlagSduiDismissPromptPageScope
local FFlagSduiFormatStringPercentSafeGsubModule = require(SduiCoreSystem.FFlagSduiFormatStringPercentSafeGsub)
local Frozen = table.freeze({ status = DataStatus.Failed })
local Frozen1 = table.freeze({})

local function resolveHydrationBinding(Entry, p1, p2, p3) --[[ Line: 80 ]]
	-- upvalues: SduiDataBindingContentTypeModule (copy), SduiDataBinderModule (copy)
	local Joined = table.concat(Entry, ".")
	local Entry1 = Entry[1]
	local v1 = p1 and p1[Entry1]
	
	if v1 == nil then
		if SduiDataBindingContentTypeModule[Entry1] ~= nil then
			error(`Could not find data bindingSource for key {Entry1}, bindingPath: {Joined}`)
		end
		return nil, nil
	else
		local ContentType = v1.contentType
		local Id = v1.id
		
		if #Entry < 2 then
			error(`Unsupported path for contentType {ContentType}, bindingPath: {Joined}`)
		end
		local FieldValue, FieldValue2 = SduiDataBinderModule.getFieldValue(ContentType, Entry, Id, p2, v1.fetchIfMissing or p3)
		
		return FieldValue, FieldValue2
	end
end

local function resolveBindingPathValue(p4, Entry, Callback2, Callback, Callback1, p5, p6) --[[ Line: 130 ]]
	-- upvalues: TryGetPathFromDataModule (copy), SduiDataBinderModule (copy), resolveHydrationBinding (copy)
	local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(Callback(p4), Entry)
	
	if TryGetPathFromDataModuleResult and TryGetPathFromDataModuleResult2 ~= nil then
		return if Callback1 then Callback1(TryGetPathFromDataModuleResult2, p4) else TryGetPathFromDataModuleResult2
	end
	local Entry1 = Entry and Entry[1]
	
	if SduiDataBinderModule.isClientContentType(Entry1) then
		local FieldValueForClientContentType = SduiDataBinderModule.getFieldValueForClientContentType(Entry1, Entry, p4, p6)
		
		return if Callback1 and FieldValueForClientContentType ~= nil then Callback1(FieldValueForClientContentType, p4) else FieldValueForClientContentType
	end
	local ResolveHydrationBindingResult, ResolveHydrationBindingResult2 = resolveHydrationBinding(Entry, Callback2(p4), p4, p5)
	
	if Callback1 and ResolveHydrationBindingResult ~= nil then
		ResolveHydrationBindingResult = Callback1(ResolveHydrationBindingResult, p4)
	end
	return ResolveHydrationBindingResult, ResolveHydrationBindingResult2
end

local function generateStaticPropValue(p4, Callback) --[[ Line: 182 ]]
	return if Callback then Callback(p4) else p4
end

local function generateDynamicBindingPropValue(Value, p4, p5, p6, p7, p8) --[[ Line: 206 ]]
	-- upvalues: SplitDottedPathModule (copy), SignalsModule (copy), resolveBindingPathValue (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), Frozen (copy), TutilsModule (copy)
	local CurrentComponentType = p5.currentComponentType
	local CurrentParserName = p5.currentParserName
	local SplitDottedPathModuleResult = SplitDottedPathModule(Value)
	
	if not SplitDottedPathModuleResult or #SplitDottedPathModuleResult == 0 then
		error(`Invalid bindingPath: {Value}`)
	end
	return SignalsModule.createComputed(function(p9) --[[ Line: 222 ]]
		-- upvalues: resolveBindingPathValue (upval), SplitDottedPathModuleResult (copy), p4 (copy), p6 (copy), p7 (copy), p8 (copy), p5 (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), Value (copy), SduiParseHelpersModule (upval), CurrentComponentType (copy), CurrentParserName (copy), Frozen (upval)
		local Success, Result, Result3 = pcall(function() --[[ Line: 223 ]]
			-- upvalues: resolveBindingPathValue (upval), p9 (copy), SplitDottedPathModuleResult (upval), p4 (upval), p6 (upval), p7 (upval), p8 (upval), p5 (upval)
			local ResolveBindingPathValueResult, ResolveBindingPathValueResult2 = resolveBindingPathValue(p9, SplitDottedPathModuleResult, p4, p6, p7, p8, p5)
			
			return ResolveBindingPathValueResult, ResolveBindingPathValueResult2
		end)
		
		if Success then
			return { data = Result, status = Result3 }
		else
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToComputeDynamicBinding, {
				value = Value,
				message = SduiParseHelpersModule.stringifyValue(Result),
				name = p5.debugName,
				componentType = CurrentComponentType,
				parserName = CurrentParserName
			}, p5.appPage)
			
			return Frozen
		end
	end, TutilsModule.shallowEqual)
end

local function generateTokenBindingPropValue(p4, p5, Callback) --[[ Line: 262 ]]
	-- upvalues: SplitDottedPathModule (copy), SignalsModule (copy), GetSduiTokensStoreModule (copy), TryGetPathFromDataModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), Frozen (copy), DataStatus (copy), TutilsModule (copy)
	local CurrentComponentType = p5.currentComponentType
	local CurrentParserName = p5.currentParserName
	local SplitDottedPathModuleResult = SplitDottedPathModule(p4)
	
	return SignalsModule.createComputed(function(p6) --[[ Line: 272 ]]
		-- upvalues: GetSduiTokensStoreModule (upval), p5 (copy), TryGetPathFromDataModule (upval), SplitDottedPathModuleResult (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (copy), CurrentParserName (copy), Frozen (upval), Callback (copy), DataStatus (upval)
		local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(GetSduiTokensStoreModule().getTokens(p6, p5.appPage), SplitDottedPathModuleResult)
		
		if not TryGetPathFromDataModuleResult then
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.TokenBindingFailed, {
				message = `Could not find token with tokenPath {table.concat(SplitDottedPathModuleResult, ".")}`,
				name = p5.debugName,
				componentType = CurrentComponentType,
				parserName = CurrentParserName
			}, p5.appPage)
			
			return Frozen
		end
		if Callback then
			TryGetPathFromDataModuleResult2 = Callback(TryGetPathFromDataModuleResult2)
		end
		return {
			data = TryGetPathFromDataModuleResult2,
			status = DataStatus.Ready
		}
	end, TutilsModule.shallowEqual)
end

local function _(Text: string, Text1, p4): string --[[ Line: 298 | Named "substituteFormatArg" ]]
	return Text:gsub("{" .. Text1 .. "}", function() --[[ Line: 300 ]]
		-- upvalues: p4 (copy)
		return p4
	end)
end

local function generateFormatStringPropValue(p4, p5, p6, p7, Callback) --[[ Line: 326 ]]
	-- upvalues: ApplyFormatArgFormatterFunction (copy), Frozen (copy), FFlagSduiFormatStringPercentSafeGsubModule (copy), generateDynamicBindingPropValue (copy), SignalsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), TutilsModule (copy)
	local CurrentComponentType = p6.currentComponentType
	local CurrentParserName = p6.currentParserName
	
	if typeof(p4) ~= "table" then
		error(`Unexpected type for stringFormat {typeof(p4)}`)
	end
	local Str = p4.str
	
	if (not Str or Str == "") and p4.translation then
		Str = p6.resolveLocalizedLiteral(p4.translation)
	end
	if not Str or Str == "" then
		error("No format string for prop")
	end
	if not p4.args then
		error(`No args found for format. If no args needed, use literal. {Str}`)
	end
	local t = {}
	local Formatters = {}
	
	for i, arg in p4.args do
		local Type = arg.kind.type
		local Value = arg.kind.value
		
		if Type == "literal" then
			if arg.formatter then
				local ApplyFormatArgFormatterResult = ApplyFormatArgFormatterFunction(Value, arg.formatter, p6.appPage)
				
				if ApplyFormatArgFormatterResult == nil then
					return function() --[[ Line: 370 ]]
						-- upvalues: Frozen (upval)
						return Frozen
					end
				end
				if FFlagSduiFormatStringPercentSafeGsubModule then
					Str = Str:gsub("{" .. i .. "}", function() --[[ Line: 300 ]]
						-- upvalues: ApplyFormatArgFormatterResult (copy)
						return ApplyFormatArgFormatterResult
					end)
				else
					Str = Str:gsub("{" .. i .. "}", ApplyFormatArgFormatterResult)
				end
			elseif FFlagSduiFormatStringPercentSafeGsubModule then
				local Text = tostring(Value)
				Str = Str:gsub("{" .. i .. "}", function() --[[ Line: 300 ]]
					-- upvalues: Text (copy)
					return Text
				end)
			else
				Str = Str:gsub("{" .. i .. "}", (tostring(Value)))
			end
		elseif Type == "binding_path" then
			t[i] = generateDynamicBindingPropValue(Value, p5, p6, p7)
			
			if arg.formatter then
				Formatters[i] = arg.formatter
			end
		else
			warn(`Unrecognized argType in buildFormatString {Type}`)
		end
	end
	return SignalsModule.createComputed(function(p8) --[[ Line: 396 ]]
		-- upvalues: Str (ref), t (copy), Formatters (copy), ApplyFormatArgFormatterFunction (upval), p6 (copy), Frozen (upval), FFlagSduiFormatStringPercentSafeGsubModule (upval), Callback (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (copy), CurrentParserName (copy)
		local Text = Str
		local Status = nil
		
		for i, value in t do
			local v2 = value(p8)
			local Data = v2.data
			Status = v2.status
			
			if Data == nil then
				return { status = Status }
			end
			local Formatter = if Formatters then Formatters[i] else nil
			
			if Formatter then
				local ApplyFormatArgFormatterResult = ApplyFormatArgFormatterFunction(Data, Formatter, p6.appPage)
				
				if ApplyFormatArgFormatterResult == nil then
					return Frozen
				end
				if not FFlagSduiFormatStringPercentSafeGsubModule then
					Text = Text and Text:gsub("{" .. i .. "}", ApplyFormatArgFormatterResult)
					continue
				else
					Text = Text and Text:gsub("{" .. i .. "}", function() --[[ Line: 300 ]]
						-- upvalues: ApplyFormatArgFormatterResult (copy)
						return ApplyFormatArgFormatterResult
					end)
					continue
				end
			else
				if not FFlagSduiFormatStringPercentSafeGsubModule then
					Text = Text and Text:gsub("{" .. i .. "}", (tostring(Data)))
					continue
				end
				local Replaced: string = Text
				
				if Replaced then
					local Text1 = tostring(Data)
					Replaced = Text:gsub("{" .. i .. "}", function() --[[ Line: 300 ]]
						-- upvalues: Text1 (copy)
						return Text1
					end)
				end
				Text = Replaced
				continue
			end
		end
		if not Callback then
			return { data = Text }
		end
		local Success, Result = pcall(function() --[[ Line: 429 ]]
			-- upvalues: Callback (upval), Text (ref)
			return Callback(Text)
		end)
		
		if Success then
			return { data = Result }
		else
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
				value = Text,
				message = `Parser in formatString for str {Str}`,
				name = p6.debugName,
				componentType = CurrentComponentType,
				parserName = CurrentParserName
			}, p6.appPage)
			
			return Frozen
		end
	end, TutilsModule.shallowEqual)
end

local function validateNumbers(Op, p9: number?, p10: number?) --[[ Line: 458 ]]
	if typeof(p9) ~= "number" then
		p9 = tonumber(p9)
	end
	if typeof(p10) ~= "number" then
		p10 = tonumber(p10)
	end
	if typeof(p9) ~= "number" or typeof(p10) ~= "number" then
		error(`{Op} without numbers, {p9}: {typeof(p9)}, {p10}: {typeof(p10)}`)
	end
	return p9, p10
end

local _ = function(p9): boolean --[[ Line: 477 | Named "isEmpty" ]]
	return p9 == nil or (if type(p9) == "string" then p9 == "" else type(p9) == "table" and next(p9) == nil)
end

local function isSame(Number, Number1): boolean --[[ Line: 502 ]]
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

local Callback: ((any, any) -> any)? = nil

if FFlagSduiDismissPromptPageScope then
	local function contains(List, Number): boolean --[[ Line: 525 ]]
		-- upvalues: isSame (copy)
		if typeof(List) ~= "table" or typeof(Number) ~= "string" then
			return false
		end
		if List[Number] ~= nil then
			return true
		end
		for i, value in List do
			if typeof(i) == "number" and isSame(value, Number) then
				return true
			end
		end
		return false
	end
	
	Callback = function(p9, Callback) --[[ Line: 545 ]]
		-- upvalues: DataStatus (copy), contains (copy)
		local CallbackResult, CallbackResult2 = Callback(p9.field)
		
		if CallbackResult2 and CallbackResult2 ~= DataStatus.Ready then
			return nil, CallbackResult2
		end
		local Kind = p9.kind
		
		if Kind == nil or Kind.type == nil then
			error("nil target kind in ContainsCondition")
		end
		local v3 = nil
		
		if Kind.type == "string_value" then
			v3 = Kind.value
		elseif Kind.type == "binding_path_value" then
			local CallbackResult2_1
			v3, CallbackResult2_1 = Callback(Kind.value)
			
			if CallbackResult2_1 and CallbackResult2_1 ~= DataStatus.Ready then
				return nil, CallbackResult2_1
			elseif v3 == nil then
				return nil
			end
		else
			error(`Unknown ContainsCondition target kind {Kind.type}`)
		end
		return (contains(CallbackResult, v3))
	end
end
local function evaluateCondition(p9, Condition, p10, p11, p12) --[[ Line: 604 ]]
	-- upvalues: SplitDottedPathModule (copy), resolveBindingPathValue (copy), DataStatus (copy), validateNumbers (copy), isSame (copy), FFlagSduiDismissPromptPageScope (copy), Callback (ref), evaluateCondition (copy)
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
	local function getFieldObject(p13) --[[ Line: 624 ]]
		-- upvalues: SplitDottedPathModule (upval), resolveBindingPathValue (upval), p9 (copy), p10 (copy), p12 (copy), p11 (copy)
		local SplitDottedPathModuleResult = SplitDottedPathModule(p13)
		local Success, Result, Result3 = pcall(function() --[[ Line: 628 ]]
			-- upvalues: resolveBindingPathValue (upval), p9 (upval), SplitDottedPathModuleResult (copy), p10 (upval), p12 (upval), p11 (upval)
			return resolveBindingPathValue(p9, SplitDottedPathModuleResult, p10, p12, nil, true, p11)
		end)
		
		if Success then
			return Result, Result3
		else
			return nil, Result3
		end
	end
	
	if Type == "comparison" then
		local SplitDottedPathModuleResult = SplitDottedPathModule(Value.field)
		local Success, Result, Result3 = pcall(function() --[[ Line: 628 ]]
			-- upvalues: resolveBindingPathValue (upval), p9 (copy), SplitDottedPathModuleResult (copy), p10 (copy), p12 (copy), p11 (copy)
			return resolveBindingPathValue(p9, SplitDottedPathModuleResult, p10, p12, nil, true, p11)
		end)
		local Number = nil
		local Ready = nil
		
		if Success then
			Number = Result
			Ready = Result3
		else
			Number = nil
			Ready = Result3
		end
		if Number == nil or Ready and Ready ~= DataStatus.Ready then
			return nil, Ready
		end
		local Value1 = Value.kind.value
		local Op = Value.op
		
		if Op == "OP_LT" then
			Number, Value1 = validateNumbers(Op, Number, Value1)
			
			return Number < Value1
		end
		if Op == "OP_LTE" then
			Number, Value1 = validateNumbers(Op, Number, Value1)
			
			return Number <= Value1
		end
		if Op == "OP_GT" then
			Number, Value1 = validateNumbers(Op, Number, Value1)
			
			return Value1 < Number
		end
		if Op == "OP_GTE" then
			Number, Value1 = validateNumbers(Op, Number, Value1)
			
			return Value1 <= Number
		end
		if Op == "OP_E" then
			return (isSame(Number, Value1))
		end
		if Op == "OP_NE" then
			return not isSame(Number, Value1)
		end
		error(`Unknown operator for comparison {Op}`)
	elseif Type == "is_null" then
		local SplitDottedPathModuleResult1 = SplitDottedPathModule(Value.field)
		local Success1, Result1, Result3_1 = pcall(function() --[[ Line: 628 ]]
			-- upvalues: resolveBindingPathValue (upval), p9 (copy), SplitDottedPathModuleResult1 (copy), p10 (copy), p12 (copy), p11 (copy)
			return resolveBindingPathValue(p9, SplitDottedPathModuleResult1, p10, p12, nil, true, p11)
		end)
		local Result2 = nil
		local Ready = nil
		
		if Success1 then
			Result2 = Result1
			Ready = Result3_1
		else
			Result2 = nil
			Ready = Result3_1
		end
		if Ready and Ready ~= DataStatus.Ready then
			return nil, Ready
		else
			return Result2 == nil
		end
	elseif Type == "is_not_null" then
		local SplitDottedPathModuleResult2 = SplitDottedPathModule(Value.field)
		local Success2, Result4, Result3_2 = pcall(function() --[[ Line: 628 ]]
			-- upvalues: resolveBindingPathValue (upval), p9 (copy), SplitDottedPathModuleResult2 (copy), p10 (copy), p12 (copy), p11 (copy)
			return resolveBindingPathValue(p9, SplitDottedPathModuleResult2, p10, p12, nil, true, p11)
		end)
		local Result5 = nil
		local Ready = nil
		
		if Success2 then
			Result5 = Result4
			Ready = Result3_2
		else
			Result5 = nil
			Ready = Result3_2
		end
		if Ready and Ready ~= DataStatus.Ready then
			return nil, Ready
		else
			return Result5 ~= nil
		end
	elseif Type == "is_empty" then
		local SplitDottedPathModuleResult3 = SplitDottedPathModule(Value.field)
		local Success3, Result6, Result3_3 = pcall(function() --[[ Line: 628 ]]
			-- upvalues: resolveBindingPathValue (upval), p9 (copy), SplitDottedPathModuleResult3 (copy), p10 (copy), p12 (copy), p11 (copy)
			return resolveBindingPathValue(p9, SplitDottedPathModuleResult3, p10, p12, nil, true, p11)
		end)
		local Result7 = nil
		local Ready = nil
		
		if Success3 then
			Result7 = Result6
			Ready = Result3_3
		else
			Result7 = nil
			Ready = Result3_3
		end
		if Ready and Ready ~= DataStatus.Ready then
			return nil, Ready
		else
			return Result7 == nil or (if type(Result7) == "string" then Result7 == "" else type(Result7) == "table" and next(Result7) == nil)
		end
	elseif Type == "is_not_empty" then
		local SplitDottedPathModuleResult4 = SplitDottedPathModule(Value.field)
		local Success4, Result8, Result3_4 = pcall(function() --[[ Line: 628 ]]
			-- upvalues: resolveBindingPathValue (upval), p9 (copy), SplitDottedPathModuleResult4 (copy), p10 (copy), p12 (copy), p11 (copy)
			return resolveBindingPathValue(p9, SplitDottedPathModuleResult4, p10, p12, nil, true, p11)
		end)
		local Result9 = nil
		local Ready = nil
		
		if Success4 then
			Result9 = Result8
			Ready = Result3_4
		else
			Result9 = nil
			Ready = Result3_4
		end
		if Ready and Ready ~= DataStatus.Ready then
			return nil, Ready
		else
			return not (Result9 == nil or (if type(Result9) == "string" then Result9 == "" else type(Result9) == "table" and next(Result9) == nil))
		end
	else
		if FFlagSduiDismissPromptPageScope and Type == "contains" then
			return Callback(Value, getFieldObject)
		end
		if Type == "and_condition" then
			local EvaluateConditionResult1 = nil
			local EvaluateConditionResult2_1 = nil
			for _, condition in Value.conditions do
				EvaluateConditionResult1, EvaluateConditionResult2_1 = evaluateCondition(p9, condition, p10, p11, p12)
				
				if EvaluateConditionResult2_1 and EvaluateConditionResult2_1 ~= DataStatus.Ready then
					return EvaluateConditionResult1, EvaluateConditionResult2_1
				elseif not EvaluateConditionResult1 then
					return EvaluateConditionResult1
				end
			end
			return true
		elseif Type == "or_condition" then
			local EvaluateConditionResult = nil
			local EvaluateConditionResult2 = nil
			for _, condition1 in Value.conditions do
				EvaluateConditionResult, EvaluateConditionResult2 = evaluateCondition(p9, condition1, p10, p11, p12)
				
				if EvaluateConditionResult2 and EvaluateConditionResult2 ~= DataStatus.Ready then
					return EvaluateConditionResult, EvaluateConditionResult2
				elseif EvaluateConditionResult or EvaluateConditionResult == nil then
					return EvaluateConditionResult, EvaluateConditionResult2
				end
			end
			return false
		end
	end
	return nil
end

local function selectConditionalOption(p13, Options, p14, p15, p16) --[[ Line: 751 ]]
	-- upvalues: evaluateCondition (copy), DataStatus (copy)
	local EvaluateConditionResult = nil
	local EvaluateConditionResult2 = nil
	for _, option in Options do
		EvaluateConditionResult, EvaluateConditionResult2 = evaluateCondition(p13, option.condition, p14, p15, p16)
		
		if EvaluateConditionResult then
			return option, EvaluateConditionResult2
		elseif EvaluateConditionResult2 and EvaluateConditionResult2 ~= DataStatus.Ready then
			return EvaluateConditionResult, EvaluateConditionResult2
		end
	end
	return nil
end

local function resolveTablePropValue(p17, p18, List, p19, _, _, _, _, _) --[[ Line: 852 ]]
	-- upvalues: CryoModule (copy), Frozen1 (copy), DataStatus (copy)
	local JoinResult = CryoModule.Dictionary.join(p19 or Frozen1, p18 or Frozen1)
	local v3 = nil
	
	if List then
		for i, value in List do
			JoinResult[i] = value(p17).data
			local Status = value(p17).status
			
			if Status and Status ~= DataStatus.Ready then
				v3 = Status
			end
		end
	end
	return JoinResult, v3
end

return {
	generateStaticPropValue = generateStaticPropValue,
	generateDynamicBindingPropValue = generateDynamicBindingPropValue,
	generateTokenBindingPropValue = generateTokenBindingPropValue,
	generateFormatStringPropValue = generateFormatStringPropValue,
	generateConditionalPropValue = function(p20, p21, p22, p23, p24, Callback, p25, IsNestedComponentConfig) --[[ Line: 787 ]]
		-- upvalues: SignalsModule (copy), selectConditionalOption (copy), PropResultCategory (copy), DataStatus (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), Frozen (copy), TutilsModule (copy)
		local CurrentComponentType = p22.currentComponentType
		local CurrentParserName = p22.currentParserName
		local Options = p20.options
		
		return SignalsModule.createComputed(function(p26) --[[ Line: 802 ]]
			-- upvalues: selectConditionalOption (upval), Options (copy), p21 (copy), p22 (copy), p24 (copy), Callback (copy), p23 (copy), p25 (copy), PropResultCategory (upval), DataStatus (upval), IsNestedComponentConfig (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), CurrentComponentType (copy), CurrentParserName (copy), Frozen (upval)
			local Success, Result, Result3 = pcall(function() --[[ Line: 803 ]]
				-- upvalues: selectConditionalOption (upval), p26 (copy), Options (upval), p21 (upval), p22 (upval), p24 (upval), Callback (upval), p23 (upval), p25 (upval), PropResultCategory (upval), DataStatus (upval)
				local SelectConditionalOptionResult, SelectConditionalOptionResult2 = selectConditionalOption(p26, Options, p21, p22, p24)
				
				if SelectConditionalOptionResult == nil then
					return nil, SelectConditionalOptionResult2
				end
				local DataFunction, CallbackResult2 = Callback(SelectConditionalOptionResult and (SelectConditionalOptionResult.kind and SelectConditionalOptionResult.kind.type), SelectConditionalOptionResult and (SelectConditionalOptionResult.kind and SelectConditionalOptionResult.kind.value), p21, p24, p22, p23, p25)
				
				if CallbackResult2 == PropResultCategory.PropSignal then
					local DataResult = DataFunction(p26)
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
					name = p22.debugName,
					componentType = CurrentComponentType,
					parserName = CurrentParserName
				}, p22.appPage)
				
				return Frozen
			end
		end, TutilsModule.shallowEqual)
	end,
	generateTablePropSignalValue = function(p20, p21, p22, p23, p24, Callback, Callback1) --[[ Line: 880 ]]
		-- upvalues: SignalsModule (copy), resolveTablePropValue (copy), SduiParseHelpersModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), Frozen (copy), TutilsModule (copy)
		local CurrentComponentType = p22.currentComponentType
		local CurrentParserName = p22.currentParserName
		local CallbackResult, CallbackResult2, CallbackResult3 = Callback(p20, p21, p24, p22, p23)
		
		return SignalsModule.createComputed(function(p25) --[[ Line: 899 ]]
			-- upvalues: resolveTablePropValue (upval), CallbackResult (copy), CallbackResult2 (copy), CallbackResult3 (copy), p21 (copy), p22 (copy), p23 (copy), p24 (copy), Callback (copy), Callback1 (copy), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (copy), CurrentParserName (copy), Frozen (upval)
			local Success, Result, Result3 = pcall(function() --[[ Line: 900 ]]
				-- upvalues: resolveTablePropValue (upval), p25 (copy), CallbackResult (upval), CallbackResult2 (upval), CallbackResult3 (upval), p21 (upval), p22 (upval), p23 (upval), p24 (upval), Callback (upval)
				local ResolveTablePropValueResult, ResolveTablePropValueResult2 = resolveTablePropValue(p25, CallbackResult, CallbackResult2, CallbackResult3, p21, p22, p23, p24, Callback)
				
				return ResolveTablePropValueResult, ResolveTablePropValueResult2
			end)
			
			if not Success then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = SduiParseHelpersModule.stringifyValue(Result),
					name = p22.debugName,
					componentType = CurrentComponentType,
					parserName = CurrentParserName
				}, p22.appPage)
				
				return Frozen
			end
			if Callback1 and Result ~= nil then
				local Success1, Result1 = pcall(function() --[[ Line: 917 ]]
					-- upvalues: Callback1 (upval), Result (ref)
					return Callback1(Result)
				end)
				
				if not Success1 then
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						value = SduiParseHelpersModule.stringifyValue(Result),
						message = `Failed to apply propParser to table prop {SduiParseHelpersModule.stringifyValue(Result1)}`,
						name = p22.debugName,
						componentType = CurrentComponentType,
						parserName = CurrentParserName
					}, p22.appPage)
					
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
	resolveSourceArray = function(p20, p21, p22, p23, p24, p25) --[[ Line: 960 ]]
		-- upvalues: SplitDottedPathModule (copy), resolveBindingPathValue (copy)
		return if p20 == "binding_path" then resolveBindingPathValue(p22, SplitDottedPathModule(p21), p23, p24, nil, nil, p25) elseif p20 == "literal" then p21 and p21.items else nil
	end,
	resolveFieldMap = function(p20, p21, p22, p23, p24, p25, Callback) --[[ Line: 993 ]]
		-- upvalues: resolveTablePropValue (copy)
		local CallbackResult, CallbackResult2 = Callback(p20, p21, p22, p23, p24)
		
		return resolveTablePropValue(p25, CallbackResult, CallbackResult2, nil, p21, p23, p24, p22, nil)
	end,
	mapArrayWithFieldMap = function(List, p20, p21, p22, p23, p24, Callback) --[[ Line: 1033 ]]
		-- upvalues: BuildDataBindingSourcesForTemplateModule (copy), resolveTablePropValue (copy)
		local List1 = {}
		
		for _, value in List do
			local DataBindingSourcesForTemplateModule = BuildDataBindingSourcesForTemplateModule(value, p20)
			
			local function v163() --[[ Line: 1045 ]]
				-- upvalues: DataBindingSourcesForTemplateModule (copy)
				return DataBindingSourcesForTemplateModule
			end
			
			local function v164() --[[ Line: 1048 ]]
				-- upvalues: value (copy)
				return value
			end
			
			local CallbackResult, CallbackResult2 = Callback(p21, v163, v164, p22, p23)
			table.insert(List1, (resolveTablePropValue(p24, CallbackResult, CallbackResult2, nil, v163, p22, p23, v164, nil)))
		end
		return List1
	end,
	isComponentVisible = function(p25, p26): boolean --[[ Line: 1065 ]]
		return p25.isComponentFilteredSignal == nil or p25.isComponentFilteredSignal(p26).data ~= true
	end,
	resolveTemplate = function(p25, p26, p27) --[[ Line: 1101 ]]
		if p26 ~= nil then
			return p26
		end
		if p25 == nil or p25 == "" then
			error("Missing roblox_component")
		end
		local TemplateForRobloxComponent = p27.getTemplateForRobloxComponent(p25)
		
		if TemplateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p25}`)
		end
		return TemplateForRobloxComponent
	end,
	resolveTemplateFromData = function(p28, p29) --[[ Line: 1126 ]]
		local InlineComponent = p28.inline_component
		local RobloxComponent = p28.roblox_component
		
		if InlineComponent ~= nil then
			return InlineComponent
		end
		if RobloxComponent == nil or RobloxComponent == "" then
			error("Missing roblox_component")
		end
		local TemplateForRobloxComponent = p29.getTemplateForRobloxComponent(RobloxComponent)
		
		if TemplateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {RobloxComponent}`)
		end
		return TemplateForRobloxComponent
	end
}