local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.ServiceContractsProto)
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local tutilsModule = require(parent.tutils)
local sduiDataBinderModule = require(sduiCoreSystem.ClientBinding.SduiDataBinder)
local tryGetPathFromDataModule = require(sduiCoreSystem.ClientBinding.tryGetPathFromData)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local buildDataBindingSourcesForTemplateModule = require(sduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local sduiClientBindingTypesModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiDataBindingContentTypeModule = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local getSduiTokensStoreModule = require(sduiCoreSystem.ClientBinding.getSduiTokensStore)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local sduiParsersModule = require(sduiCoreSystem.SduiParsers)
local _ = require(sduiCoreSystem.SduiComponentType)
local propResultCategory = sduiClientBindingTypesModule.PropResultCategory
local applyFormatArgFormatter = require(sduiCoreSystem.ClientBinding.PropBuilder.applyFormatArgFormatter).applyFormatArgFormatter
local dataStatus = dataHydrationModule.DataHydrationTypes.DataStatus
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiFormatArgFormatters = require(parent.SharedFlags).FFlagSduiFormatArgFormatters
local fFlagSduiInlineNestedComponentSchema = require(parent.SharedFlags).FFlagSduiInlineNestedComponentSchema
local fFlagSduiIsEmptyConditions = require(parent.SharedFlags).FFlagSduiIsEmptyConditions
local fFlagSduiHydrationFetchIfMissing = require(parent.SharedFlags).FFlagSduiHydrationFetchIfMissing
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope
local fFlagLuaAppSduiColorPropMigration = require(parent.SharedFlags).FFlagLuaAppSduiColorPropMigration
local fFlagSduiFocusNavActionsStructured = require(parent.SharedFlags).FFlagSduiFocusNavActionsStructured
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf
local sduiPropBuilderSupportNilHydration = game:DefineFastFlag("SduiPropBuilderSupportNilHydration", false)
local frozen = table.freeze({ status = dataStatus.Failed })
local frozen_1 = table.freeze({})

local function resolveHydrationBinding(p0, p1, p2, p3) --[[ line: 88 ]]
	-- upvalues: sduiPropBuilderSupportNilHydration (ref), sduiDataBindingContentTypeModule (ref), fFlagSduiHydrationFetchIfMissing (ref), sduiDataBinderModule (ref)
	local joined = table.concat(p0, ".")
	local var31 = p0[1]
	local var32 = p1 and p1[var31]
	
	if var32 == nil then
		if sduiPropBuilderSupportNilHydration then
			if sduiDataBindingContentTypeModule[var31] ~= nil then
				error(`Could not find data bindingSource for key {var31}, bindingPath: {joined}`)
			end
			return nil, nil
		else
			error(`Could not find data bindingSource for key {var31}, bindingPath: {joined}`)
		end
	end
	local contentType = var32.contentType
	local id = var32.id
	
	if #p0 < 2 then
		error(`Unsupported path for contentType {contentType}, bindingPath: {joined}`)
	end
	local fieldValue, fieldValue_1 = sduiDataBinderModule.getFieldValue(contentType, p0, id, p2, if fFlagSduiHydrationFetchIfMissing then var32.fetchIfMissing or p3 else p3)
	
	return fieldValue, fieldValue_1
end

local function resolveBindingPathValue(p4, p5, p6, p7, p8, p9, p10) --[[ line: 144 ]]
	-- upvalues: tryGetPathFromDataModule (ref), sduiDataBinderModule (ref), fFlagSduiClientPageScope (ref), resolveHydrationBinding (ref), fFlagSduiRenderPerf (ref), sduiParseHelpersModule (ref)
	local var35, var36 = tryGetPathFromDataModule(p7(p4), p5)
	
	if var35 and var36 ~= nil then
		return if p8 then p8(var36, p4) else var36
	end
	local var37 = p5 and p5[1]
	
	if sduiDataBinderModule.isClientContentType(var37) then
		local fieldValueForClientContentType = sduiDataBinderModule.getFieldValueForClientContentType(var37, p5, p4, if fFlagSduiClientPageScope then p10 else nil)
		
		return if p8 and fieldValueForClientContentType ~= nil then p8(fieldValueForClientContentType, p4) else fieldValueForClientContentType
	end
	local var38, var39 = resolveHydrationBinding(p5, p6(p4), p4, p9)
	
	if p8 and var38 ~= nil then
		if fFlagSduiRenderPerf then
			var38 = p8(var38, p4)
		else
			local ok, status = pcall(function() --[[ line: 190 ]]
				-- upvalues: p8 (ref), var38 (write), p4 (ref)
				return p8(var38, p4)
			end)
			
			if not ok then
				error(`Parser failed for bindingPath: {table.concat(p5, ".")}. err{sduiParseHelpersModule.stringifyValue(status)}`)
			end
			var38 = status
		end
	end
	return var38, var39
end

local function generateStaticPropValue(p11, p12) --[[ line: 212 ]]
	return if p12 then p12(p11) else p11
end

local function generateDynamicBindingPropValue(p13, p14, p15, p16, p17, p18) --[[ line: 236 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), signalsModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p15.currentComponentType
		currentParserName = p15.currentParserName
	end
	local var41 = if fFlagSduiRenderPerf then splitDottedPathModule(p13) else string.split(p13, ".")
	
	if not var41 or #var41 == 0 then
		error(`Invalid bindingPath: {p13}`)
	end
	return signalsModule.createComputed(function(p19) --[[ line: 258 ]]
		-- upvalues: resolveBindingPathValue (copy), var41 (ref), p14 (ref), p16 (ref), p17 (ref), p18 (ref), fFlagSduiClientPageScope (copy), p15 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p13 (ref), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
		local ok, status, var42 = pcall(function() --[[ line: 259 ]]
			-- upvalues: resolveBindingPathValue (copy), p19 (ref), var41 (copy), p14 (copy), p16 (copy), p17 (copy), p18 (copy), fFlagSduiClientPageScope (copy), p15 (copy)
			local var43, var44 = resolveBindingPathValue(p19, var41, p14, p16, p17, p18, if fFlagSduiClientPageScope then p15 else nil)
			
			return var43, var44
		end)
		
		if ok then
			return { data = status, status = var42 }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToComputeDynamicBinding, {
			value = p13,
			message = sduiParseHelpersModule.stringifyValue(status),
			name = p15.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p15.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function generateTokenBindingPropValue(p20, p21, p22) --[[ line: 298 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), signalsModule (ref), getSduiTokensStoreModule (ref), tryGetPathFromDataModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), fFlagLuaAppSduiColorPropMigration (ref), dataStatus (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p21.currentComponentType
		currentParserName = p21.currentParserName
	end
	local var45 = if fFlagSduiRenderPerf then splitDottedPathModule(p20) else string.split(p20, ".")
	
	return signalsModule.createComputed(function(p23) --[[ line: 314 ]]
		-- upvalues: getSduiTokensStoreModule (copy), p21 (ref), tryGetPathFromDataModule (copy), var45 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy), fFlagLuaAppSduiColorPropMigration (copy), p22 (ref), dataStatus (copy)
		local var46, var47 = tryGetPathFromDataModule(getSduiTokensStoreModule().getTokens(p23, p21.appPage), var45)
		
		if not var46 then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.TokenBindingFailed, {
				message = `Could not find token with tokenPath {table.concat(var45, ".")}`,
				name = p21.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p21.appPage)
			
			return frozen
		elseif fFlagLuaAppSduiColorPropMigration and p22 then
			var47 = p22(var47)
		end
		return { data = var47, status = dataStatus.Ready }
	end, tutilsModule.shallowEqual)
end

local function generateFormatStringPropValue(p24, p25, p26, p27, p28) --[[ line: 361 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiFormatArgFormatters (ref), applyFormatArgFormatter (ref), frozen (ref), generateDynamicBindingPropValue (ref), signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p26.currentComponentType
		currentParserName = p26.currentParserName
	end
	if typeof(p24) ~= "table" then
		error(`Unexpected type for stringFormat {typeof(p24)}`)
	end
	local str = p24.str
	
	if (not str or str == "") and p24.translation then
		str = p26.resolveLocalizedLiteral(p24.translation)
	end
	if not str or str == "" then
		error("No format string for prop")
	end
	if not p24.args then
		error(`No args found for format. If no args needed, use literal. {str}`)
	end
	local value
	local t = {}
	local t_1 = {}
	
	for i, v in p24.args do
		local type = v.kind.type
		value = v.kind.value
		
		if type == "literal" then
			if fFlagSduiFormatArgFormatters and v.formatter then
				local var50 = applyFormatArgFormatter(value, v.formatter, p26.appPage)
				
				if var50 ~= nil then
					str = str:gsub("{" .. i .. "}", var50)
					continue
				end
				return function() --[[ line: 409 ]]
					-- upvalues: frozen (copy)
					return frozen
				end
			else
				str = str:gsub("{" .. i .. "}", tostring(value))
			end
		elseif type == "binding_path" then
			t[i] = generateDynamicBindingPropValue(value, p25, p26, p27)
			
			if fFlagSduiFormatArgFormatters and v.formatter then
				t_1[i] = v.formatter
			end
		else
			warn(`Unrecognized argType in buildFormatString {type}`)
		end
	end
	return signalsModule.createComputed(function(p29) --[[ line: 427 ]]
		-- upvalues: str (write), t (ref), fFlagSduiFormatArgFormatters (copy), t_1 (ref), applyFormatArgFormatter (copy), p26 (ref), frozen (copy), p28 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
		local var51 = str
		
		for i, v in t do
			local var52 = v(p29)
			local data = var52.data
			local status = var52.status
			
			if data ~= nil then
				local var54
				local var53 = if fFlagSduiFormatArgFormatters and t_1 then t_1[i] else nil
				
				if var53 then
					var54 = applyFormatArgFormatter(data, var53, p26.appPage)
					
					if var54 ~= nil then
						var51 = var51 and var51:gsub("{" .. i .. "}", var54)
					end
					return frozen
				else
					var54 = var51 and var51:gsub("{" .. i .. "}", tostring(data))
					var51 = var54
				end
			end
			return { status = status }
		end
		if not p28 then
			return { data = var51 }
		end
		local ok, status = pcall(function() --[[ line: 454 ]]
			-- upvalues: p28 (copy), var51 (write)
			return p28(var51)
		end)
		
		if ok then
			return { data = status }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			value = var51,
			message = `Parser in formatString for str {str}`,
			name = p26.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p26.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function validateNumbers(p30, p31, p32) --[[ line: 483 ]]
	if typeof(p31) ~= "number" then
		p31 = tonumber(p31)
	end
	if typeof(p32) ~= "number" then
		p32 = tonumber(p32)
	end
	if typeof(p31) ~= "number" or typeof(p32) ~= "number" then
		error(`{p30} without numbers, {p31}: {typeof(p31)}, {p32}: {typeof(p32)}`)
	end
	return p31, p32
end

local function _(p33) --[[ line: 502 | named "isEmpty" ]]
	return p33 == nil or (if type(p33) == "string" then p33 == "" else type(p33) == "table" and next(p33) == nil)
end

local function isSame(p34, p35) --[[ line: 527 ]]
	-- upvalues: sduiParsersModule (ref)
	if p34 == p35 then
		return true
	elseif p34 == nil then
		return false
	end
	local var55 = typeof(p35)
	
	if typeof(p34) ~= var55 then
		if var55 == "string" then
			p34 = tostring(p34)
		elseif var55 == "number" then
			p34 = tonumber(p34)
		elseif var55 == "boolean" then
			p34 = sduiParsersModule.parseBooleanProp_(p34, nil, nil)
		end
	end
	return p34 == p35
end

local function evaluateCondition(p36, p37, p38, p39, p40) --[[ line: 571 ]]
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), dataStatus (ref), validateNumbers (ref), isSame (ref), fFlagSduiIsEmptyConditions (ref), evaluateCondition (ref)
	if p37 == nil then
		return true
	end
	local type = p37 and (p37.kind and p37.kind.type)
	local value = p37 and (p37.kind and p37.kind.value)
	
	if type == nil then
		error("nil conditionType in condition")
	end
	if value == nil then
		error("nil conditionValue in condition")
	end
	local var76, var77
	local function getFieldObject(p41) --[[ line: 591 ]]
		-- upvalues: fFlagSduiRenderPerf (copy), splitDottedPathModule (copy), resolveBindingPathValue (copy), p36 (ref), p38 (ref), p40 (ref), fFlagSduiClientPageScope (copy), p39 (ref)
		local var80 = if fFlagSduiRenderPerf then splitDottedPathModule(p41) else string.split(p41, ".")
		local ok, status, var81 = pcall(function() --[[ line: 597 ]]
			-- upvalues: resolveBindingPathValue (copy), p36 (copy), var80 (ref), p38 (copy), p40 (copy), fFlagSduiClientPageScope (copy), p39 (copy)
			return resolveBindingPathValue(p36, var80, p38, p40, nil, true, if fFlagSduiClientPageScope then p39 else nil)
		end)
		
		if ok then
			return status, var81
		end
		return nil, var81
	end
	
	if type == "comparison" then
		local var59, var60 = getFieldObject(value.field)
		
		if var59 == nil or var60 and var60 ~= dataStatus.Ready then
			return nil, var60
		end
		local value_1 = value.kind.value
		local op = value.op
		
		if op == "OP_LT" then
			local var61, var62 = validateNumbers(op, var59, value_1)
			var59 = var61
			value_1 = var62
			
			return var59 < value_1
		elseif op == "OP_LTE" then
			local var63, var64 = validateNumbers(op, var59, value_1)
			var59 = var63
			value_1 = var64
			
			return var59 <= value_1
		elseif op == "OP_GT" then
			local var65, var66 = validateNumbers(op, var59, value_1)
			var59 = var65
			value_1 = var66
			
			return value_1 < var59
		elseif op == "OP_GTE" then
			local var67, var68 = validateNumbers(op, var59, value_1)
			var59 = var67
			value_1 = var68
			
			return value_1 <= var59
		elseif op == "OP_E" then
			return isSame(var59, value_1)
		elseif op == "OP_NE" then
			return not isSame(var59, value_1)
		end
		error(`Unknown operator for comparison {op}`)
	elseif type == "is_null" then
		local var69, var70 = getFieldObject(value.field)
		
		if var70 and var70 ~= dataStatus.Ready then
			return nil, var70
		end
		return var69 == nil
	elseif type == "is_not_null" then
		local var71, var72 = getFieldObject(value.field)
		
		if var72 and var72 ~= dataStatus.Ready then
			return nil, var72
		end
		return var71 ~= nil
	elseif fFlagSduiIsEmptyConditions and type == "is_empty" then
		local var78, var79 = getFieldObject(value.field)
		
		if var79 and var79 ~= dataStatus.Ready then
			return nil, var79
		end
		return var78 == nil or (if type(var78) == "string" then var78 == "" else type(var78) == "table" and next(var78) == nil)
	elseif fFlagSduiIsEmptyConditions and type == "is_not_empty" then
		local var75
		local var73, var74 = getFieldObject(value.field)
		
		if var74 and var74 ~= dataStatus.Ready then
			return nil, var74
		elseif var73 == nil then
			var75 = true
		elseif type(var73) == "string" then
			local _ = var73 == ""
		elseif type(var73) == "table" then
			var75 = next(var73) == nil
			var75 = nil
		else
			var75 = false
		end
		return not var75
	elseif type == "and_condition" then
		for i, v in value.conditions do
			var76, var77 = evaluateCondition(p36, v, p38, p39, p40)
			
			if not var77 or var77 == dataStatus.Ready then
				if not var76 then
					return var76
				end
			end
			return var76, var77
		end
		return true
	elseif type ~= "or_condition" then
		return nil
	end
	for i, v in value.conditions do
		var76, var77 = evaluateCondition(p36, v, p38, p39, p40)
		
		if not var77 or var77 == dataStatus.Ready then
			if var76 or var76 == nil then
				return var76, var77
			end
		end
		return var76, var77
	end
	return false
end

local function selectConditionalOption(p42, p43, p44, p45, p46) --[[ line: 718 ]]
	-- upvalues: evaluateCondition (ref), dataStatus (ref)
	for i, v in p43 do
		local var82, var83 = evaluateCondition(p42, v.condition, p44, p45, p46)
		
		if not var82 then
			if var83 and var83 ~= dataStatus.Ready then
				return var82, var83
			end
		end
		return v, var83
	end
	return nil
end

local function resolveTablePropValue(p47, p48, p49, p50, _, _, _, _, _) --[[ line: 823 ]]
	-- upvalues: fFlagSduiRenderPerf (ref), cryoModule (ref), frozen_1 (ref), dataStatus (ref)
	local join
	if fFlagSduiRenderPerf then
		join = cryoModule.Dictionary.join
		join = join(p50 or frozen_1, p48 or frozen_1)
	else
		join = cryoModule.Dictionary.join
		join = join(p50 or {}, p48 or {})
	end
	local var84 = nil
	
	if p49 then
		for i, v in p49 do
			join[i] = v(p47).data
			local status = v(p47).status
			
			if status and status ~= dataStatus.Ready then
				var84 = status
			end
		end
	end
	return join, var84
end

return {
	generateStaticPropValue = generateStaticPropValue,
	generateDynamicBindingPropValue = generateDynamicBindingPropValue,
	generateTokenBindingPropValue = generateTokenBindingPropValue,
	generateFormatStringPropValue = generateFormatStringPropValue,
	generateConditionalPropValue = function(p51, p52, p53, p54, p55, p56, p57, p58) --[[ line: 754 ]]
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), selectConditionalOption (ref), propResultCategory (ref), dataStatus (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p53.currentComponentType
			currentParserName = p53.currentParserName
		end
		local options = p51.options
		
		return signalsModule.createComputed(function(p59) --[[ line: 773 ]]
			-- upvalues: selectConditionalOption (copy), options (ref), p52 (ref), p53 (ref), p55 (ref), p56 (ref), p54 (ref), p57 (ref), propResultCategory (copy), dataStatus (copy), p58 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var85 = pcall(function() --[[ line: 774 ]]
				-- upvalues: selectConditionalOption (copy), p59 (ref), options (copy), p52 (copy), p53 (copy), p55 (copy), p56 (copy), p54 (copy), p57 (copy), propResultCategory (copy), dataStatus (copy)
				local var86, var87 = selectConditionalOption(p59, options, p52, p53, p55)
				
				if var86 == nil then
					return nil, var87
				end
				local var88, var89 = p56(var86 and (var86.kind and var86.kind.type), var86 and (var86.kind and var86.kind.value), p52, p55, p53, p54, p57)
				
				if var89 == propResultCategory.PropSignal then
					local var90 = var88(p59)
					var88 = var90.data
					
					if var90.status and var90.status ~= dataStatus.Ready then
						var87 = var90.status
					end
				end
				return var88, var87
			end)
			
			if ok then
				return {
					data = status,
					status = var85,
					isNestedComponentConfig = p58
				}
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToEvaluateConditionalProp, {
				message = sduiParseHelpersModule.stringifyValue(status),
				name = p53.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p53.appPage)
			
			return frozen
		end, tutilsModule.shallowEqual)
	end,
	generateTablePropSignalValue = function(value, p60, p61, p62, p63, p64, p65) --[[ line: 853 ]]
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), resolveTablePropValue (ref), fFlagSduiFocusNavActionsStructured (ref), sduiParseHelpersModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p61.currentComponentType
			currentParserName = p61.currentParserName
		end
		local var91, var92, var93 = p64(value, p60, p63, p61, p62)
		
		return signalsModule.createComputed(function(p66) --[[ line: 876 ]]
			-- upvalues: resolveTablePropValue (copy), var91 (ref), var92 (ref), var93 (ref), p60 (ref), p61 (ref), p62 (ref), p63 (ref), p64 (ref), fFlagSduiFocusNavActionsStructured (copy), p65 (ref), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var94 = pcall(function() --[[ line: 877 ]]
				-- upvalues: resolveTablePropValue (copy), p66 (ref), var91 (copy), var92 (copy), var93 (copy), p60 (copy), p61 (copy), p62 (copy), p63 (copy), p64 (copy)
				local var95, var96 = resolveTablePropValue(p66, var91, var92, var93, p60, p61, p62, p63, p64)
				
				return var95, var96
			end)
			
			if not ok then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = sduiParseHelpersModule.stringifyValue(status),
					name = p61.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
				}, p61.appPage)
				
				return frozen
			elseif fFlagSduiFocusNavActionsStructured and p65 and status ~= nil then
				local ok_1, status_1 = pcall(function() --[[ line: 894 ]]
					-- upvalues: p65 (copy), status (write)
					return p65(status)
				end)
				
				if not ok_1 then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
						value = sduiParseHelpersModule.stringifyValue(status),
						message = `Failed to apply propParser to table prop {sduiParseHelpersModule.stringifyValue(status_1)}`,
						name = p61.debugName,
						componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
						parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
					}, p61.appPage)
					
					return frozen
				end
				status = status_1
			end
			return { data = status, status = var94 }
		end, tutilsModule.shallowEqual)
	end,
	selectConditionalOption = selectConditionalOption,
	evaluateCondition = evaluateCondition,
	resolveHydrationBinding = resolveHydrationBinding,
	resolveBindingPathValue = resolveBindingPathValue,
	resolveTablePropValue = resolveTablePropValue,
	resolveSourceArray = function(p67, p68, p69, p70, p71, p72) --[[ line: 937 ]]
		-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref)
		return if p67 == "binding_path" then resolveBindingPathValue(p69, if fFlagSduiRenderPerf then splitDottedPathModule(p68) else string.split(p68, "."), p70, p71, nil, nil, if fFlagSduiClientPageScope then p72 else nil) elseif p67 == "literal" then p68 and p68.items else nil
	end,
	resolveFieldMap = function(p73, p74, p75, p76, p77, p78, p79) --[[ line: 980 ]]
		-- upvalues: resolveTablePropValue (ref)
		local var97, var98 = p79(p73, p74, p75, p76, p77)
		
		return resolveTablePropValue(p78, var97, var98, nil, p74, p76, p77, p75, nil)
	end,
	mapArrayWithFieldMap = function(p80, p81, p82, p83, p84, p85, p86) --[[ line: 1020 ]]
		-- upvalues: buildDataBindingSourcesForTemplateModule (ref), resolveTablePropValue (ref)
		local t = {}
		
		for i, v in p80 do
			local var100 = buildDataBindingSourcesForTemplateModule(v, p81)
			
			local var101 = function() --[[ line: 1032 ]]
				-- upvalues: var100 (ref)
				return var100
			end
			
			local var102 = function() --[[ line: 1035 ]]
				-- upvalues: v (ref)
				return v
			end
			
			local var103, var104 = p86(p82, var101, var102, p83, p84)
			table.insert(t, resolveTablePropValue(p85, var103, var104, nil, var101, p83, p84, var102, nil))
		end
		return t
	end,
	isComponentVisible = function(p87, p88) --[[ line: 1052 ]]
		return p87.isComponentFilteredSignal == nil or p87.isComponentFilteredSignal(p88).data ~= true
	end,
	resolveTemplate = if fFlagSduiInlineNestedComponentSchema then function(p91, p92, p93) --[[ line: 1098 | named "resolveTemplate" ]]
		if p92 ~= nil then
			return p92
		elseif p91 == nil or p91 == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p93.getTemplateForRobloxComponent(p91)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p91}`)
		end
		return templateForRobloxComponent
	end else function(p89, p90) --[[ line: 1065 | named "resolveTemplate_legacy" ]]
		if p89 == nil then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p90.getTemplateForRobloxComponent(p89)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p89}`)
		end
		return templateForRobloxComponent
	end,
	resolveTemplateFromData = if fFlagSduiInlineNestedComponentSchema then function(p94, p95) --[[ line: 1123 | named "resolveTemplateFromData" ]]
		local inlineComponent = p94.inline_component
		local robloxComponent = p94.roblox_component
		
		if inlineComponent ~= nil then
			return inlineComponent
		elseif robloxComponent == nil or robloxComponent == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p95.getTemplateForRobloxComponent(robloxComponent)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {robloxComponent}`)
		end
		return templateForRobloxComponent
	end else nil
}