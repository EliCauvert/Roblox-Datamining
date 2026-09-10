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
local fFlagSduiDismissPromptPageScope = require(parent.SharedFlags).FFlagSduiDismissPromptPageScope
local fFlagSduiHydrationFetchIfMissing = require(parent.SharedFlags).FFlagSduiHydrationFetchIfMissing
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope
local fFlagLuaAppSduiColorPropMigration = require(parent.SharedFlags).FFlagLuaAppSduiColorPropMigration
local fFlagSduiFocusNavActionsStructured = require(parent.SharedFlags).FFlagSduiFocusNavActionsStructured
local fFlagSduiFormatStringPercentSafeGsubModule = require(sduiCoreSystem.FFlagSduiFormatStringPercentSafeGsub)
local sduiPropBuilderSupportNilHydration = game:DefineFastFlag("SduiPropBuilderSupportNilHydration", false)
local frozen = table.freeze({ status = dataStatus.Failed })
local frozen_1 = table.freeze({})

local function resolveHydrationBinding(p1, p2, p3, p4)
	-- upvalues: sduiPropBuilderSupportNilHydration (ref), sduiDataBindingContentTypeModule (ref), fFlagSduiHydrationFetchIfMissing (ref), sduiDataBinderModule (ref)
	local joined = table.concat(p1, ".")
	local var1 = p1[1]
	local var2 = p2 and p2[var1]
	
	if var2 == nil then
		if sduiPropBuilderSupportNilHydration then
			if sduiDataBindingContentTypeModule[var1] ~= nil then
				error(`Could not find data bindingSource for key {var1}, bindingPath: {joined}`)
			end
			return nil, nil
		else
			error(`Could not find data bindingSource for key {var1}, bindingPath: {joined}`)
		end
	end
	local contentType = var2.contentType
	local id = var2.id
	
	if #p1 < 2 then
		error(`Unsupported path for contentType {contentType}, bindingPath: {joined}`)
	end
	local fieldValue, fieldValue_1 = sduiDataBinderModule.getFieldValue(contentType, p1, id, p3, if fFlagSduiHydrationFetchIfMissing then var2.fetchIfMissing or p4 else p4)
	
	return fieldValue, fieldValue_1
end

local function resolveBindingPathValue(p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: tryGetPathFromDataModule (ref), sduiDataBinderModule (ref), fFlagSduiClientPageScope (ref), resolveHydrationBinding (ref)
	local var3, var4 = tryGetPathFromDataModule(p8(p5), p6)
	
	if var3 and var4 ~= nil then
		return if p9 then p9(var4, p5) else var4
	end
	local var5 = p6 and p6[1]
	
	if sduiDataBinderModule.isClientContentType(var5) then
		local fieldValueForClientContentType = sduiDataBinderModule.getFieldValueForClientContentType(var5, p6, p5, if fFlagSduiClientPageScope then p11 else nil)
		
		return if p9 and fieldValueForClientContentType ~= nil then p9(fieldValueForClientContentType, p5) else fieldValueForClientContentType
	end
	local var6, var7 = resolveHydrationBinding(p6, p7(p5), p5, p10)
	
	if p9 and var6 ~= nil then
		var6 = p9(var6, p5)
	end
	return var6, var7
end

local function generateStaticPropValue(p5, p6)
	return if p6 then p6(p5) else p5
end

local function generateDynamicBindingPropValue(p5, p6, p7, p8, p9, p10)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), splitDottedPathModule (ref), signalsModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p7.currentComponentType
		currentParserName = p7.currentParserName
	end
	local var3 = splitDottedPathModule(p5)
	
	if not var3 or #var3 == 0 then
		error(`Invalid bindingPath: {p5}`)
	end
	return signalsModule.createComputed(function(p11)
		-- upvalues: resolveBindingPathValue (copy), var3 (ref), p6 (ref), p8 (ref), p9 (ref), p10 (ref), fFlagSduiClientPageScope (copy), p7 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p5 (ref), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
		local ok, status, var4 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p11 (ref), var3 (copy), p6 (copy), p8 (copy), p9 (copy), p10 (copy), fFlagSduiClientPageScope (copy), p7 (copy)
			local var5, var6 = resolveBindingPathValue(p11, var3, p6, p8, p9, p10, if fFlagSduiClientPageScope then p7 else nil)
			
			return var5, var6
		end)
		
		if ok then
			return { data = status, status = var4 }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToComputeDynamicBinding, {
			value = p5,
			message = sduiParseHelpersModule.stringifyValue(status),
			name = p7.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p7.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function generateTokenBindingPropValue(p5, p6, p7)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), splitDottedPathModule (ref), signalsModule (ref), getSduiTokensStoreModule (ref), tryGetPathFromDataModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), fFlagLuaAppSduiColorPropMigration (ref), dataStatus (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p6.currentComponentType
		currentParserName = p6.currentParserName
	end
	local var3 = splitDottedPathModule(p5)
	
	return signalsModule.createComputed(function(p8)
		-- upvalues: getSduiTokensStoreModule (copy), p6 (ref), tryGetPathFromDataModule (copy), var3 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy), fFlagLuaAppSduiColorPropMigration (copy), p7 (ref), dataStatus (copy)
		local var4, var5 = tryGetPathFromDataModule(getSduiTokensStoreModule().getTokens(p8, p6.appPage), var3)
		
		if not var4 then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.TokenBindingFailed, {
				message = `Could not find token with tokenPath {table.concat(var3, ".")}`,
				name = p6.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p6.appPage)
			
			return frozen
		elseif fFlagLuaAppSduiColorPropMigration and p7 then
			var5 = p7(var5)
		end
		return { data = var5, status = dataStatus.Ready }
	end, tutilsModule.shallowEqual)
