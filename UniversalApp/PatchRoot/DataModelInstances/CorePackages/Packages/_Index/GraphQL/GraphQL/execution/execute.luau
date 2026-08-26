local parent = script.Parent.Parent
local jsutils = parent.jsutils
local error = parent.error
local language = parent.language
local type = parent.type
local utilities = parent.utilities
local luaUtils = parent.luaUtils
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error_1 = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local set = luauPolyfillModule.Set
local instanceof = luauPolyfillModule.instanceof
local _ = require(jsutils.ObjMap)
local _ = require(jsutils.PromiseOrValue)
local promiseModule = require(parent.Parent.Promise)
local nullModule = require(luaUtils.null)
local isNillish = require(luaUtils.isNillish).isNillish
local inspect = require(jsutils.inspect).inspect
local memoize3 = require(jsutils.memoize3).memoize3
local invariant = require(jsutils.invariant).invariant
local devAssert = require(jsutils.devAssert).devAssert
local isPromise = require(jsutils.isPromise).isPromise
local isObjectLike = require(jsutils.isObjectLike).isObjectLike
local promiseReduce = require(jsutils.promiseReduce).promiseReduce
local promiseForObject = require(jsutils.promiseForObject).promiseForObject
local pathModule = require(jsutils.Path)
local addPath = pathModule.addPath
local pathToArray = pathModule.pathToArray
local isIteratableObject = require(jsutils.isIteratableObject).isIteratableObject
local _ = require(error.formatError)
local graphQLError = require(error.GraphQLError).GraphQLError
local locatedError = require(error.locatedError).locatedError
local _ = require(language.ast)
local kind = require(parent.language.kinds).Kind
local _ = require(type.schema)
local definitionModule = require(type.definition)
local assertValidSchema = require(type.validate).assertValidSchema
local introspectionModule = require(type.introspection)
local schemaMetaFieldDef = introspectionModule.SchemaMetaFieldDef
local typeMetaFieldDef = introspectionModule.TypeMetaFieldDef
local typeNameMetaFieldDef = introspectionModule.TypeNameMetaFieldDef
local directivesModule = require(type.directives)
local graphQLIncludeDirective = directivesModule.GraphQLIncludeDirective
local graphQLSkipDirective = directivesModule.GraphQLSkipDirective
local isObjectType = definitionModule.isObjectType
local isAbstractType = definitionModule.isAbstractType
local isLeafType = definitionModule.isLeafType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local typeFromAST = require(utilities.typeFromAST).typeFromAST
local getOperationRootType = require(utilities.getOperationRootType).getOperationRootType
local valuesModule = require(script.Parent.values)
local getVariableValues = valuesModule.getVariableValues
local getArgumentValues = valuesModule.getArgumentValues
local getDirectiveValues = valuesModule.getDirectiveValues
local _ = nil
local _ = nil
local assertValidExecutionArguments = nil
local buildExecutionContext = nil
local collectFields = nil
local buildResolveInfo = nil
local var1 = nil
local var2 = nil
local var3 = nil
local buildResponse = nil
local executeOperation = nil
local executeFieldsSerially = nil
local executeFields = nil
local shouldIncludeNode = nil
local doesFragmentConditionMatch = nil
local getFieldEntryKey = nil
local resolveField = nil
local handleFieldError = nil
local completeValue = nil
local completeListValue = nil
local completeLeafValue = nil
local completeAbstractValue = nil
local ensureValidRuntimeType = nil
local completeObjectValue = nil
local invalidReturnTypeError = nil
local collectAndExecuteSubfields = nil
local _ = nil
local var4 = nil

local function execute(p1)
	-- upvalues: assertValidExecutionArguments (write), buildExecutionContext (write), array (ref), executeOperation (write), buildResponse (write)
	local schema = p1.schema
	local document = p1.document
	local rootValue = p1.rootValue
	local contextValue = p1.contextValue
	local variableValues = p1.variableValues
	local operationName = p1.operationName
	local fieldResolver = p1.fieldResolver
	local typeResolver = p1.typeResolver
	assertValidExecutionArguments(schema, document, variableValues)
	local var5 = buildExecutionContext(schema, document, rootValue, contextValue, variableValues, operationName, fieldResolver, typeResolver)
	
	return if array.isArray(var5) or not var5.schema then { errors = var5 } else buildResponse(var5, executeOperation(var5, var5.operation, rootValue))
