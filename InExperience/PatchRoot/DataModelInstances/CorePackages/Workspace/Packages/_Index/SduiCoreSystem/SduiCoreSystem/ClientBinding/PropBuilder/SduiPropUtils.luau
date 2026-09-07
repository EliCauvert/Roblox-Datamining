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
	-- upvalues: tryGetPathFromDataModule (ref), sduiDataBinderModule (ref), fFlagSduiClientPageScope (ref), resolveHydrationBinding (ref), fFlagSduiRenderPerf (ref), sduiParseHelpersModule (ref)
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
		if fFlagSduiRenderPerf then
			var6 = p9(var6, p5)
		else
			local ok, status = pcall(function()
				-- upvalues: p9 (ref), var6 (write), p5 (ref)
				return p9(var6, p5)
			end)
			
			if not ok then
				error(`Parser failed for bindingPath: {table.concat(p6, ".")}. err{sduiParseHelpersModule.stringifyValue(status)}`)
			end
			var6 = status
		end
	end
	return var6, var7
end

local function generateStaticPropValue(p12, p13)
	return if p13 then p13(p12) else p12
end

local function generateDynamicBindingPropValue(p12, p13, p14, p15, p16, p17)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), signalsModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p14.currentComponentType
		currentParserName = p14.currentParserName
	end
	local var8 = if fFlagSduiRenderPerf then splitDottedPathModule(p12) else string.split(p12, ".")
	
	if not var8 or #var8 == 0 then
		error(`Invalid bindingPath: {p12}`)
	end
	return signalsModule.createComputed(function(p18)
		-- upvalues: resolveBindingPathValue (copy), var8 (ref), p13 (ref), p15 (ref), p16 (ref), p17 (ref), fFlagSduiClientPageScope (copy), p14 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p12 (ref), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
		local ok, status, var9 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p18 (ref), var8 (copy), p13 (copy), p15 (copy), p16 (copy), p17 (copy), fFlagSduiClientPageScope (copy), p14 (copy)
			local var10, var11 = resolveBindingPathValue(p18, var8, p13, p15, p16, p17, if fFlagSduiClientPageScope then p14 else nil)
			
			return var10, var11
		end)
		
		if ok then
			return { data = status, status = var9 }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToComputeDynamicBinding, {
			value = p12,
			message = sduiParseHelpersModule.stringifyValue(status),
			name = p14.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p14.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function generateTokenBindingPropValue(p12, p13, p14)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), signalsModule (ref), getSduiTokensStoreModule (ref), tryGetPathFromDataModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), fFlagLuaAppSduiColorPropMigration (ref), dataStatus (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p13.currentComponentType
		currentParserName = p13.currentParserName
	end
	local var8 = if fFlagSduiRenderPerf then splitDottedPathModule(p12) else string.split(p12, ".")
	
	return signalsModule.createComputed(function(p15)
		-- upvalues: getSduiTokensStoreModule (copy), p13 (ref), tryGetPathFromDataModule (copy), var8 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy), fFlagLuaAppSduiColorPropMigration (copy), p14 (ref), dataStatus (copy)
		local var9, var10 = tryGetPathFromDataModule(getSduiTokensStoreModule().getTokens(p15, p13.appPage), var8)
		
		if not var9 then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.TokenBindingFailed, {
				message = `Could not find token with tokenPath {table.concat(var8, ".")}`,
				name = p13.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p13.appPage)
			
			return frozen
		elseif fFlagLuaAppSduiColorPropMigration and p14 then
			var10 = p14(var10)
		end
		return { data = var10, status = dataStatus.Ready }
	end, tutilsModule.shallowEqual)
end

