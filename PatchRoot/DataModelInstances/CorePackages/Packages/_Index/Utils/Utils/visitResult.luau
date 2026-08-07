-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local t = {}
local getOperationASTFromRequest = require(script.Parent.getOperationASTFromRequest).getOperationASTFromRequest
local graphQLModule = require(parent.GraphQL)
local kind = graphQLModule.Kind
local isListType = graphQLModule.isListType
local getNullableType = graphQLModule.getNullableType
local isAbstractType = graphQLModule.isAbstractType
local isObjectType = graphQLModule.isObjectType
local typeNameMetaFieldDef = graphQLModule.TypeNameMetaFieldDef
local schemaMetaFieldDef = graphQLModule.SchemaMetaFieldDef
local collectFieldsModule = require(script.Parent.collectFields)
local collectFields = collectFieldsModule.collectFields
local collectSubFields = collectFieldsModule.collectSubFields
local _ = require(script.Parent.Interfaces)
local _ = require(script.Parent.types)
local NULL = graphQLModule.NULL
local visitRoot = nil
local visitErrorsByType = nil
local visitObjectValue = nil
local sortErrorsByPathSegment = nil
local updateObject = nil
local addPathSegmentInfo = nil
local visitFieldValue = nil

local function visitData(p0, p1, p2) --[[ line: 101 ]]
	-- upvalues: boolean (ref), array (ref), visitData (ref)
	if boolean.toJSBoolean(array.isArray(p0)) then
		return array.map(p0, function(p3) --[[ line: 103 ]]
			-- upvalues: visitData (copy), p1 (ref), p2 (ref)
			return visitData(p3, p1, p2)
		end)
	elseif typeof(p0) ~= "table" then
		return p0
	end
	local var13 = if p1 ~= nil then p0 else p1(p0)
	
	if var13 ~= nil then
		for i in var13 do
			var13[i] = visitData(var13[tostring(i)], p1, p2)
		end
	end
	return if p2 == nil then var13 else p2(var13)
end

t.visitData = visitData

function t.visitErrors(p4, p5) --[[ line: 128 ]]
	-- upvalues: array (ref)
	return array.map(p4, function(p6) --[[ line: 132 ]]
		-- upvalues: p5 (ref)
		return p5(p6)
	end)
end

function t.visitResult(p7, p8, p9, p10, p11) --[[ line: 137 ]]
	-- upvalues: array (ref), kind (ref), boolean (ref), map (ref), set (ref), getOperationASTFromRequest (ref), visitRoot (write), visitErrorsByType (write)
	local var14 = array.reduce(p8.document.definitions, function(p12, p13) --[[ line: 144 ]]
		-- upvalues: kind (copy)
		if p13.kind == kind.FRAGMENT_DEFINITION then
			p12[tostring(p13.name.value)] = p13
		end
		return p12
	end, {})
	local var15 = if boolean.toJSBoolean(p8.variables) then p8.variables else {}
	local t = { segmentInfoMap = map.new(), unpathedErrors = set.new() }
	local data = p7.data
	local errors = p7.errors
	local var17 = errors ~= nil and p11 ~= nil
	local var18 = getOperationASTFromRequest(p8)
	
	if data ~= nil and var18 ~= nil then
		p7.data = visitRoot(data, var18, p9, var14, var15, p10, if boolean.toJSBoolean(var17) then errors else nil, t)
	end
	if boolean.toJSBoolean(errors ~= nil and p11) then
		p7.errors = visitErrorsByType(errors, p11, t)
	end
	return p7
end