end

local function executeSync(p1)
	-- upvalues: execute (write), isPromise (ref), error_1 (ref)
	local var5 = execute(p1)
	
	if isPromise(var5) then
		error(error_1.new("GraphQL execution failed to complete synchronously."))
	end
	return var5
end

buildResponse = function(p1, p2)
	-- upvalues: isPromise (ref), buildResponse (write)
	return if isPromise(p2) then p2:andThen(function(p3)
		-- upvalues: buildResponse (copy), p1 (ref)
		return buildResponse(p1, p3)
	end) elseif #p1.errors == 0 then { data = p2 } else { errors = p1.errors, data = p2 }
end

assertValidExecutionArguments = function(p1, p2, p3)
	-- upvalues: devAssert (ref), assertValidSchema (ref), isObjectLike (ref)
	devAssert(p2, "Must provide document.")
	assertValidSchema(p1)
	devAssert(if p3 ~= nil then isObjectLike(p3) else true, "Variables must be provided as an Object where each property is a variable value. Perhaps look to see if an unparsed JSON string was provided.")
end

buildExecutionContext = function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: kind (ref), graphQLError (ref), getVariableValues (ref), var2 (write), var1 (write)
	local var5 = nil
	local t = {}
	
	for i, v in ipairs(p2.definitions) do
		if v.kind == kind.OPERATION_DEFINITION then
			if p6 == nil then
				if var5 == nil then
					var5 = v
					continue
				end
				return {
					graphQLError.new("Must provide operation name if query contains multiple operations.")
				}
			elseif (v.name and v.name.value) == p6 then
				var5 = v
			end
		elseif v.kind == kind.FRAGMENT_DEFINITION then
			t[v.name.value] = v
		end
	end
	if var5 then
		local var6 = getVariableValues(p1, var5.variableDefinitions or {}, p5 or {}, { maxErrors = 50 })
		
		return if var6.errors then var6.errors else {
			schema = p1,
			fragments = t,
			rootValue = p3,
			contextValue = p4,
			operation = var5,
			variableValues = var6.coerced,
			fieldResolver = p7 or var2,
			typeResolver = p8 or var1,
			errors = {}
		}
	end
	return if p6 == nil then { graphQLError.new("Must provide an operation.") } else {
		graphQLError.new(("Unknown operation named \"%s\"."):format(p6))
	}
end

executeOperation = function(p9, p10, p11)
	-- upvalues: getOperationRootType (ref), collectFields (write), map (ref), executeFieldsSerially (write), executeFields (write), isPromise (ref), promiseModule (ref), nullModule (ref)
	local var7, var8
	local var9 = getOperationRootType(p9.schema, p10)
	local var10 = collectFields(p9, var9, p10.selectionSet, map.new(), {})
	local _ = nil
	local _ = nil
	
	if p10.operation == "mutation" then
		local ok, status = pcall(executeFieldsSerially, p9, var9, p11, nil, var10)
		var7 = ok
		var8 = status
	else
		local ok, status = pcall(executeFields, p9, var9, p11, nil, var10)
		var7 = ok
		var8 = status
	end
	if isPromise(var8) then
		return var8:andThen(nil, function(p12)
			-- upvalues: p9 (ref), promiseModule (copy), nullModule (copy)
			table.insert(p9.errors, p12)
			
			return promiseModule.resolve(nullModule)
		end)
	elseif var7 then
		return var8
	end
	table.insert(p9.errors, var8)
	
	return nullModule
end