local function generateFormatStringPropValue(p12, p13, p14, p15, p16)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiFormatArgFormatters (ref), applyFormatArgFormatter (ref), frozen (ref), generateDynamicBindingPropValue (ref), signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), tutilsModule (ref)
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p14.currentComponentType
		currentParserName = p14.currentParserName
	end
	if typeof(p12) ~= "table" then
		error(`Unexpected type for stringFormat {typeof(p12)}`)
	end
	local str = p12.str
	
	if (not str or str == "") and p12.translation then
		str = p14.resolveLocalizedLiteral(p12.translation)
	end
	if not str or str == "" then
		error("No format string for prop")
	end
	if not p12.args then
		error(`No args found for format. If no args needed, use literal. {str}`)
	end
	local value
	local t = {}
	local t_1 = {}
	
	for i, v in p12.args do
		local type = v.kind.type
		value = v.kind.value
		
		if type == "literal" then
			if fFlagSduiFormatArgFormatters and v.formatter then
				local var8 = applyFormatArgFormatter(value, v.formatter, p14.appPage)
				
				if var8 ~= nil then
					str = str:gsub("{" .. i .. "}", var8)
					continue
				end
				return function()
					-- upvalues: frozen (copy)
					return frozen
				end
			else
				str = str:gsub("{" .. i .. "}", tostring(value))
			end
		elseif type == "binding_path" then
			t[i] = generateDynamicBindingPropValue(value, p13, p14, p15)
			
			if fFlagSduiFormatArgFormatters and v.formatter then
				t_1[i] = v.formatter
			end
		else
			warn(`Unrecognized argType in buildFormatString {type}`)
		end
	end
	return signalsModule.createComputed(function(p17)
		-- upvalues: str (write), t (ref), fFlagSduiFormatArgFormatters (copy), t_1 (ref), applyFormatArgFormatter (copy), p14 (ref), frozen (copy), p16 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write)
		local var9 = str
		
		for i, v in t do
			local var10 = v(p17)
			local data = var10.data
			local status = var10.status
			
			if data ~= nil then
				local var11
				local var12 = if fFlagSduiFormatArgFormatters and t_1 then t_1[i] else nil
				
				if var12 then
					var11 = applyFormatArgFormatter(data, var12, p14.appPage)
					
					if var11 ~= nil then
						var9 = var9 and var9:gsub("{" .. i .. "}", var11)
					end
					return frozen
				else
					var11 = var9 and var9:gsub("{" .. i .. "}", tostring(data))
					var9 = var11
				end
			end
			return { status = status }
		end
		if not p16 then
			return { data = var9 }
		end
		local ok, status = pcall(function()
			-- upvalues: p16 (copy), var9 (write)
			return p16(var9)
		end)
		
		if ok then
			return { data = status }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			value = var9,
			message = `Parser in formatString for str {str}`,
			name = p14.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
		}, p14.appPage)
		
		return frozen
	end, tutilsModule.shallowEqual)
end

local function validateNumbers(p18, p19, p20)
	if typeof(p19) ~= "number" then
		p19 = tonumber(p19)
	end
	if typeof(p20) ~= "number" then
		p20 = tonumber(p20)
	end
	if typeof(p19) ~= "number" or typeof(p20) ~= "number" then
		error(`{p18} without numbers, {p19}: {typeof(p19)}, {p20}: {typeof(p20)}`)
	end
	return p19, p20
end

local function _(p18)
	return p18 == nil or (if type(p18) == "string" then p18 == "" else type(p18) == "table" and next(p18) == nil)
end

local function isSame(p18, p19)
	-- upvalues: sduiParsersModule (ref)
	if p18 == p19 then
		return true
	elseif p18 == nil then
		return false
	end
	local var13 = typeof(p19)
	
	if typeof(p18) ~= var13 then
		if var13 == "string" then
			p18 = tostring(p18)
		elseif var13 == "number" then
			p18 = tonumber(p18)
		elseif var13 == "boolean" then
			p18 = sduiParsersModule.parseBooleanProp_(p18, nil, nil)
		end
	end
	return p18 == p19
end

