local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local GetOperationASTFromRequestFunction = require(script.Parent.getOperationASTFromRequest).getOperationASTFromRequest
local GraphQLModule = require(Parent.GraphQL)
local Kind = GraphQLModule.Kind
local IsListTypeFunction = GraphQLModule.isListType
local GetNullableTypeFunction = GraphQLModule.getNullableType
local IsAbstractTypeFunction = GraphQLModule.isAbstractType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local TypeNameMetaFieldDef = GraphQLModule.TypeNameMetaFieldDef
local SchemaMetaFieldDef = GraphQLModule.SchemaMetaFieldDef
local CollectFieldsModule = require(script.Parent.collectFields)
local CollectFieldsFunction = CollectFieldsModule.collectFields
local CollectSubFieldsFunction = CollectFieldsModule.collectSubFields
local _ = require(script.Parent.Interfaces)
local _ = require(script.Parent.types)
local NULL = GraphQLModule.NULL
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local Callback3 = nil
local Callback4 = nil
local Callback6 = nil
local Callback5 = nil

local function visitData(p1, Callback, Callback1)
	-- upvalues: Boolean (copy), Array (copy), visitData (copy)
	if Boolean.toJSBoolean(Array.isArray(p1)) then
		return Array.map(p1, function(p2)
			-- upvalues: visitData (upval), Callback (copy), Callback1 (copy)
			return visitData(p2, Callback, Callback1)
		end)
	end
	if typeof(p1) ~= "table" then
		return p1
	end
	local CallbackResult = if Callback == nil then p1 else Callback(p1)
	
	if CallbackResult ~= nil then
		for i in CallbackResult do
			CallbackResult[i] = visitData(CallbackResult[tostring(i)], Callback, Callback1)
		end
	end
	return if Callback1 == nil then CallbackResult else Callback1(CallbackResult)
end

local VisitResultModule = {
	visitData = visitData,
	visitErrors = function(p2, Callback)
		-- upvalues: Array (copy)
		return Array.map(p2, function(p3)
			-- upvalues: Callback (copy)
			return Callback(p3)
		end)
	end,
	visitResult = function(p2, p3, p4, p5, p6)
		-- upvalues: Array (copy), Kind (copy), Boolean (copy), Map (copy), Set (copy), GetOperationASTFromRequestFunction (copy), Callback (ref), Callback1 (ref)
		local ReduceResult = Array.reduce(p3.document.definitions, function(p7, p8)
			-- upvalues: Kind (upval)
			if p8.kind == Kind.FRAGMENT_DEFINITION then
				p7[tostring(p8.name.value)] = p8
			end
			return p7
		end, {})
		local Variables = if Boolean.toJSBoolean(p3.variables) then p3.variables else {}
		local config = { segmentInfoMap = Map.new(), unpathedErrors = Set.new() }
		local Data = p2.data
		local Errors = p2.errors
		local v1: boolean = Errors ~= nil and p6 ~= nil
		local OperationASTFromRequest = GetOperationASTFromRequestFunction(p3)
		
		if Data ~= nil and OperationASTFromRequest ~= nil then
			p2.data = Callback(Data, OperationASTFromRequest, p4, ReduceResult, Variables, p5, if Boolean.toJSBoolean(v1) then Errors else nil, config)
		end
		if Boolean.toJSBoolean(Errors ~= nil and p6) then
			p2.errors = Callback1(Errors, p6, config)
		end
		return p2
	end
}

