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
local _ = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
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
local fFlagSduiLocalizedLiterals = require(parent.SharedFlags).FFlagSduiLocalizedLiterals
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiFormatArgFormatters = require(parent.SharedFlags).FFlagSduiFormatArgFormatters
local fFlagSduiInlineNestedComponentSchema = require(parent.SharedFlags).FFlagSduiInlineNestedComponentSchema
local fFlagSduiIsEmptyConditions = require(parent.SharedFlags).FFlagSduiIsEmptyConditions
local fFlagSduiHydrationFetchIfMissing = require(parent.SharedFlags).FFlagSduiHydrationFetchIfMissing
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope
local fFlagSduiFocusNavActionsStructured = require(parent.SharedFlags).FFlagSduiFocusNavActionsStructured
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf
local frozen = table.freeze({ status = dataStatus.Failed })
local frozen_1 = table.freeze({})

local function resolveHydrationBinding(p0, p1, p2, p3) --[[ line: 86 ]]
	-- upvalues: fFlagSduiHydrationFetchIfMissing (ref), sduiDataBinderModule (ref)
	local joined = table.concat(p0, ".")
	local var29 = p0[1]
	local var30 = p1 and p1[var29]
	
	if var30 == nil then
		error(`Could not find data bindingSource for key {var29}, bindingPath: {joined}`)
	end
	local contentType = var30.contentType
	local id = var30.id
	
	if #p0 < 2 then
		error(`Unsupported path for contentType {contentType}, bindingPath: {joined}`)
	end
	local fieldValue, fieldValue_1 = sduiDataBinderModule.getFieldValue(contentType, p0, id, p2, if fFlagSduiHydrationFetchIfMissing then var30.fetchIfMissing or p3 else p3)
	
	return fieldValue, fieldValue_1
end

local function resolveBindingPathValue(p4, p5, p6, p7, p8, p9, p10) --[[ line: 134 ]]
	-- upvalues: tryGetPathFromDataModule (ref), sduiDataBinderModule (ref), fFlagSduiClientPageScope (ref), resolveHydrationBinding (ref), fFlagSduiRenderPerf (ref), sduiParseHelpersModule (ref)
	local var33, var34 = tryGetPathFromDataModule(p7(p4), p5)
	
	if var33 and var34 ~= nil then
		return if p8 then p8(var34, p4) else var34
	end
	local var35 = p5 and p5[1]
	
	if sduiDataBinderModule.isClientContentType(var35) then
		local fieldValueForClientContentType = sduiDataBinderModule.getFieldValueForClientContentType(var35, p5, p4, if fFlagSduiClientPageScope then p10 else nil)
		
		return if p8 and fieldValueForClientContentType ~= nil then p8(fieldValueForClientContentType, p4) else fieldValueForClientContentType
	end
	local var36, var37 = resolveHydrationBinding(p5, p6(p4), p4, p9)
	
	if p8 and var36 ~= nil then
		if fFlagSduiRenderPerf then
			var36 = p8(var36, p4)
		else
			local ok, status = pcall(function() --[[ line: 180 ]]
				-- upvalues: p8 (ref), var36 (write), p4 (ref)
				return p8(var36, p4)
			end)
			
			if not ok then
				error(`Parser failed for bindingPath: {table.concat(p5, ".")}. err{sduiParseHelpersModule.stringifyValue(status)}`)
			end
			var36 = status
		end
	end
	return var36, var37
end

local function generateStaticPropValue(p11, p12) --[[ line: 202 ]]
	return if p12 then p12(p11) else p11
end