executeFieldsSerially = function(p9, p10, p11, p12, p13)
	-- upvalues: promiseReduce (ref), addPath (ref), resolveField (write), isPromise (ref)
	return promiseReduce(p13:keys(), function(p14, p15)
		-- upvalues: p13 (ref), addPath (copy), p12 (ref), p10 (ref), resolveField (copy), p9 (ref), p11 (ref), isPromise (copy)
		local var7 = resolveField(p9, p10, p11, p13[p15], addPath(p12, p15, p10.name))
		
		if var7 == nil then
			return p14
		elseif isPromise(var7) then
			return var7:andThen(function(p16)
				-- upvalues: p14 (ref), p15 (ref)
				p14[p15] = p16
				
				return p14
			end)
		end
		p14[p15] = var7
		
		return p14
	end, {})
end

executeFields = function(p9, p10, p11, p12, p13)
	-- upvalues: addPath (ref), resolveField (write), isPromise (ref), promiseForObject (ref)
	local t = {}
	local var7 = false
	
	for i, v in ipairs(p13:keys()) do
		local var8 = resolveField(p9, p10, p11, p13[v], addPath(p12, v, p10.name))
		
		if var8 ~= nil then
			t[v] = var8
			
			if isPromise(var8) then
				var7 = true
			end
		end
	end
	return if var7 then promiseForObject(t) else t
end

collectFields = function(p14, p15, p16, p17, p18)
	-- upvalues: kind (ref), shouldIncludeNode (write), getFieldEntryKey (write), doesFragmentConditionMatch (write), collectFields (write)
	for i, v in ipairs(p16.selections) do
		if v.kind == kind.FIELD then
			if shouldIncludeNode(p14, v) then
				local var9 = getFieldEntryKey(v)
				
				if not p17[var9] then
					p17[var9] = {}
				end
				table.insert(p17[var9], v)
			end
		elseif v.kind == kind.INLINE_FRAGMENT then
			if shouldIncludeNode(p14, v) and doesFragmentConditionMatch(p14, v, p15) then
				collectFields(p14, p15, v.selectionSet, p17, p18)
			end
		elseif v.kind == kind.FRAGMENT_SPREAD then
			local value = v.name.value
			
			if not p18[value] and shouldIncludeNode(p14, v) then
				p18[value] = true
				local var10 = p14.fragments[value]
				
				if var10 and doesFragmentConditionMatch(p14, var10, p15) then
					collectFields(p14, p15, var10.selectionSet, p17, p18)
				end
			end
		end
	end
	return p17
end

shouldIncludeNode = function(p19, p20)
	-- upvalues: getDirectiveValues (ref), graphQLSkipDirective (ref), graphQLIncludeDirective (ref)
	local var11 = getDirectiveValues(graphQLSkipDirective, p20, p19.variableValues)
	
	if (var11 and var11["if"]) == true then
		return false
	end
	local var12 = getDirectiveValues(graphQLIncludeDirective, p20, p19.variableValues)
	
	return (var12 and var12["if"]) ~= false
end

doesFragmentConditionMatch = function(p19, p20, p21)
	-- upvalues: typeFromAST (ref), isAbstractType (ref)
	local typeCondition = p20.typeCondition
	
	if not typeCondition then
		return true
	end
	local var11 = typeFromAST(p19.schema, typeCondition)
	
	return var11 == p21 or (if isAbstractType(var11) then p19.schema:isSubType(var11, p21) else false)
end

getFieldEntryKey = function(p19)
	return if p19.alias then p19.alias.value else p19.name.value
end