end

local function _(p5, p6, p7)
	return p5:gsub("{" .. p25 .. "}", function()
		-- upvalues: p7 (ref)
		return p7
	end)
end

local function generateFormatStringPropValue(p5, p6, p7, p8, p9)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiFormatArgFormatters (ref), applyFormatArgFormatter (ref), frozen (ref), fFlagSduiFormatStringPercentSafeGsubModule (ref), generateDynamicBindingPropValue (ref), signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p7.currentComponentType
		currentParserName = p7.currentParserName
	end
	if typeof(p5) ~= "table" then
		error(`Unexpected type for stringFormat {typeof(p5)}`)
	end
	local str = p5.str
	
	if (not str or str == "") and p5.translation then
		str = p7.resolveLocalizedLiteral(p5.translation)
	end
	if not str or str == "" then
		error("No format string for prop")
	end
	if not p5.args then
		error(`No args found for format. If no args needed, use literal. {str}`)
	end
	local value
	local t = {}
	local t_1 = {}
	
	for i, v in p5.args do
		local type = v.kind.type
		value = v.kind.value
		
		if type ~= "literal" then
			if type == "binding_path" then
				t[i] = generateDynamicBindingPropValue(value, p6, p7, p8)
				
				if fFlagSduiFormatArgFormatters and v.formatter then
					t_1[i] = v.formatter
				end
			else
				warn(`Unrecognized argType in buildFormatString {type}`)
			end
		end
		if fFlagSduiFormatArgFormatters and v.formatter then
			local var3 = applyFormatArgFormatter(value, v.formatter, p7.appPage)
			
			if var3 ~= nil then
				str = if fFlagSduiFormatStringPercentSafeGsubModule then str:gsub("{" .. i .. "}", function()
					-- upvalues: var3 (ref)
					return var3
				end) else str:gsub("{" .. i .. "}", var3)
				continue
			end
			return function()
				-- upvalues: frozen (copy)
				return frozen
			end
		elseif fFlagSduiFormatStringPercentSafeGsubModule then
			local var4 = tostring(value)
			str = str:gsub("{" .. i .. "}", function()
				-- upvalues: var4 (ref)
				return var4
			end)
		else
			str = str:gsub("{" .. i .. "}", tostring(value))
		end
	end
	return signalsModule.createComputed(function(p10)
		-- upvalues: str (write), t (ref), fFlagSduiFormatArgFormatters (copy), t_1 (ref), applyFormatArgFormatter (copy), p7 (ref), frozen (copy), fFlagSduiFormatStringPercentSafeGsubModule (copy), p9 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
		local var5 = str
		
		for i, v in t do
			local var6 = v(p10)
			local data = var6.data
			local status = var6.status
			
			if data ~= nil then
				local var7
				local var8 = if fFlagSduiFormatArgFormatters and t_1 then t_1[i] else nil
				
				if var8 then
					var7 = applyFormatArgFormatter(data, var8, p7.appPage)
					
					if var7 ~= nil then
						var5 = if fFlagSduiFormatStringPercentSafeGsubModule then var5 and var5:gsub("{" .. i .. "}", function()
							-- upvalues: var7 (ref)
							return var7
						end) else var5 and var5:gsub("{" .. i .. "}", var7)
					end
					return frozen
				elseif fFlagSduiFormatStringPercentSafeGsubModule then
					var7 = var5
					
					if var7 then
						local var9 = tostring(data)
						var7 = var5:gsub("{" .. i .. "}", function()
							-- upvalues: var9 (ref)
							return var9
						end)
					end
					var5 = var7
				else
					var7 = var5 and var5:gsub("{" .. i .. "}", tostring(data))
					var5 = var7
				end
			end
			return { status = status }
		end
		if not p9 then
			return { data = var5 }
		end
		local ok, status = pcall(function()
			-- upvalues: p9 (copy), var5 (write)
			return p9(var5)
		end)
		
		if ok then
			return { data = status }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			value = var5,
			message = `Parser in formatString for str {str}`,
			name = p7.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p7.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function validateNumbers(p11, p12, p13)
	if typeof(p12) ~= "number" then
		p12 = tonumber(p12)
	end
	if typeof(p13) ~= "number" then
		p13 = tonumber(p13)
	end
	if typeof(p12) ~= "number" or typeof(p13) ~= "number" then
		error(`{p11} without numbers, {p12}: {typeof(p12)}, {p13}: {typeof(p13)}`)
	end
	return p12, p13
end

local _ = function(p11)
	return p11 == nil or (if type(p11) == "string" then p11 == "" else type(p11) == "table" and next(p11) == nil)
end

local function isSame(p11, p12)
	-- upvalues: sduiParsersModule (ref)
	if p11 == p12 then
		return true
	elseif p11 == nil then
		return false
	end
	local var10 = typeof(p12)
	
	if typeof(p11) ~= var10 then
		if var10 == "string" then
			p11 = tostring(p11)
		elseif var10 == "number" then
			p11 = tonumber(p11)
		elseif var10 == "boolean" then
			p11 = sduiParsersModule.parseBooleanProp_(p11, nil, nil)
		end
	end
	return p11 == p12
end

local var10 = nil

if fFlagSduiDismissPromptPageScope then
	local function contains(p11, p12)
		-- upvalues: isSame (ref)
		if typeof(p11) ~= "table" or typeof(p12) ~= "string" then
			return false
		elseif p11[p12] ~= nil then
			return true
		end
		for i, v in p11 do
			if typeof(i) == "number" and isSame(v, p12) then
				return true
			end
		end
		return false
	end
	
	var10 = function(p13, p14)
		-- upvalues: dataStatus (ref), contains (ref)
		local var11, var12 = p14(p13.field)
		
		if var12 and var12 ~= dataStatus.Ready then
			return nil, var12
		end
		local kind = p13.kind
		
		if kind == nil or kind.type == nil then
			error("nil target kind in ContainsCondition")
		end
		local var13 = nil
		
		if kind.type == "string_value" then
			var13 = kind.value
		elseif kind.type == "binding_path_value" then
			local _ = nil
			local var14, var15 = p14(kind.value)
			var13 = var14
			local var16 = var15
			
			if var16 and var16 ~= dataStatus.Ready then
				return nil, var16
			end
			return if var13 == nil then nil else contains(var11, var13)
		else
			error(`Unknown ContainsCondition target kind {kind.type}`)
		end
	end
end
local function evaluateCondition(p11, p12, p13, p14, p15)
	-- upvalues: splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), dataStatus (ref), validateNumbers (ref), isSame (ref), fFlagSduiIsEmptyConditions (ref), fFlagSduiDismissPromptPageScope (ref), var10 (write), evaluateCondition (ref)
	if p12 == nil then
		return true
	end
	local type = p12 and (p12.kind and p12.kind.type)
	local value = p12 and (p12.kind and p12.kind.value)
	
	if type == nil then
		error("nil conditionType in condition")
	end
	if value == nil then
		error("nil conditionValue in condition")
	end
	local var11, var12
	local function getFieldObject(p16)
		-- upvalues: splitDottedPathModule (copy), resolveBindingPathValue (copy), p11 (ref), p13 (ref), p15 (ref), fFlagSduiClientPageScope (copy), p14 (ref)
		local var13 = splitDottedPathModule(p16)
		local ok, status, var14 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p11 (copy), var13 (ref), p13 (copy), p15 (copy), fFlagSduiClientPageScope (copy), p14 (copy)
			return resolveBindingPathValue(p11, var13, p13, p15, nil, true, if fFlagSduiClientPageScope then p14 else nil)
		end)
		
		if ok then
			return status, var14
		end
		return nil, var14
	end
	
	if type == "comparison" then
		local var13, var14
		local var15 = splitDottedPathModule(value.field)
		local ok, status, var16 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p11 (ref), var15 (ref), p13 (ref), p15 (ref), fFlagSduiClientPageScope (copy), p14 (ref)
			return resolveBindingPathValue(p11, var15, p13, p15, nil, true, if fFlagSduiClientPageScope then p14 else nil)
		end)
		
		if ok then
			var13 = status
			var14 = var16
		else
			var13 = nil
			var14 = var16
		end
		if var13 == nil or var14 and var14 ~= dataStatus.Ready then
			return nil, var14
		end
		local value_1 = value.kind.value
		local op = value.op
		
		if op == "OP_LT" then
			local var17, var18 = validateNumbers(op, var13, value_1)
			var13 = var17
			value_1 = var18
			
			return var13 < value_1
		elseif op == "OP_LTE" then
			local var19, var20 = validateNumbers(op, var13, value_1)
			var13 = var19
			value_1 = var20
			
			return var13 <= value_1
		elseif op == "OP_GT" then
			local var21, var22 = validateNumbers(op, var13, value_1)
			var13 = var21
			value_1 = var22
			
			return value_1 < var13
		elseif op == "OP_GTE" then
			local var23, var24 = validateNumbers(op, var13, value_1)
			var13 = var23
			value_1 = var24
			
			return value_1 <= var13
		elseif op == "OP_E" then
			return isSame(var13, value_1)
		elseif op == "OP_NE" then
			return not isSame(var13, value_1)
		end
		error(`Unknown operator for comparison {op}`)
	elseif type == "is_null" then
		local var25, var26
		local var27 = splitDottedPathModule(value.field)
		local ok, status, var28 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p11 (ref), var27 (ref), p13 (ref), p15 (ref), fFlagSduiClientPageScope (copy), p14 (ref)
			return resolveBindingPathValue(p11, var27, p13, p15, nil, true, if fFlagSduiClientPageScope then p14 else nil)
		end)
		
		if ok then
			var25 = status
			var26 = var28
		else
			var25 = nil
			var26 = var28
		end
		if var26 and var26 ~= dataStatus.Ready then
			return nil, var26
		end
		return var25 == nil
	elseif type == "is_not_null" then
		local var29, var30
		local var31 = splitDottedPathModule(value.field)
		local ok, status, var32 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p11 (ref), var31 (ref), p13 (ref), p15 (ref), fFlagSduiClientPageScope (copy), p14 (ref)
			return resolveBindingPathValue(p11, var31, p13, p15, nil, true, if fFlagSduiClientPageScope then p14 else nil)
		end)
		
		if ok then
			var29 = status
			var30 = var32
		else
			var29 = nil
			var30 = var32
		end
		if var30 and var30 ~= dataStatus.Ready then
			return nil, var30
		end
		return var29 ~= nil
	elseif fFlagSduiIsEmptyConditions and type == "is_empty" then
		local var33, var34
		local var35 = splitDottedPathModule(value.field)
		local ok, status, var36 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p11 (ref), var35 (ref), p13 (ref), p15 (ref), fFlagSduiClientPageScope (copy), p14 (ref)
			return resolveBindingPathValue(p11, var35, p13, p15, nil, true, if fFlagSduiClientPageScope then p14 else nil)
		end)
		
		if ok then
			var33 = status
			var34 = var36
		else
			var33 = nil
			var34 = var36
		end
		if var34 and var34 ~= dataStatus.Ready then
			return nil, var34
		end
		return var33 == nil or (if type(var33) == "string" then var33 == "" else type(var33) == "table" and next(var33) == nil)
	elseif fFlagSduiIsEmptyConditions and type == "is_not_empty" then
		local var37, var38
		local var39 = splitDottedPathModule(value.field)
		local ok, status, var40 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p11 (ref), var39 (ref), p13 (ref), p15 (ref), fFlagSduiClientPageScope (copy), p14 (ref)
			return resolveBindingPathValue(p11, var39, p13, p15, nil, true, if fFlagSduiClientPageScope then p14 else nil)
		end)
		
		if ok then
			var37 = status
			var38 = var40
		else
			var37 = nil
			var38 = var40
		end
		local var41
		if var38 and var38 ~= dataStatus.Ready then
			return nil, var38
		elseif var37 == nil then
			var41 = true
		elseif type(var37) == "string" then
			local _ = var37 == ""
		elseif type(var37) == "table" then
			var41 = next(var37) == nil
			var41 = nil
		else
			var41 = false
		end
		return not var41
	elseif fFlagSduiDismissPromptPageScope and type == "contains" then
		return var10(value, getFieldObject)
	elseif type == "and_condition" then
		for i, v in value.conditions do
			var11, var96 = evaluateCondition(p11, v, p13, p14, p15)
			
			if not var12 or var12 == dataStatus.Ready then
				if not var11 then
					return var11
				end
			end
			return var11, var12
		end
		return true
	elseif type ~= "or_condition" then
		return nil
	end
	for i, v in value.conditions do
		var11, var96 = evaluateCondition(p11, v, p13, p14, p15)
		
		if not var12 or var12 == dataStatus.Ready then
			if var11 or var11 == nil then
				return var11, var12
			end
		end
		return var11, var12
	end
	return false