local function evaluateCondition(p18, p19, p20, p21, p22)
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref), dataStatus (ref), validateNumbers (ref), isSame (ref), fFlagSduiIsEmptyConditions (ref), evaluateCondition (ref)
	if p19 == nil then
		return true
	end
	local type = p19 and (p19.kind and p19.kind.type)
	local value = p19 and (p19.kind and p19.kind.value)
	
	if type == nil then
		error("nil conditionType in condition")
	end
	if value == nil then
		error("nil conditionValue in condition")
	end
	local var13, var14
	local function getFieldObject(p23)
		-- upvalues: fFlagSduiRenderPerf (copy), splitDottedPathModule (copy), resolveBindingPathValue (copy), p18 (ref), p20 (ref), p22 (ref), fFlagSduiClientPageScope (copy), p21 (ref)
		local var15 = if fFlagSduiRenderPerf then splitDottedPathModule(p23) else string.split(p23, ".")
		local ok, status, var16 = pcall(function()
			-- upvalues: resolveBindingPathValue (copy), p18 (copy), var15 (ref), p20 (copy), p22 (copy), fFlagSduiClientPageScope (copy), p21 (copy)
			return resolveBindingPathValue(p18, var15, p20, p22, nil, true, if fFlagSduiClientPageScope then p21 else nil)
		end)
		
		if ok then
			return status, var16
		end
		return nil, var16
	end
	
	if type == "comparison" then
		local var15, var16 = getFieldObject(value.field)
		
		if var15 == nil or var16 and var16 ~= dataStatus.Ready then
			return nil, var16
		end
		local value_1 = value.kind.value
		local op = value.op
		
		if op == "OP_LT" then
			local var17, var18 = validateNumbers(op, var15, value_1)
			var15 = var17
			value_1 = var18
			
			return var15 < value_1
		elseif op == "OP_LTE" then
			local var19, var20 = validateNumbers(op, var15, value_1)
			var15 = var19
			value_1 = var20
			
			return var15 <= value_1
		elseif op == "OP_GT" then
			local var21, var22 = validateNumbers(op, var15, value_1)
			var15 = var21
			value_1 = var22
			
			return value_1 < var15
		elseif op == "OP_GTE" then
			local var23, var24 = validateNumbers(op, var15, value_1)
			var15 = var23
			value_1 = var24
			
			return value_1 <= var15
		elseif op == "OP_E" then
			return isSame(var15, value_1)
		elseif op == "OP_NE" then
			return not isSame(var15, value_1)
		end
		error(`Unknown operator for comparison {op}`)
	elseif type == "is_null" then
		local var25, var26 = getFieldObject(value.field)
		
		if var26 and var26 ~= dataStatus.Ready then
			return nil, var26
		end
		return var25 == nil
	elseif type == "is_not_null" then
		local var27, var28 = getFieldObject(value.field)
		
		if var28 and var28 ~= dataStatus.Ready then
			return nil, var28
		end
		return var27 ~= nil
	elseif fFlagSduiIsEmptyConditions and type == "is_empty" then
		local var29, var30 = getFieldObject(value.field)
		
		if var30 and var30 ~= dataStatus.Ready then
			return nil, var30
		end
		return var29 == nil or (if type(var29) == "string" then var29 == "" else type(var29) == "table" and next(var29) == nil)
	elseif fFlagSduiIsEmptyConditions and type == "is_not_empty" then
		local var31
		local var32, var33 = getFieldObject(value.field)
		
		if var33 and var33 ~= dataStatus.Ready then
			return nil, var33
		elseif var32 == nil then
			var31 = true
		elseif type(var32) == "string" then
			local _ = var32 == ""
		elseif type(var32) == "table" then
			var31 = next(var32) == nil
			var31 = nil
		else
			var31 = false
		end
		return not var31
	elseif type == "and_condition" then
		for i, v in value.conditions do
			var13, var77 = evaluateCondition(p18, v, p20, p21, p22)
			
			if not var14 or var14 == dataStatus.Ready then
				if not var13 then
					return var13
				end
			end
			return var13, var14
		end
		return true
	elseif type ~= "or_condition" then
		return nil
	end
	for i, v in value.conditions do
		var13, var77 = evaluateCondition(p18, v, p20, p21, p22)
		
		if not var14 or var14 == dataStatus.Ready then
			if var13 or var13 == nil then
				return var13, var14
			end
		end
		return var13, var14
	end
	return false
end