visitErrorsByType = function(p14, p15, p16) --[[ line: 190 | named "visitErrorsByType" ]]
	-- upvalues: array (ref), boolean (ref)
	local segmentInfoMap = p16.segmentInfoMap
	local unpathedErrors = p16.unpathedErrors
	local unpathed = p15.__unpathed
	
	return array.map(p14, function(p17) --[[ line: 202 ]]
		-- upvalues: segmentInfoMap (ref), array (copy), p15 (ref), boolean (copy), unpathed (ref), unpathedErrors (ref)
		local var19 = segmentInfoMap:get(p17)
		local var20 = if var19 == nil then p17 else array.reduce(array.reverse(array.concat({}, var19)), function(p18, p19) --[[ line: 222 ]]
			-- upvalues: p15 (copy)
			local name = p15[p19.type.name]
			
			if name == nil then
				return p18
			end
			local fieldName = name[tostring(p19.fieldName)]
			
			return if fieldName == nil then p18 else fieldName(p18, p19.pathIndex)
		end, p17)
		
		return if boolean.toJSBoolean(if boolean.toJSBoolean(unpathed) then unpathedErrors:has(p17) else unpathed) then unpathed(var20) else var20
	end)
end

local function _(p20, p21) --[[ line: 250 | named "getOperationRootType" ]]
	local operation = p21.operation
	
	return if operation == "query" then p20:getQueryType() elseif operation == "mutation" then p20:getMutationType() elseif operation == "subscription" then p20:getSubscriptionType() else nil
end

visitRoot = function(p22, p23, p24, p25, p26, p27, p28, p29) --[[ line: 269 | named "visitRoot" ]]
	-- upvalues: collectFields (ref), map (ref), set (ref), visitObjectValue (write)
	local operation = p23.operation
	local var21 = if operation == "query" then p24:getQueryType() elseif operation == "mutation" then p24:getMutationType() elseif operation == "subscription" then p24:getSubscriptionType() else nil
	
	return visitObjectValue(p22, var21, collectFields(p24, p25, p26, var21, p23.selectionSet, map.new(), set.new()), p24, p25, p26, p27, 1, p28, p29)
end

visitObjectValue = function(p30, p31, p32, p33, p34, p35, p36, p37, p38, p39) --[[ line: 308 | named "visitObjectValue" ]]
	-- upvalues: sortErrorsByPathSegment (write), typeNameMetaFieldDef (ref), schemaMetaFieldDef (ref), addPathSegmentInfo (write), visitFieldValue (write), updateObject (write)
	local fields = p31:getFields()
	local var23 = if typeof(p36) == "table" then p36[p31.name] else nil
	local var24 = if typeof(var23) == "table" then var23.__enter else nil
	local var25 = if var24 ~= nil then p30 else var24(p30)
	local _ = nil
	local errorMap = nil
	
	if p38 ~= nil then
		local var26 = sortErrorsByPathSegment(p38, p37)
		errorMap = var26.errorMap
		
		for i, v in var26.unpathedErrors do
			p39.unpathedErrors:add(v)
		end
	end
	for i, v in p32 do
		local unpacked, unpacked_1 = table.unpack(v, 1, 2)
		local value = unpacked_1[1].name.value
		local var30 = if typeof(fields:get(value)) == "table" then fields:get(value).type else nil
		
		if var30 == nil then
			if value == "__typename" then
				var30 = typeNameMetaFieldDef.type
			elseif value == "__schema" then
				var30 = schemaMetaFieldDef.type
			end
		end
		local var31 = p37 + 1
		local var32 = nil
		
		if errorMap then
			var32 = errorMap[tostring(unpacked)]
			
			if var32 ~= nil then
				errorMap[tostring(unpacked)] = nil
			end
			addPathSegmentInfo(p31, value, var31, var32, p39)
		end
		updateObject(var25, unpacked, visitFieldValue(p30[tostring(unpacked)], var30, unpacked_1, p33, p34, p35, p36, var31, var32, p39), var23, value)
	end
	local typename = var25.__typename
	
	if typename ~= nil then
		updateObject(var25, "__typename", typename, var23, "__typename")
	end
	if errorMap then
		for i_1 in errorMap do
			for i_2, v_1 in errorMap[i_1] do
				p39.unpathedErrors:add(v_1)
			end
		end
	end
	local var27 = if typeof(var23) == "table" then var23.__leave else nil
	
	return if var27 == nil then var25 else var27(var25)
