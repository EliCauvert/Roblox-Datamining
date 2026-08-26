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

local function visitData(p1, p2, p3)
	-- upvalues: boolean (ref), array (ref), visitData (ref)
	if boolean.toJSBoolean(array.isArray(p1)) then
		return array.map(p1, function(p4)
			-- upvalues: visitData (copy), p2 (ref), p3 (ref)
			return visitData(p4, p2, p3)
		end)
	elseif typeof(p1) ~= "table" then
		return p1
	end
	local var1 = if p2 ~= nil then p1 else p2(p1)
	
	if var1 ~= nil then
		for i in var1 do
			var1[i] = visitData(var1[tostring(i)], p2, p3)
		end
	end
	return if p3 == nil then var1 else p3(var1)
end

t.visitData = visitData

function t.visitErrors(p4, p5)
	-- upvalues: array (ref)
	return array.map(p4, function(p6)
		-- upvalues: p5 (ref)
		return p5(p6)
	end)
end

function t.visitResult(p4, p5, p6, p7, p8)
	-- upvalues: array (ref), kind (ref), boolean (ref), map (ref), set (ref), getOperationASTFromRequest (ref), visitRoot (write), visitErrorsByType (write)
	local var2 = array.reduce(p5.document.definitions, function(p9, p10)
		-- upvalues: kind (copy)
		if p10.kind == kind.FRAGMENT_DEFINITION then
			p9[tostring(p10.name.value)] = p10
		end
		return p9
	end, {})
	local var3 = if boolean.toJSBoolean(p5.variables) then p5.variables else {}
	local t = { segmentInfoMap = map.new(), unpathedErrors = set.new() }
	local data = p4.data
	local errors = p4.errors
	local var4 = errors ~= nil and p8 ~= nil
	local var5 = getOperationASTFromRequest(p5)
	
	if data ~= nil and var5 ~= nil then
		p4.data = visitRoot(data, var5, p6, var2, var3, p7, if boolean.toJSBoolean(var4) then errors else nil, t)
	end
	if boolean.toJSBoolean(errors ~= nil and p8) then
		p4.errors = visitErrorsByType(errors, p8, t)
	end
	return p4
end

visitErrorsByType = function(p4, p5, p6)
	-- upvalues: array (ref), boolean (ref)
	local segmentInfoMap = p6.segmentInfoMap
	local unpathedErrors = p6.unpathedErrors
	local unpathed = p5.__unpathed
	
	return array.map(p4, function(p7)
		-- upvalues: segmentInfoMap (ref), array (copy), p5 (ref), boolean (copy), unpathed (ref), unpathedErrors (ref)
		local var2 = segmentInfoMap:get(p7)
		local var3 = if var2 == nil then p7 else array.reduce(array.reverse(array.concat({}, var2)), function(p8, p9)
			-- upvalues: p5 (copy)
			local name = p5[p9.type.name]
			
			if name == nil then
				return p8
			end
			local fieldName = name[tostring(p9.fieldName)]
			
			return if fieldName == nil then p8 else fieldName(p8, p9.pathIndex)
		end, p7)
		
		return if boolean.toJSBoolean(if boolean.toJSBoolean(unpathed) then unpathedErrors:has(p7) else unpathed) then unpathed(var3) else var3
	end)
end

local function _(p4, p5)
	local operation = p5.operation
	
	return if operation == "query" then p4:getQueryType() elseif operation == "mutation" then p4:getMutationType() elseif operation == "subscription" then p4:getSubscriptionType() else nil
end