local function selectConditionalOption(p23, p24, p25, p26, p27)
	-- upvalues: evaluateCondition (ref), dataStatus (ref)
	for i, v in p24 do
		local var34, var35 = evaluateCondition(p23, v.condition, p25, p26, p27)
		
		if not var34 then
			if var35 and var35 ~= dataStatus.Ready then
				return var34, var35
			end
		end
		return v, var35
	end
	return nil
end

local function resolveTablePropValue(p28, p29, p30, p31, _, _, _, _, _)
	-- upvalues: fFlagSduiRenderPerf (ref), cryoModule (ref), frozen_1 (ref), dataStatus (ref)
	local join
	if fFlagSduiRenderPerf then
		join = cryoModule.Dictionary.join
		join = join(p31 or frozen_1, p29 or frozen_1)
	else
		join = cryoModule.Dictionary.join
		join = join(p31 or {}, p29 or {})
	end
	local var36 = nil
	
	if p30 then
		for i, v in p30 do
			join[i] = v(p28).data
			local status = v(p28).status
			
			if status and status ~= dataStatus.Ready then
				var36 = status
			end
		end
	end
	return join, var36
end

return {
	generateStaticPropValue = generateStaticPropValue,
	generateDynamicBindingPropValue = generateDynamicBindingPropValue,
	generateTokenBindingPropValue = generateTokenBindingPropValue,
	generateFormatStringPropValue = generateFormatStringPropValue,
	generateConditionalPropValue = function(p32, p33, p34, p35, p36, p37, p38, p39)
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), selectConditionalOption (ref), propResultCategory (ref), dataStatus (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p34.currentComponentType
			currentParserName = p34.currentParserName
		end
		local options = p32.options
		
		return signalsModule.createComputed(function(p40)
			-- upvalues: selectConditionalOption (copy), options (ref), p33 (ref), p34 (ref), p36 (ref), p37 (ref), p35 (ref), p38 (ref), propResultCategory (copy), dataStatus (copy), p39 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var37 = pcall(function()
				-- upvalues: selectConditionalOption (copy), p40 (ref), options (copy), p33 (copy), p34 (copy), p36 (copy), p37 (copy), p35 (copy), p38 (copy), propResultCategory (copy), dataStatus (copy)
				local var38, var39 = selectConditionalOption(p40, options, p33, p34, p36)
				
				if var38 == nil then
					return nil, var39
				end
				local var40, var41 = p37(var38 and (var38.kind and var38.kind.type), var38 and (var38.kind and var38.kind.value), p33, p36, p34, p35, p38)
				
				if var41 == propResultCategory.PropSignal then
					local var42 = var40(p40)
					var40 = var42.data
					
					if var42.status and var42.status ~= dataStatus.Ready then
						var39 = var42.status
					end
				end
				return var40, var39
			end)
			
			if ok then
				return {
					data = status,
					status = var37,
					isNestedComponentConfig = p39
				}
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToEvaluateConditionalProp, {
				message = sduiParseHelpersModule.stringifyValue(status),
				name = p34.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p34.appPage)
			
			return frozen
		end, tutilsModule.shallowEqual)
	end,
	generateTablePropSignalValue = function(value, p32, p33, p34, p35, p36, p37)
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), signalsModule (ref), resolveTablePropValue (ref), fFlagSduiFocusNavActionsStructured (ref), sduiParseHelpersModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), frozen (ref), tutilsModule (ref)
		local currentComponentType = nil
		local currentParserName = nil
		
		if fFlagSduiImprovedErrorDimensions then
			currentComponentType = p33.currentComponentType
			currentParserName = p33.currentParserName
		end
		local var37, var38, var39 = p36(value, p32, p35, p33, p34)
		
		return signalsModule.createComputed(function(p38)
			-- upvalues: resolveTablePropValue (copy), var37 (ref), var38 (ref), var39 (ref), p32 (ref), p33 (ref), p34 (ref), p35 (ref), p36 (ref), fFlagSduiFocusNavActionsStructured (copy), p37 (ref), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), frozen (copy)
			local ok, status, var40 = pcall(function()
				-- upvalues: resolveTablePropValue (copy), p38 (ref), var37 (copy), var38 (copy), var39 (copy), p32 (copy), p33 (copy), p34 (copy), p35 (copy), p36 (copy)
				local var41, var42 = resolveTablePropValue(p38, var37, var38, var39, p32, p33, p34, p35, p36)
				
				return var41, var42
			end)
			
			if not ok then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = sduiParseHelpersModule.stringifyValue(status),
					name = p33.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
				}, p33.appPage)
				
				return frozen
			elseif fFlagSduiFocusNavActionsStructured and p37 and status ~= nil then
				local ok_1, status_1 = pcall(function()
					-- upvalues: p37 (copy), status (write)
					return p37(status)
				end)
				
				if not ok_1 then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
						value = sduiParseHelpersModule.stringifyValue(status),
						message = `Failed to apply propParser to table prop {sduiParseHelpersModule.stringifyValue(status_1)}`,
						name = p33.debugName,
						componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
						parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
					}, p33.appPage)
					
					return frozen
				end
				status = status_1
			end
			return { data = status, status = var40 }
		end, tutilsModule.shallowEqual)
	end,
	selectConditionalOption = selectConditionalOption,
	evaluateCondition = evaluateCondition,
	resolveHydrationBinding = resolveHydrationBinding,
	resolveBindingPathValue = resolveBindingPathValue,
	resolveTablePropValue = resolveTablePropValue,
	resolveSourceArray = function(p32, p33, p34, p35, p36, p37)
		-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), resolveBindingPathValue (ref), fFlagSduiClientPageScope (ref)
		return if p32 == "binding_path" then resolveBindingPathValue(p34, if fFlagSduiRenderPerf then splitDottedPathModule(p33) else string.split(p33, "."), p35, p36, nil, nil, if fFlagSduiClientPageScope then p37 else nil) elseif p32 == "literal" then p33 and p33.items else nil
	end,
	resolveFieldMap = function(p32, p33, p34, p35, p36, p37, p38)
		-- upvalues: resolveTablePropValue (ref)
		local var37, var38 = p38(p32, p33, p34, p35, p36)
		
		return resolveTablePropValue(p37, var37, var38, nil, p33, p35, p36, p34, nil)
	end,
	mapArrayWithFieldMap = function(p32, p33, p34, p35, p36, p37, p38)
		-- upvalues: buildDataBindingSourcesForTemplateModule (ref), resolveTablePropValue (ref)
		local t = {}
		
		for i, v in p32 do
			local var37 = buildDataBindingSourcesForTemplateModule(v, p33)
			
			local var38 = function()
				-- upvalues: var37 (ref)
				return var37
			end
			
			local var39 = function()
				-- upvalues: v (ref)
				return v
			end
			
			local var40, var41 = p38(p34, var38, var39, p35, p36)
			table.insert(t, resolveTablePropValue(p37, var40, var41, nil, var38, p35, p36, var39, nil))
		end
		return t
	end,
	isComponentVisible = function(p39, p40)
		return p39.isComponentFilteredSignal == nil or p39.isComponentFilteredSignal(p40).data ~= true
	end,
	resolveTemplate = if fFlagSduiInlineNestedComponentSchema then function(p39, p40, p41)
		if p40 ~= nil then
			return p40
		elseif p39 == nil or p39 == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p41.getTemplateForRobloxComponent(p39)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p39}`)
		end
		return templateForRobloxComponent
	end else function(p42, p43)
		if p42 == nil then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p43.getTemplateForRobloxComponent(p42)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p42}`)
		end
		return templateForRobloxComponent
	end,
	resolveTemplateFromData = if fFlagSduiInlineNestedComponentSchema then function(p44, p45)
		local inlineComponent = p44.inline_component
		local robloxComponent = p44.roblox_component
		
		if inlineComponent ~= nil then
			return inlineComponent
		elseif robloxComponent == nil or robloxComponent == "" then
			error("Missing roblox_component")
		end
		local templateForRobloxComponent = p45.getTemplateForRobloxComponent(robloxComponent)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {robloxComponent}`)
		end
		return templateForRobloxComponent
	end else nil
}