resolveField = function(p19, p20, p21, p22, p23)
	-- upvalues: var3 (write), buildResolveInfo (write), getArgumentValues (ref), isPromise (ref), completeValue (write), locatedError (ref), pathToArray (ref), handleFieldError (write)
	local var11 = var3(p19.schema, p20, p22[1].name.value)
	
	if not var11 then return end
	local type = var11.type
	local var12 = if var11.resolve then var11.resolve else p19.fieldResolver
	local var13 = buildResolveInfo(p19, var11, p22, p20, p23)
	local ok, status = pcall(function()
		-- upvalues: getArgumentValues (copy), var11 (ref), p22 (ref), p19 (ref), var12 (ref), p21 (ref), var13 (ref), isPromise (copy), completeValue (copy), type (ref), p23 (ref), locatedError (copy), pathToArray (copy), handleFieldError (copy)
		local var14 = var12(p21, getArgumentValues(var11, p22[1], p19.variableValues), p19.contextValue, var13)
		local var15 = if isPromise(var14) then var14:andThen(function(p24)
			-- upvalues: completeValue (copy), p19 (copy), type (copy), p22 (copy), var13 (copy), p23 (copy)
			return completeValue(p19, type, p22, var13, p23, p24)
		end) else completeValue(p19, type, p22, var13, p23, var14)
		
		return if isPromise(var15) then var15:andThen(nil, function(p24)
			-- upvalues: locatedError (copy), p22 (copy), pathToArray (copy), p23 (copy), handleFieldError (copy), type (copy), p19 (copy)
			return handleFieldError(locatedError(p24, p22, pathToArray(p23)), type, p19)
		end) else var15
	end)
	
	return if ok then status else handleFieldError(locatedError(status, p22, pathToArray(p23)), type, p19)
end

buildResolveInfo = function(p19, p20, p21, p22, p23)
	return {
		fieldName = p20.name,
		fieldNodes = p21,
		returnType = p20.type,
		parentType = p22,
		path = p23,
		schema = p19.schema,
		fragments = p19.fragments,
		rootValue = p19.rootValue,
		operation = p19.operation,
		variableValues = p19.variableValues
	}
end

handleFieldError = function(p19, p20, p21)
	-- upvalues: isNonNullType (ref), nullModule (ref)
	if isNonNullType(p20) then
		error(p19)
	end
	table.insert(p21.errors, p19)
	
	return nullModule
end

completeValue = function(p19, p20, p21, p22, p23, p24)
	-- upvalues: instanceof (ref), error_1 (ref), isNonNullType (ref), completeValue (write), isNillish (ref), nullModule (ref), isListType (ref), completeListValue (write), isLeafType (ref), completeLeafValue (write), isAbstractType (ref), completeAbstractValue (write), isObjectType (ref), completeObjectValue (write), invariant (ref), inspect (ref)
	if instanceof(p24, error_1) then
		error(p24)
	end
	if isNonNullType(p20) then
		local var11 = completeValue(p19, p20.ofType, p21, p22, p23, p24)
		
		if isNillish(var11) then
			error(error_1.new(("Cannot return null for non-nullable field %s.%s."):format(p22.parentType.name, p22.fieldName)))
		end
		return var11
	elseif isNillish(p24) then
		return nullModule
	elseif isListType(p20) then
		return completeListValue(p19, p20, p21, p22, p23, p24)
	elseif isLeafType(p20) then
		return completeLeafValue(p20, p24)
	elseif isAbstractType(p20) then
		return completeAbstractValue(p19, p20, p21, p22, p23, p24)
	elseif isObjectType(p20) then
		return completeObjectValue(p19, p20, p21, p22, p23, p24)
	end
	invariant(false, "Cannot complete value of unexpected output type: " .. inspect(p20))
	assert(false, "Cannot complete value of unexpected output type: " .. inspect(p20))
end