visitRoot = function(p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: collectFields (ref), map (ref), set (ref), visitObjectValue (write)
	local operation = p5.operation
	local var2 = if operation == "query" then p6:getQueryType() elseif operation == "mutation" then p6:getMutationType() elseif operation == "subscription" then p6:getSubscriptionType() else nil
	
	return visitObjectValue(p4, var2, collectFields(p6, p7, p8, var2, p5.selectionSet, map.new(), set.new()), p6, p7, p8, p9, 1, p10, p11)
end

visitObjectValue = function(p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: sortErrorsByPathSegment (write), typeNameMetaFieldDef (ref), schemaMetaFieldDef (ref), addPathSegmentInfo (write), visitFieldValue (write), updateObject (write)
	local fields = p5:getFields()
	local var2 = if typeof(p10) == "table" then p10[p5.name] else nil
	local var3 = if typeof(var2) == "table" then var2.__enter else nil
	local var4 = if var3 ~= nil then p4 else var3(p4)
	local _ = nil
	local errorMap = nil
	
	if p12 ~= nil then
		local var5 = sortErrorsByPathSegment(p12, p11)
		errorMap = var5.errorMap
		
		for i, v in var5.unpathedErrors do
			p13.unpathedErrors:add(v)
		end
	end
	for i, v in p6 do
		local unpacked, unpacked_1 = table.unpack(v, 1, 2)
		local value = unpacked_1[1].name.value
		local var6 = if typeof(fields:get(value)) == "table" then fields:get(value).type else nil
		
		if var6 == nil then
			if value == "__typename" then
				var6 = typeNameMetaFieldDef.type
			elseif value == "__schema" then
				var6 = schemaMetaFieldDef.type
			end
		end
		local var7 = p11 + 1
		local var8 = nil
		
		if errorMap then
			var8 = errorMap[tostring(unpacked)]
			
			if var8 ~= nil then
				errorMap[tostring(unpacked)] = nil
			end
			addPathSegmentInfo(p5, value, var7, var8, p13)
		end
		updateObject(var4, unpacked, visitFieldValue(p4[tostring(unpacked)], var6, unpacked_1, p7, p8, p9, p10, var7, var8, p13), var2, value)
	end
	local typename = var4.__typename
	
	if typename ~= nil then
		updateObject(var4, "__typename", typename, var2, "__typename")
	end
	if errorMap then
		for i_1 in errorMap do
			for i_2, v_1 in errorMap[i_1] do
				p13.unpathedErrors:add(v_1)
			end
		end
	end
	local var9 = if typeof(var2) == "table" then var2.__leave else nil
	
	return if var9 == nil then var4 else var9(var4)
end

updateObject = function(p14, p15, p16, p17, p18)
	if p17 == nil then
		p14[tostring(p15)] = p16
		
		return
	end
	local var10 = p17[p18]
	
	if var10 == nil then
		p14[tostring(p15)] = p16
		
		return
	end
	local var11 = var10(p16)
	
	if var11 == nil then
		p14[tostring(p15)] = nil
		
		return
	end
	p14[tostring(p15)] = var11
end

local function visitListValue(p14, p15, p16, p17, p18, p19, p20, p21, p22, p23)
	-- upvalues: array (ref), visitFieldValue (write)
	return array.map(p14, function(p24)
		-- upvalues: visitFieldValue (copy), p15 (ref), p16 (ref), p17 (ref), p18 (ref), p19 (ref), p20 (ref), p21 (ref), p22 (ref), p23 (ref)
		return visitFieldValue(p24, p15, p16, p17, p18, p19, p20, p21 + 1, p22, p23)
	end)
end

visitFieldValue = function(p14, p15, p16, p17, p18, p19, p20, p21, p22, p23)
	-- upvalues: NULL (ref), getNullableType (ref), boolean (ref), isListType (ref), visitListValue (ref), isAbstractType (ref), collectSubFields (ref), visitObjectValue (write), isObjectType (ref)
	local var10 = if p22 ~= nil then {} else p22
	
	if p14 == nil or p14 == NULL then
		return p14
	end
	local var11 = getNullableType(p15)
	
	if boolean.toJSBoolean(isListType(var11)) then
		return visitListValue(p14, var11.ofType, p16, p17, p18, p19, p20, p21, var10, p23)
	elseif boolean.toJSBoolean(isAbstractType(var11)) then
		local typenameType = p17:getType(p14.__typename)
		
		return visitObjectValue(p14, typenameType, collectSubFields(p17, p18, p19, typenameType, p16), p17, p18, p19, p20, p21, var10, p23)
	elseif boolean.toJSBoolean(isObjectType(var11)) then
		return visitObjectValue(p14, var11, collectSubFields(p17, p18, p19, var11, p16), p17, p18, p19, p20, p21, var10, p23)
	end
	local var12 = if typeof(p20) == "table" then p20[var11.name] else nil
	
	if var12 == nil then
		return p14
	end
	local var13 = var12(p14)
	
	return if var13 == nil then p14 else var13
end

sortErrorsByPathSegment = function(p14, p15)
	-- upvalues: set (ref), array (ref), object (ref)
	local t = {}
	local var10 = set.new()
	
	for i, v in p14 do
		local var11 = if typeof(v.path) == "table" then v.path[p15] else nil
		
		if var11 == nil then
			var10:add(v)
		elseif array.indexOf(object.keys(t), tostring(var11)) == -1 then
			t[tostring(var11)] = { v }
		else
			table.insert(t[tostring(var11)], v)
		end
	end
	return { errorMap = t, unpathedErrors = var10 }
end

addPathSegmentInfo = function(p16, p17, p18, p19, p20)
	for i, v in if p19 ~= nil then {} else p19 do
		local t = { type = p16, fieldName = p17, pathIndex = p18 }
		local var12 = p20.segmentInfoMap:get(v)
		
		if var12 == nil then
			p20.segmentInfoMap:set(v, { t })
		else
			table.insert(var12, t)
		end
	end
end

return t