local function generateDynamicBindingPropValue(p13, p14, p15, p16, p17, p18) --[[ line: 226 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), signalsModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p15.currentComponentType
		currentParserName = p15.currentParserName
	end
	local var39 = if fFlagSduiRenderPerf then splitDottedPathModule(p13) else string.split(p13, ".")
	
	if not var39 or #var39 == 0 then
		error(`Invalid bindingPath: {p13}`)
	end
	return signalsModule.createComputed(function(p19) --[[ line: 248 ]]
		-- upvalues: resolveBindingPathValue (copy), var39 (ref), p14 (ref), p16 (ref), p17 (ref), p18 (ref), fFlagSduiClientPageScope (copy), p15 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p13 (ref), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
		local ok, status, var40 = pcall(function() --[[ line: 249 ]]
			-- upvalues: resolveBindingPathValue (copy), p19 (ref), var39 (copy), p14 (copy), p16 (copy), p17 (copy), p18 (copy), fFlagSduiClientPageScope (copy), p15 (copy)
			local var41, var42 = resolveBindingPathValue(p19, var39, p14, p16, p17, p18, if fFlagSduiClientPageScope then p15 else nil)
			
			return var41, var42
		end)
		
		if ok then
			return { data = status, status = var40 }
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

local function generateTokenBindingPropValue(p20, p21, _) --[[ line: 288 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), signalsModule (ref), getSduiTokensStoreModule (ref), tryGetPathFromDataModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), dataStatus (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p21.currentComponentType
		currentParserName = p21.currentParserName
	end
	local var43 = if fFlagSduiRenderPerf then splitDottedPathModule(p20) else string.split(p20, ".")
	
	return signalsModule.createComputed(function(p22) --[[ line: 304 ]]
		-- upvalues: getSduiTokensStoreModule (copy), p21 (ref), tryGetPathFromDataModule (copy), var43 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy), dataStatus (copy)
		local var44, var45 = tryGetPathFromDataModule(getSduiTokensStoreModule().getTokens(p22, p21.appPage), var43)
		
		if var44 then
			return { data = var45, status = dataStatus.Ready }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.TokenBindingFailed, {
			message = `Could not find token with tokenPath {table.concat(var43, ".")}`,
			name = p21.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p21.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function generateFormatStringPropValue(p23, p24, p25, p26, p27) --[[ line: 347 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiLocalizedLiterals (ref), fFlagSduiFormatArgFormatters (ref), applyFormatArgFormatter (ref), frozen (ref), generateDynamicBindingPropValue (ref), signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p25.currentComponentType
		currentParserName = p25.currentParserName
	end
	if typeof(p23) ~= "table" then
		error(`Unexpected type for stringFormat {typeof(p23)}`)
	end
	local str = p23.str
	
	if fFlagSduiLocalizedLiterals and (not str or str == "") and p23.translation then
		str = p25.resolveLocalizedLiteral(p23.translation)
	end
	if not str or str == "" then
		error("No format string for prop")
	end
	if not p23.args then
		error(`No args found for format. If no args needed, use literal. {str}`)
	end
	local value
	local t = {}
	local t_1 = {}
	
	for i, v in p23.args do
		local type = v.kind.type
		value = v.kind.value
		
		if type == "literal" then
			if fFlagSduiFormatArgFormatters and v.formatter then
				local var48 = applyFormatArgFormatter(value, v.formatter, p25.appPage)
				
				if var48 ~= nil then
					str = str:gsub("{" .. i .. "}", var48)
					continue
				end
				return function() --[[ line: 395 ]]
					-- upvalues: frozen (copy)
					return frozen
				end
			else
				str = str:gsub("{" .. i .. "}", tostring(value))
			end
		elseif type == "binding_path" then
			t[i] = generateDynamicBindingPropValue(value, p24, p25, p26)
			
			if fFlagSduiFormatArgFormatters and v.formatter then
				t_1[i] = v.formatter
			end
		else
			warn(`Unrecognized argType in buildFormatString {type}`)
		end
	end
	return signalsModule.createComputed(function(p28) --[[ line: 413 ]]
		-- upvalues: str (write), t (ref), fFlagSduiFormatArgFormatters (copy), t_1 (ref), applyFormatArgFormatter (copy), p25 (ref), frozen (copy), p27 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
		local var49 = str
		
		for i, v in t do
			local var50 = v(p28)
			local data = var50.data
			local status = var50.status
			
			if data ~= nil then
				local var52
				local var51 = if fFlagSduiFormatArgFormatters and t_1 then t_1[i] else nil
				
				if var51 then
					var52 = applyFormatArgFormatter(data, var51, p25.appPage)
					
					if var52 ~= nil then
						var49 = var49 and var49:gsub("{" .. i .. "}", var52)
					end
					return frozen
				else
					var52 = var49 and var49:gsub("{" .. i .. "}", tostring(data))
					var49 = var52
				end
			end
			return { status = status }
		end
		if not p27 then
			return { data = var49 }
		end
		local ok, status = pcall(function() --[[ line: 440 ]]
			-- upvalues: p27 (copy), var49 (write)
			return p27(var49)
		end)
		
		if ok then
			return { data = status }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			value = var49,
			message = `Parser in formatString for str {str}`,
			name = p25.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p25.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function validateNumbers(p29, p30, p31) --[[ line: 469 ]]
	if typeof(p30) ~= "number" then
		p30 = tonumber(p30)
	end
	if typeof(p31) ~= "number" then
		p31 = tonumber(p31)
	end
	if typeof(p30) ~= "number" or typeof(p31) ~= "number" then
		error(`{p29} without numbers, {p30}: {typeof(p30)}, {p31}: {typeof(p31)}`)
	end
	return p30, p31
end

local function _(p32) --[[ line: 488 | named "isEmpty" ]]
	return p32 == nil or (if type(p32) == "string" then p32 == "" else type(p32) == "table" and next(p32) == nil)
end

local function isSame(p33, p34) --[[ line: 513 ]]
	-- upvalues: sduiParsersModule (ref)
	if p33 == p34 then
		return true
	elseif p33 == nil then
		return false
	end
	local var53 = typeof(p34)
	
	if typeof(p33) ~= var53 then
		if var53 == "string" then
			p33 = tostring(p33)
		elseif var53 == "number" then
			p33 = tonumber(p33)
		elseif var53 == "boolean" then
			p33 = sduiParsersModule.parseBooleanProp_(p33, nil, nil)
		end
	end
	return p33 == p34
end

local function evaluateCondition(p35, p36, p37, p38, p39) --[[ line: 557 ]]
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), dataStatus (ref), validateNumbers (ref), isSame (ref), fFlagSduiIsEmptyConditions (ref), evaluateCondition (ref)
	if p36 == nil then
		return true
	end
	local type = p36 and (p36.kind and p36.kind.type)
	local value = p36 and (p36.kind and p36.kind.value)
	
	if type == nil then
		error("nil conditionType in condition")
	end
	if value == nil then
		error("nil conditionValue in condition")
	end
	local var74, var75
	local function getFieldObject(p40) --[[ line: 577 ]]
		-- upvalues: fFlagSduiRenderPerf (copy), splitDottedPathModule (copy), resolveBindingPathValue (copy), p35 (ref), p37 (ref), p39 (ref), fFlagSduiClientPageScope (copy), p38 (ref)
		local var78 = if fFlagSduiRenderPerf then splitDottedPathModule(p40) else string.split(p40, ".")
		local ok, status, var79 = pcall(function() --[[ line: 583 ]]
			-- upvalues: resolveBindingPathValue (copy), p35 (copy), var78 (ref), p37 (copy), p39 (copy), fFlagSduiClientPageScope (copy), p38 (copy)
			return resolveBindingPathValue(p35, var78, p37, p39, nil, true, if fFlagSduiClientPageScope then p38 else nil)
		end)
		
		if ok then
			return status, var79
		end
		return nil, var79
	end
	
	if type == "comparison" then
		local var57, var58 = getFieldObject(value.field)
		
		if var57 == nil or var58 and var58 ~= dataStatus.Ready then
			return nil, var58
		end
		local value_1 = value.kind.value
		local op = value.op
		
		if op == "OP_LT" then
			local var59, var60 = validateNumbers(op, var57, value_1)
			var57 = var59
			value_1 = var60
			
			return var57 < value_1
		elseif op == "OP_LTE" then
			local var61, var62 = validateNumbers(op, var57, value_1)
			var57 = var61
			value_1 = var62
			
			return var57 <= value_1
		elseif op == "OP_GT" then
			local var63, var64 = validateNumbers(op, var57, value_1)
			var57 = var63
			value_1 = var64
			
			return value_1 < var57
		elseif op == "OP_GTE" then
			local var65, var66 = validateNumbers(op, var57, value_1)
			var57 = var65
			value_1 = var66
			
			return value_1 <= var57
		elseif op == "OP_E" then
			return isSame(var57, value_1)
		elseif op == "OP_NE" then
			return not isSame(var57, value_1)
		end
		error(`Unknown operator for comparison {op}`)
	elseif type == "is_null" then
		local var67, var68 = getFieldObject(value.field)
		
		if var68 and var68 ~= dataStatus.Ready then
			return nil, var68
		end
		return var67 == nil
	elseif type == "is_not_null" then
		local var69, var70 = getFieldObject(value.field)
		
		if var70 and var70 ~= dataStatus.Ready then
			return nil, var70
		end
		return var69 ~= nil
	elseif fFlagSduiIsEmptyConditions and type == "is_empty" then
		local var76, var77 = getFieldObject(value.field)
		
		if var77 and var77 ~= dataStatus.Ready then
			return nil, var77
		end
		return var76 == nil or (if type(var76) == "string" then var76 == "" else type(var76) == "table" and next(var76) == nil)
	elseif fFlagSduiIsEmptyConditions and type == "is_not_empty" then
		local var73
		local var71, var72 = getFieldObject(value.field)
		
		if var72 and var72 ~= dataStatus.Ready then
			return nil, var72
		elseif var71 == nil then
			var73 = true
		elseif type(var71) == "string" then
			local _ = var71 == ""
		elseif type(var71) == "table" then
			var73 = next(var71) == nil
			var73 = nil
		else
			var73 = false
		end
		return not var73
	elseif type == "and_condition" then
		for i, v in value.conditions do
			var74, var75 = evaluateCondition(p35, v, p37, p38, p39)
			
			if not var75 or var75 == dataStatus.Ready then
				if not var74 then
					return var74
				end
			end
			return var74, var75
		end
		return true
	elseif type ~= "or_condition" then
		return nil
	end
	for i, v in value.conditions do
		var74, var75 = evaluateCondition(p35, v, p37, p38, p39)
		
		if not var75 or var75 == dataStatus.Ready then
			if var74 or var74 == nil then
				return var74, var75
			end
		end
		return var74, var75
	end
	return false
end

local function selectConditionalOption(p41, p42, p43, p44, p45) --[[ line: 704 ]]
	-- upvalues: evaluateCondition (ref), dataStatus (ref)
	for i, v in p42 do
		local var80, var81 = evaluateCondition(p41, v.condition, p43, p44, p45)
		
		if not var80 then
			if var81 and var81 ~= dataStatus.Ready then
				return var80, var81
			end
		end
		return v, var81
	end
	return nil
end

local function resolveTablePropValue(p46, p47, p48, p49, _, _, _, _, _) --[[ line: 809 ]]
	-- upvalues: fFlagSduiRenderPerf (ref), cryoModule (ref), frozen_1 (ref), dataStatus (ref)
	local join
	if fFlagSduiRenderPerf then
		join = cryoModule.Dictionary.join
		join = join(p49 or frozen_1, p47 or frozen_1)
	else
		join = cryoModule.Dictionary.join
		join = join(p49 or {}, p47 or {})
	end
	local var82 = nil
	
	if p48 then
		for i, v in p48 do
			join[i] = v(p46).data
			local status = v(p46).status
			
			if status and status ~= dataStatus.Ready then
				var82 = status
			end
		end
	end
	return join, var82
end

return {
	generateStaticPropValue = generateStaticPropValue,
	generateDynamicBindingPropValue = generateDynamicBindingPropValue,
	generateTokenBindingPropValue = generateTokenBindingPropValue,
	generateFormatStringPropValue = generateFormatStringPropValue,
	generateConditionalPropValue = function(p50, p51, p52, p53, p54, p55, p56, p57) --[[ line: 740 ]]
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), selectConditionalOption (ref), propResultCategory (ref), dataStatus (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p52.currentComponentType
			currentParserName = p52.currentParserName
		end
		local options = p50.options
		
		return signalsModule.createComputed(function(p58) --[[ line: 759 ]]
			-- upvalues: selectConditionalOption (copy), options (ref), p51 (ref), p52 (ref), p54 (ref), p55 (ref), p53 (ref), p56 (ref), propResultCategory (copy), dataStatus (copy), p57 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var83 = pcall(function() --[[ line: 760 ]]
				-- upvalues: selectConditionalOption (copy), p58 (ref), options (copy), p51 (copy), p52 (copy), p54 (copy), p55 (copy), p53 (copy), p56 (copy), propResultCategory (copy), dataStatus (copy)
				local var84, var85 = selectConditionalOption(p58, options, p51, p52, p54)
				
				if var84 == nil then
					return nil, var85
				end
				local var86, var87 = p55(var84 and (var84.kind and var84.kind.type), var84 and (var84.kind and var84.kind.value), p51, p54, p52, p53, p56)
				
				if var87 == propResultCategory.PropSignal then
					local var88 = var86(p58)
					var86 = var88.data
					
					if var88.status and var88.status ~= dataStatus.Ready then
						var85 = var88.status
					end
				end
				return var86, var85
			end)
			
			if ok then
				return {
					data = status,
					status = var83,
					isNestedComponentConfig = p57
				}
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToEvaluateConditionalProp, {
				message = sduiParseHelpersModule.stringifyValue(status),
				name = p52.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p52.appPage)
			
			return frozen
		end, tutilsModule.shallowEqual)
	end,
	generateTablePropSignalValue = function(value, p59, p60, p61, p62, p63, p64) --[[ line: 839 ]]
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), resolveTablePropValue (ref), fFlagSduiFocusNavActionsStructured (ref), sduiParseHelpersModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p60.currentComponentType
			currentParserName = p60.currentParserName
		end
		local var89, var90, var91 = p63(value, p59, p62, p60, p61)
		
		return signalsModule.createComputed(function(p65) --[[ line: 862 ]]
			-- upvalues: resolveTablePropValue (copy), var89 (ref), var90 (ref), var91 (ref), p59 (ref), p60 (ref), p61 (ref), p62 (ref), p63 (ref), fFlagSduiFocusNavActionsStructured (copy), p64 (ref), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var92 = pcall(function() --[[ line: 863 ]]
				-- upvalues: resolveTablePropValue (copy), p65 (ref), var89 (copy), var90 (copy), var91 (copy), p59 (copy), p60 (copy), p61 (copy), p62 (copy), p63 (copy)
				local var93, var94 = resolveTablePropValue(p65, var89, var90, var91, p59, p60, p61, p62, p63)
				
				return var93, var94
			end)
			
			if not ok then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = sduiParseHelpersModule.stringifyValue(status),
					name = p60.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
				}, p60.appPage)
				
				return frozen
			elseif fFlagSduiFocusNavActionsStructured and p64 and status ~= nil then
				local ok_1, status_1 = pcall(function() --[[ line: 880 ]]
					-- upvalues: p64 (copy), status (write)
					return p64(status)
				end)
				
				if not ok_1 then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
						value = sduiParseHelpersModule.stringifyValue(status),
						message = `Failed to apply propParser to table prop {sduiParseHelpersModule.stringifyValue(status_1)}`,
						name = p60.debugName,
						componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
						parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
					}, p60.appPage)
					
					return frozen
				end
				status = status_1
			end
			return { data = status, status = var92 }
		end, tutilsModule.shallowEqual)
	end,
	selectConditionalOption = selectConditionalOption,
	evaluateCondition = evaluateCondition,
	resolveHydrationBinding = resolveHydrationBinding,
	resolveBindingPathValue = resolveBindingPathValue,
	resolveTablePropValue = resolveTablePropValue,
	resolveSourceArray = function(p66, p67, p68, p69, p70, p71) --[[ line: 923 ]]
		-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref)
		return if p66 == "binding_path" then resolveBindingPathValue(p68, if fFlagSduiRenderPerf then splitDottedPathModule(p67) else string.split(p67, "."), p69, p70, nil, nil, if fFlagSduiClientPageScope then p71 else nil) elseif p66 == "literal" then p67 and p67.items else nil
	end,
	resolveFieldMap = function(p72, p73, p74, p75, p76, p77, p78) --[[ line: 966 ]]
		-- upvalues: resolveTablePropValue (ref)
		local var95, var96 = p78(p72, p73, p74, p75, p76)
		
		return resolveTablePropValue(p77, var95, var96, nil, p73, p75, p76, p74, nil)
	end,
	mapArrayWithFieldMap = function(p79, p80, p81, p82, p83, p84, p85) --[[ line: 1006 ]]
		-- upvalues: buildDataBindingSourcesForTemplateModule (ref), resolveTablePropValue (ref)
		local t = {}
		
		for i, v in p79 do
			local var98 = buildDataBindingSourcesForTemplateModule(v, p80)
			
			local var99 = function() --[[ line: 1018 ]]
				-- upvalues: var98 (ref)
				return var98
			end
			
			local var100 = function() --[[ line: 1021 ]]
				-- upvalues: v (ref)
				return v
			end
			
			local var101, var102 = p85(p81, var99, var100, p82, p83)
			table.insert(t, resolveTablePropValue(p84, var101, var102, nil, var99, p82, p83, var100, nil))
		end
		return t
	end,
	isComponentVisible = function(p86, p87) --[[ line: 1038 ]]
		return p86.isComponentFilteredSignal == nil or p86.isComponentFilteredSignal(p87).data ~= true
	end,
	resolveTemplate = if fFlagSduiInlineNestedComponentSchema then function(p90, p91, p92) --[[ line: 1084 | named "resolveTemplate" ]]
		if p91 ~= nil then
			return p91
		elseif p90 == nil or p90 == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p92.getTemplateForRobloxComponent(p90)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p90}`)
		end
		return templateForRobloxComponent
	end else function(p88, p89) --[[ line: 1051 | named "resolveTemplate_legacy" ]]
		if p88 == nil then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p89.getTemplateForRobloxComponent(p88)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p88}`)
		end
		return templateForRobloxComponent
	end,
	resolveTemplateFromData = if fFlagSduiInlineNestedComponentSchema then function(p93, p94) --[[ line: 1109 | named "resolveTemplateFromData" ]]
		local inlineComponent = p93.inline_component
		local robloxComponent = p93.roblox_component
		
		if inlineComponent ~= nil then
			return inlineComponent
		elseif robloxComponent == nil or robloxComponent == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p94.getTemplateForRobloxComponent(robloxComponent)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {robloxComponent}`)
		end
		return templateForRobloxComponent
	end else nil
}