completeListValue = function(p19, p20, p21, p22, p23, p24)
	-- upvalues: instanceof (ref), set (ref), isIteratableObject (ref), graphQLError (ref), array (ref), addPath (ref), isPromise (ref), completeValue (write), locatedError (ref), pathToArray (ref), handleFieldError (write), promiseModule (ref)
	if instanceof(p24, set) then
		local t = {}
		
		for i, v in p24 do
			table.insert(t, v)
		end
		p24 = t
	end
	if not isIteratableObject(p24) then
		error(graphQLError.new(("Expected Iterable, but did not find one for field \"%s.%s\"."):format(p22.parentType.name, p22.fieldName)))
	end
	local ofType = p20.ofType
	local var11 = false
	local var12 = false
	local var13 = array.from(p24, function(p25, p26)
		-- upvalues: addPath (copy), p23 (ref), isPromise (copy), completeValue (copy), p19 (ref), ofType (ref), p21 (ref), p22 (ref), var11 (write), locatedError (copy), pathToArray (copy), handleFieldError (copy), var12 (write)
		local var14 = addPath(p23, p26, nil)
		local ok, status = pcall(function()
			-- upvalues: isPromise (copy), p25 (ref), completeValue (copy), p19 (copy), ofType (copy), p21 (copy), p22 (copy), var14 (ref), var11 (copy), locatedError (copy), pathToArray (copy), handleFieldError (copy), var12 (copy)
			local var15 = if isPromise(p25) then p25:andThen(function(p27)
				-- upvalues: completeValue (copy), p19 (copy), ofType (copy), p21 (copy), p22 (copy), var14 (copy)
				return completeValue(p19, ofType, p21, p22, var14, p27)
			end) else completeValue(p19, ofType, p21, p22, var14, p25)
			
			if isPromise(var15) then
				var11 = true
				
				return var15:andThen(nil, function(p27)
					-- upvalues: locatedError (copy), p21 (copy), pathToArray (copy), var14 (copy), handleFieldError (copy), ofType (copy), p19 (copy)
					return handleFieldError(locatedError(p27, p21, pathToArray(var14)), ofType, p19)
				end)
			end
			var12 = true
			
			return var15
		end)
		
		return if ok then status else handleFieldError(locatedError(status, p21, pathToArray(var14)), ofType, p19)
	end)
	local var14 = var13
	return var14
end

completeLeafValue = function(p25, p26)
	-- upvalues: error_1 (ref), inspect (ref)
	local var15 = p25:serialize(p26)
	
	if var15 == nil then
		error(error_1.new(("Expected a value of type \"%s\" but "):format(inspect(p25)) .. ("received: %s"):format(inspect(p26))))
	end
	return var15
end

completeAbstractValue = function(value, p25, p26, p27, p28, p29)
	-- upvalues: isPromise (ref), completeObjectValue (write), ensureValidRuntimeType (write)
	local var15 = (if p25.resolveType then p25.resolveType else value.typeResolver)(p29, value.contextValue, p27, p25)
	
	return if isPromise(var15) then var15:andThen(function(p30)
		-- upvalues: completeObjectValue (copy), value (ref), ensureValidRuntimeType (copy), p25 (ref), p26 (ref), p27 (ref), p29 (ref), p28 (ref)
		return completeObjectValue(value, ensureValidRuntimeType(p30, value, p25, p26, p27, p29), p26, p27, p28, p29)
	end) else completeObjectValue(value, ensureValidRuntimeType(var15, value, p25, p26, p27, p29), p26, p27, p28, p29)
end

ensureValidRuntimeType = function(p25, p26, p27, p28, p29, p30)
	-- upvalues: graphQLError (ref), isObjectType (ref), inspect (ref)
	if p25 == nil then
		error(graphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\". Either the \"%s\" type should provide a \"resolveType\" function or each possible type should provide an \"isTypeOf\" function."):format(p27.name, p29.parentType.name, p29.fieldName, p27.name), p28))
	end
	if isObjectType(p25) then
		error(graphQLError.new("Support for returning GraphQLObjectType from resolveType was removed in graphql-js@16.0.0 please return type name instead."))
	end
	if typeof(p25) ~= "string" then
		error(graphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\" with "):format(p27.name, p29.parentType.name, p29.fieldName) .. ("value %s, received \"%s\"."):format(inspect(p30), inspect(p25))))
	end
	local var15 = p26.schema:getType(p25)
	
	if var15 == nil then
		error(graphQLError.new(("Abstract type \"%s\" was resolve to a type \"%s\" that does not exist inside schema."):format(p27.name, p25), p28))
	end
	if not isObjectType(var15) then
		error(graphQLError.new(("Abstract type \"%s\" was resolve to a non-object type \"%s\"."):format(p27.name, p25), p28))
	end
	if not p26.schema:isSubType(p27, var15) then
		error(graphQLError.new(("Runtime Object type \"%s\" is not a possible type for \"%s\"."):format(var15.name, p27.name), p28))
	end
	return var15