Callback1 = function(Errors, p2, p3)
	-- upvalues: Array (copy), Boolean (copy)
	local SegmentInfoMap = p3.segmentInfoMap
	local UnpathedErrors = p3.unpathedErrors
	local UnpathedFunction = p2.__unpathed
	
	return Array.map(Errors, function(p4)
		-- upvalues: SegmentInfoMap (copy), Array (upval), p2 (copy), Boolean (upval), UnpathedFunction (copy), UnpathedErrors (copy)
		local GetResult = SegmentInfoMap:get(p4)
		local ReduceResult = if GetResult == nil then p4 else Array.reduce(Array.reverse(Array.concat({}, GetResult)), function(p5, p6)
			-- upvalues: p2 (upval)
			local v1 = p2[p6.type.name]
			
			if v1 == nil then
				return p5
			else
				local Callback = v1[tostring(p6.fieldName)]
				
				return if Callback == nil then p5 else Callback(p5, p6.pathIndex)
			end
		end, p4)
		
		return if Boolean.toJSBoolean(if Boolean.toJSBoolean(UnpathedFunction) then UnpathedErrors:has(p4) else UnpathedFunction) then UnpathedFunction(ReduceResult) else ReduceResult
	end)
end

local function _(p2, p3)
	local Operation = p3.operation
	
	return if Operation == "query" then p2:getQueryType() elseif Operation == "mutation" then p2:getMutationType() elseif Operation == "subscription" then p2:getSubscriptionType() else nil
end

Callback = function(p2, p3, p4, ReduceResult, Variables, p5, p6, p7)
	-- upvalues: CollectFieldsFunction (copy), Map (copy), Set (copy), Callback2 (ref)
	local Operation = p3.operation
	local QueryType = if Operation == "query" then p4:getQueryType() elseif Operation == "mutation" then p4:getMutationType() elseif Operation == "subscription" then p4:getSubscriptionType() else nil
	
	return Callback2(p2, QueryType, CollectFieldsFunction(p4, ReduceResult, Variables, QueryType, p3.selectionSet, Map.new(), Set.new()), p4, ReduceResult, Variables, p5, 1, p6, p7)
end

Callback2 = function(NULL, QueryType, List, p2, p3, p4, p5, p6: number, p7, p8)
	-- upvalues: Callback3 (ref), TypeNameMetaFieldDef (copy), SchemaMetaFieldDef (copy), Callback6 (ref), Callback5 (ref), Callback4 (ref)
	local Fields = QueryType:getFields()
	local v1 = if typeof(p5) == "table" then p5[QueryType.name] else nil
	local Enter = if typeof(v1) == "table" then v1.__enter else nil
	local NULL1 = if Enter == nil then NULL else Enter(NULL)
	local ErrorMap = nil
	
	if p7 ~= nil then
		local CallbackResult = Callback3(p7, p6)
		ErrorMap = CallbackResult.errorMap
		
		for _, unpathedError in CallbackResult.unpathedErrors do
			p8.unpathedErrors:add(unpathedError)
		end
	end
	for _, value in List do
		local Unpacked, Unpacked2 = table.unpack(value, 1, 2)
		local Value = Unpacked2[1].name.value
		local Type = if typeof(Fields:get(Value)) == "table" then Fields:get(Value).type else nil
		
		if Type == nil then
			if Value == "__typename" then
				Type = TypeNameMetaFieldDef.type
			elseif Value == "__schema" then
				Type = SchemaMetaFieldDef.type
			end
		end
		local PathIndex = p6 + 1
		local v2 = nil
		
		if ErrorMap then
			v2 = ErrorMap[tostring(Unpacked)]
			
			if v2 ~= nil then
				ErrorMap[tostring(Unpacked)] = nil
			end
			Callback6(QueryType, Value, PathIndex, v2, p8)
		end
		Callback4(NULL1, Unpacked, Callback5(NULL[tostring(Unpacked)], Type, Unpacked2, p2, p3, p4, p5, PathIndex, v2, p8), v1, Value)
	end
	local Typename = NULL1.__typename
	
	if Typename ~= nil then
		Callback4(NULL1, "__typename", Typename, v1, "__typename")
	end
	if ErrorMap then
		for i in ErrorMap do
			for _, value1 in ErrorMap[i] do
				p8.unpathedErrors:add(value1)
			end
		end
	end
	local Leave = if typeof(v1) == "table" then v1.__leave else nil
	
	return if Leave == nil then NULL1 else Leave(NULL1)