end

updateObject = function(p40, p41, p42, p43, p44) --[[ line: 438 | named "updateObject" ]]
	if p43 == nil then
		p40[tostring(p41)] = p42
		
		return
	end
	local var33 = p43[p44]
	
	if var33 == nil then
		p40[tostring(p41)] = p42
		
		return
	end
	local var34 = var33(p42)
	
	if var34 == nil then
		p40[tostring(p41)] = nil
		
		return
	end
	p40[tostring(p41)] = var34
end

local function visitListValue(p45, p46, p47, p48, p49, p50, p51, p52, p53, p54) --[[ line: 469 ]]
	-- upvalues: array (ref), visitFieldValue (write)
	return array.map(p45, function(p55) --[[ line: 481 ]]
		-- upvalues: visitFieldValue (copy), p46 (ref), p47 (ref), p48 (ref), p49 (ref), p50 (ref), p51 (ref), p52 (ref), p53 (ref), p54 (ref)
		return visitFieldValue(p55, p46, p47, p48, p49, p50, p51, p52 + 1, p53, p54)
	end)
end

visitFieldValue = function(p56, p57, p58, p59, p60, p61, p62, p63, p64, p65) --[[ line: 498 | named "visitFieldValue" ]]
	-- upvalues: NULL (ref), getNullableType (ref), boolean (ref), isListType (ref), visitListValue (ref), isAbstractType (ref), collectSubFields (ref), visitObjectValue (write), isObjectType (ref)
	local var35 = if p64 ~= nil then {} else p64
	
	if p56 == nil or p56 == NULL then
		return p56
	end
	local var36 = getNullableType(p57)
	
	if boolean.toJSBoolean(isListType(var36)) then
		return visitListValue(p56, var36.ofType, p58, p59, p60, p61, p62, p63, var35, p65)
	elseif boolean.toJSBoolean(isAbstractType(var36)) then
		local typenameType = p59:getType(p56.__typename)
		
		return visitObjectValue(p56, typenameType, collectSubFields(p59, p60, p61, typenameType, p58), p59, p60, p61, p62, p63, var35, p65)
	elseif boolean.toJSBoolean(isObjectType(var36)) then
		return visitObjectValue(p56, var36, collectSubFields(p59, p60, p61, var36, p58), p59, p60, p61, p62, p63, var35, p65)
	end
	local var38 = if typeof(p62) == "table" then p62[var36.name] else nil
	
	if var38 == nil then
		return p56
	end
	local var39 = var38(p56)
	
	return if var39 == nil then p56 else var39
end

sortErrorsByPathSegment = function(p66, p67) --[[ line: 589 | named "sortErrorsByPathSegment" ]]
	-- upvalues: set (ref), array (ref), object (ref)
	local t = {}
	local var41 = set.new()
	
	for i, v in p66 do
		local var42 = if typeof(v.path) == "table" then v.path[p67] else nil
		
		if var42 == nil then
			var41:add(v)
		elseif array.indexOf(object.keys(t), tostring(var42)) == -1 then
			t[tostring(var42)] = { v }
		else
			table.insert(t[tostring(var42)], v)
		end
	end
	return { errorMap = t, unpathedErrors = var41 }
end

addPathSegmentInfo = function(p68, p69, p70, p71, p72) --[[ line: 614 | named "addPathSegmentInfo" ]]
	for i, v in if p71 ~= nil then {} else p71 do
		local t = { type = p68, fieldName = p69, pathIndex = p70 }
		local var44 = p72.segmentInfoMap:get(v)
		
		if var44 == nil then
			p72.segmentInfoMap:set(v, { t })
		else
			table.insert(var44, t)
		end
	end
end

return t