end

completeObjectValue = function(p25, p26, p27, p28, p29, p30)
	-- upvalues: isPromise (ref), invalidReturnTypeError (write), collectAndExecuteSubfields (write)
	if p26.isTypeOf ~= nil then
		local var15 = p26:isTypeOf(p30, p25.contextValue, p28)
		
		if isPromise(var15) then
			return var15:andThen(function(p31)
				-- upvalues: invalidReturnTypeError (copy), p26 (ref), p30 (ref), p27 (ref), collectAndExecuteSubfields (copy), p25 (ref), p29 (ref)
				if not p31 then
					error(invalidReturnTypeError(p26, p30, p27))
				end
				return collectAndExecuteSubfields(p25, p26, p27, p29, p30)
			end)
		elseif not var15 then
			error(invalidReturnTypeError(p26, p30, p27))
		end
	end
	return collectAndExecuteSubfields(p25, p26, p27, p29, p30)
end

invalidReturnTypeError = function(p25, p26, p27)
	-- upvalues: graphQLError (ref), inspect (ref)
	return graphQLError.new(("Expected value of type \"%s\" but got: %s."):format(p25.name, inspect(p26)), p27)
end

collectAndExecuteSubfields = function(p25, p26, p27, p28, p29)
	-- upvalues: var4 (write), executeFields (write)
	return executeFields(p25, p26, p29, p28, var4(p25, p26, p27))
end

var4 = memoize3(function(p25, p26, p27)
	-- upvalues: map (ref), collectFields (write)
	local var15 = map.new()
	local t = {}
	
	for i, v in ipairs(p27) do
		if v.selectionSet then
			var15 = collectFields(p25, p26, v.selectionSet, var15, t)
		end
	end
	return var15
end)

return {
	execute = execute,
	executeSync = executeSync,
	assertValidExecutionArguments = assertValidExecutionArguments,
	buildExecutionContext = buildExecutionContext,
	collectFields = collectFields,
	buildResolveInfo = buildResolveInfo,
	getFieldDef = function(p28, p29, p30)
		-- upvalues: schemaMetaFieldDef (ref), typeMetaFieldDef (ref), typeNameMetaFieldDef (ref)
		return if p30 == schemaMetaFieldDef.name and p28:getQueryType() == p29 then schemaMetaFieldDef elseif p30 == typeMetaFieldDef.name and p28:getQueryType() == p29 then typeMetaFieldDef elseif p30 == typeNameMetaFieldDef.name then typeNameMetaFieldDef else p29:getFields():get(p30)
	end,
	defaultFieldResolver = function(p28, p29, p30, p31)
		-- upvalues: isObjectLike (ref)
		if not isObjectLike(p28) and typeof(p28) ~= "function" then
			return nil
		end
		local fieldName = p28[p31.fieldName]
		
		return if typeof(fieldName) == "function" then p28[p31.fieldName](p28, p29, p30, p31) else fieldName
	end,
	defaultTypeResolver = function(p28, p29, p30, p31)
		-- upvalues: isObjectLike (ref), isPromise (ref), promiseModule (ref)
		if isObjectLike(p28) and typeof(p28.__typename) == "string" then
			return p28.__typename
		end
		local var16 = p30.schema:getPossibleTypes(p31)
		local t = {}
		
		for i = 1, #var16 do
			local var17 = var16[i]
			
			if not var17.isTypeOf then
				continue
			end
			local var18 = var17:isTypeOf(p28, p29, p30)
			
			if isPromise(var18) then
				t[i] = var18
			elseif not var18 then
				continue
			end
			return var17.name
		end
		return if #t > 0 then promiseModule.all(t):andThen(function(p32)
			-- upvalues: var16 (ref)
			for i = 1, #p32 do
				if not p32[i] then
					continue
				end
				return var16[i].name
			end
			return nil
		end) else nil
	end
}