end

local function selectConditionalOption(p16, p17, p18, p19, p20)
	-- upvalues: evaluateCondition (ref), dataStatus (ref)
	for i, v in p17 do
		local var42, var43 = evaluateCondition(p16, v.condition, p18, p19, p20)
		
		if not var42 then
			if var43 and var43 ~= dataStatus.Ready then
				return var42, var43
			end
		end
		return v, var43
	end
	return nil
end

local function resolveTablePropValue(p21, p22, p23, p24, _, _, _, _, _)
	-- upvalues: cryoModule (ref), frozen_1 (ref), dataStatus (ref)
	local var44 = cryoModule.Dictionary.join(p24 or frozen_1, p22 or frozen_1)
	local var45 = nil
	
	if p23 then
		for i, v in p23 do
			var44[i] = v(p21).data
			local status = v(p21).status
			
			if status and status ~= dataStatus.Ready then
				var45 = status
			end
		end
	end
	return var44, var45
end

return {
	generateStaticPropValue = generateStaticPropValue,
	generateDynamicBindingPropValue = generateDynamicBindingPropValue,
	generateTokenBindingPropValue = generateTokenBindingPropValue,
	generateFormatStringPropValue = generateFormatStringPropValue,
	generateConditionalPropValue = function(p25, p26, p27, p28, p29, p30, p31, p32)
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), selectConditionalOption (ref), propResultCategory (ref), dataStatus (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p27.currentComponentType
			currentParserName = p27.currentParserName
		end
		local options = p25.options
		
		return signalsModule.createComputed(function(p33)
			-- upvalues: selectConditionalOption (copy), options (ref), p26 (ref), p27 (ref), p29 (ref), p30 (ref), p28 (ref), p31 (ref), propResultCategory (copy), dataStatus (copy), p32 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var46 = pcall(function()
				-- upvalues: selectConditionalOption (copy), p33 (ref), options (copy), p26 (copy), p27 (copy), p29 (copy), p30 (copy), p28 (copy), p31 (copy), propResultCategory (copy), dataStatus (copy)
				local var47, var48 = selectConditionalOption(p33, options, p26, p27, p29)
				
				if var47 == nil then
					return nil, var48
				end
				local var49, var50 = p30(var47 and (var47.kind and var47.kind.type), var47 and (var47.kind and var47.kind.value), p26, p29, p27, p28, p31)
				
				if var50 == propResultCategory.PropSignal then
					local var51 = var49(p33)
					var49 = var51.data
					
					if var51.status and var51.status ~= dataStatus.Ready then
						var48 = var51.status
					end
				end
				return var49, var48
			end)
			
			if ok then
				return {
					data = status,
					status = var46,
					isNestedComponentConfig = p32
				}
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToEvaluateConditionalProp, {
				message = sduiParseHelpersModule.stringifyValue(status),
				name = p27.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p27.appPage)
			
			return frozen
		end, tutilsModule.shallowEqual)
	end,
	generateTablePropSignalValue = function(value, p25, p26, p27, p28, p29, p30)
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), resolveTablePropValue (ref), fFlagSduiFocusNavActionsStructured (ref), sduiParseHelpersModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p26.currentComponentType
			currentParserName = p26.currentParserName
		end
		local var46, var47, var48 = p29(value, p25, p28, p26, p27)
		
		return signalsModule.createComputed(function(p31)
			-- upvalues: resolveTablePropValue (copy), var46 (ref), var47 (ref), var48 (ref), p25 (ref), p26 (ref), p27 (ref), p28 (ref), p29 (ref), fFlagSduiFocusNavActionsStructured (copy), p30 (ref), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var49 = pcall(function()
				-- upvalues: resolveTablePropValue (copy), p31 (ref), var46 (copy), var47 (copy), var48 (copy), p25 (copy), p26 (copy), p27 (copy), p28 (copy), p29 (copy)
				local var50, var51 = resolveTablePropValue(p31, var46, var47, var48, p25, p26, p27, p28, p29)
				
				return var50, var51
			end)
			
			if not ok then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = sduiParseHelpersModule.stringifyValue(status),
					name = p26.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
				}, p26.appPage)
				
				return frozen
			elseif fFlagSduiFocusNavActionsStructured and p30 and status ~= nil then
				local ok_1, status_1 = pcall(function()
					-- upvalues: p30 (copy), status (write)
					return p30(status)
				end)
				
				if not ok_1 then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
						value = sduiParseHelpersModule.stringifyValue(status),
						message = `Failed to apply propParser to table prop {sduiParseHelpersModule.stringifyValue(status_1)}`,
						name = p26.debugName,
						componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
						parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
					}, p26.appPage)
					
					return frozen
				end
				status = status_1
			end
			return { data = status, status = var49 }
		end, tutilsModule.shallowEqual)
	end,
	selectConditionalOption = selectConditionalOption,
	evaluateCondition = evaluateCondition,
	resolveHydrationBinding = resolveHydrationBinding,
	resolveBindingPathValue = resolveBindingPathValue,
	resolveTablePropValue = resolveTablePropValue,
	resolveSourceArray = function(p25, p26, p27, p28, p29, p30)
		-- upvalues: splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref)
		return if p25 == "binding_path" then resolveBindingPathValue(p27, splitDottedPathModule(p26), p28, p29, nil, nil, if fFlagSduiClientPageScope then p30 else nil) elseif p25 == "literal" then p26 and p26.items else nil
	end,
	resolveFieldMap = function(p25, p26, p27, p28, p29, p30, p31)
		-- upvalues: resolveTablePropValue (ref)
		local var46, var47 = p31(p25, p26, p27, p28, p29)
		
		return resolveTablePropValue(p30, var46, var47, nil, p26, p28, p29, p27, nil)
	end,
	mapArrayWithFieldMap = function(p25, p26, p27, p28, p29, p30, p31)
		-- upvalues: buildDataBindingSourcesForTemplateModule (ref), resolveTablePropValue (ref)
		local t = {}
		
		for i, v in p25 do
			local var46 = buildDataBindingSourcesForTemplateModule(v, p26)
			
			local var47 = function()
				-- upvalues: var46 (ref)
				return var46
			end
			
			local var48 = function()
				-- upvalues: v (ref)
				return v
			end
			
			local var49, var50 = p31(p27, var47, var48, p28, p29)
			table.insert(t, resolveTablePropValue(p30, var49, var50, nil, var47, p28, p29, var48, nil))
		end
		return t
	end,
	isComponentVisible = function(p32, p33)
		return p32.isComponentFilteredSignal == nil or p32.isComponentFilteredSignal(p33).data ~= true
	end,
	resolveTemplate = if fFlagSduiInlineNestedComponentSchema then function(p32, p33, p34)
		if p33 ~= nil then
			return p33
		elseif p32 == nil or p32 == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p34.getTemplateForRobloxComponent(p32)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p32}`)
		end
		return templateForRobloxComponent
	end else function(p35, p36)
		if p35 == nil then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p36.getTemplateForRobloxComponent(p35)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p35}`)
		end
		return templateForRobloxComponent
	end,
	resolveTemplateFromData = if fFlagSduiInlineNestedComponentSchema then function(p37, p38)
		local inlineComponent = p37.inline_component
		local robloxComponent = p37.roblox_component
		
		if inlineComponent ~= nil then
			return inlineComponent
		elseif robloxComponent == nil or robloxComponent == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p38.getTemplateForRobloxComponent(robloxComponent)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {robloxComponent}`)
		end
		return templateForRobloxComponent
	end else nil
}