end

Callback4 = function(p9, p10, Typename, p11, p12)
	if p11 == nil then
		p9[tostring(p10)] = Typename
		
		return
	end
	local Callback = p11[p12]
	
	if Callback == nil then
		p9[tostring(p10)] = Typename
		
		return
	end
	local CallbackResult = Callback(Typename)
	
	if CallbackResult == nil then
		p9[tostring(p10)] = nil
		
		return
	else
		p9[tostring(p10)] = CallbackResult
	end
end

local function visitListValue(NULL, OfType, p9, p10, p11, p12, p13, p14, p15, p16)
	-- upvalues: Array (copy), Callback5 (ref)
	return Array.map(NULL, function(p17)
		-- upvalues: Callback5 (upval), OfType (copy), p9 (copy), p10 (copy), p11 (copy), p12 (copy), p13 (copy), p14 (copy), p15 (copy), p16 (copy)
		return Callback5(p17, OfType, p9, p10, p11, p12, p13, p14 + 1, p15, p16)
	end)
end

Callback5 = function(NULL1, Type, p9, p10, p11, p12, p13, p14, p15, p16)
	-- upvalues: NULL (copy), GetNullableTypeFunction (copy), Boolean (copy), IsListTypeFunction (copy), visitListValue (copy), IsAbstractTypeFunction (copy), CollectSubFieldsFunction (copy), Callback2 (ref), IsObjectTypeFunction (copy)
	local T = if p15 == nil then {} else p15
	
	if NULL1 == nil or NULL1 == NULL then
		return NULL1
	end
	local NullableType = GetNullableTypeFunction(Type)
	
	if Boolean.toJSBoolean(IsListTypeFunction(NullableType)) then
		return visitListValue(NULL1, NullableType.ofType, p9, p10, p11, p12, p13, p14, T, p16)
	elseif Boolean.toJSBoolean(IsAbstractTypeFunction(NullableType)) then
		local Type1 = p10:getType(NULL1.__typename)
		
		return Callback2(NULL1, Type1, CollectSubFieldsFunction(p10, p11, p12, Type1, p9), p10, p11, p12, p13, p14, T, p16)
	elseif Boolean.toJSBoolean(IsObjectTypeFunction(NullableType)) then
		return Callback2(NULL1, NullableType, CollectSubFieldsFunction(p10, p11, p12, NullableType, p9), p10, p11, p12, p13, p14, T, p16)
	else
		local Callback = if typeof(p13) == "table" then p13[NullableType.name] else nil
		
		if Callback == nil then
			return NULL1
		else
			local CallbackResult = Callback(NULL1)
			
			return if CallbackResult == nil then NULL1 else CallbackResult
		end
	end
end

Callback3 = function(List, p9)
	-- upvalues: Set (copy), Array (copy), Object (copy)
	local ErrorMap = {}
	local NewSet = Set.new()
	
	for _, value in List do
		local PathEntry = if typeof(value.path) == "table" then value.path[p9] else nil
		
		if PathEntry == nil then
			NewSet:add(value)
		elseif Array.indexOf(Object.keys(ErrorMap), (tostring(PathEntry))) == -1 then
			ErrorMap[tostring(PathEntry)] = { value }
		else
			table.insert(ErrorMap[tostring(PathEntry)], value)
		end
	end
	return { errorMap = ErrorMap, unpathedErrors = NewSet }
end

Callback6 = function(p10, FieldName, PathIndex, p11, p12)
	local T = if p11 == nil then {} else p11
	for _, value in T do
		local config = { type = p10, fieldName = FieldName, pathIndex = PathIndex }
		local GetResult = p12.segmentInfoMap:get(value)
		
		if GetResult == nil then
			p12.segmentInfoMap:set(value, { config })
		else
			table.insert(GetResult, config)
		end
	end
end

return VisitResultModule