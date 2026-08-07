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
local var12 = nil
local var13 = nil
local var14 = nil
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
local var32 = nil

local function execute(p0) --[[ line: 225 ]]
	-- upvalues: assertValidExecutionArguments (write), buildExecutionContext (write), array (ref), executeOperation (write), buildResponse (write)
	local schema = p0.schema
	local document = p0.document
	local rootValue = p0.rootValue
	local contextValue = p0.contextValue
	local variableValues = p0.variableValues
	local operationName = p0.operationName
	local fieldResolver = p0.fieldResolver
	local typeResolver = p0.typeResolver
	assertValidExecutionArguments(schema, document, variableValues)
	local var35 = buildExecutionContext(schema, document, rootValue, contextValue, variableValues, operationName, fieldResolver, typeResolver)
	
	return if array.isArray(var35) or not var35.schema then { errors = var35 } else buildResponse(var35, executeOperation(var35, var35.operation, rootValue))
end

local function executeSync(p1) --[[ line: 278 ]]
	-- upvalues: execute (write), isPromise (ref), error_1 (ref)
	local var36 = execute(p1)
	
	if isPromise(var36) then
		error(error_1.new("GraphQL execution failed to complete synchronously."))
	end
	return var36
end

buildResponse = function(p2, p3) --[[ line: 294 | named "buildResponse" ]]
	-- upvalues: isPromise (ref), buildResponse (write)
	return if isPromise(p3) then p3:andThen(function(p4) --[[ line: 301 ]]
		-- upvalues: buildResponse (copy), p2 (ref)
		return buildResponse(p2, p4)
	end) elseif #p2.errors == 0 then { data = p3 } else { errors = p2.errors, data = p3 }
end

assertValidExecutionArguments = function(p5, p6, p7) --[[ line: 320 | named "assertValidExecutionArguments" ]]
	-- upvalues: devAssert (ref), assertValidSchema (ref), isObjectLike (ref)
	devAssert(p6, "Must provide document.")
	assertValidSchema(p5)
	devAssert(if p7 ~= nil then isObjectLike(p7) else true, "Variables must be provided as an Object where each property is a variable value. Perhaps look to see if an unparsed JSON string was provided.")
end

buildExecutionContext = function(p8, p9, p10, p11, p12, p13, p14, p15) --[[ line: 345 | named "buildExecutionContext" ]]
	-- upvalues: kind (ref), graphQLError (ref), getVariableValues (ref), var13 (write), var12 (write)
	local var37 = nil
	local t = {}
	
	for i, v in ipairs(p9.definitions) do
		if v.kind == kind.OPERATION_DEFINITION then
			if p13 == nil then
				if var37 == nil then
					var37 = v
					continue
				end
				return {
					graphQLError.new("Must provide operation name if query contains multiple operations.")
				}
			elseif (v.name and v.name.value) == p13 then
				var37 = v
			end
		elseif v.kind == kind.FRAGMENT_DEFINITION then
			t[v.name.value] = v
		end
	end
	if var37 then
		local var39 = getVariableValues(p8, var37.variableDefinitions or {}, p12 or {}, { maxErrors = 50 })
		
		return if var39.errors then var39.errors else {
			schema = p8,
			fragments = t,
			rootValue = p10,
			contextValue = p11,
			operation = var37,
			variableValues = var39.coerced,
			fieldResolver = p14 or var13,
			typeResolver = p15 or var12,
			errors = {}
		}
	end
	return if p13 == nil then { graphQLError.new("Must provide an operation.") } else {
		graphQLError.new(("Unknown operation named \"%s\"."):format(p13))
	}
end

executeOperation = function(p16, p17, p18) --[[ line: 421 | named "executeOperation" ]]
	-- upvalues: getOperationRootType (ref), collectFields (write), map (ref), executeFieldsSerially (write), executeFields (write), isPromise (ref), promiseModule (ref), nullModule (ref)
	local var42, var43
	local var40 = getOperationRootType(p16.schema, p17)
	local var41 = collectFields(p16, var40, p17.selectionSet, map.new(), {})
	local _ = nil
	local _ = nil
	
	if p17.operation == "mutation" then
		local ok, status = pcall(executeFieldsSerially, p16, var40, p18, nil, var41)
		var42 = ok
		var43 = status
	else
		local ok, status = pcall(executeFields, p16, var40, p18, nil, var41)
		var42 = ok
		var43 = status
	end
	if isPromise(var43) then
		return var43:andThen(nil, function(p19) --[[ line: 450 ]]
			-- upvalues: p16 (ref), promiseModule (copy), nullModule (copy)
			table.insert(p16.errors, p19)
			
			return promiseModule.resolve(nullModule)
		end)
	elseif var42 then
		return var43
	end
	table.insert(p16.errors, var43)
	
	return nullModule
end

executeFieldsSerially = function(p20, p21, p22, p23, p24) --[[ line: 467 | named "executeFieldsSerially" ]]
	-- upvalues: promiseReduce (ref), addPath (ref), resolveField (write), isPromise (ref)
	return promiseReduce(p24:keys(), function(p25, p26) --[[ line: 477 ]]
		-- upvalues: p24 (ref), addPath (copy), p23 (ref), p21 (ref), resolveField (copy), p20 (ref), p22 (ref), isPromise (copy)
		local var44 = resolveField(p20, p21, p22, p24[p26], addPath(p23, p26, p21.name))
		
		if var44 == nil then
			return p25
		elseif isPromise(var44) then
			return var44:andThen(function(p27) --[[ line: 489 ]]
				-- upvalues: p25 (ref), p26 (ref)
				p25[p26] = p27
				
				return p25
			end)
		end
		p25[p26] = var44
		
		return p25
	end, {})
end

executeFields = function(p28, p29, p30, p31, p32) --[[ line: 508 | named "executeFields" ]]
	-- upvalues: addPath (ref), resolveField (write), isPromise (ref), promiseForObject (ref)
	local t = {}
	local var46 = false
	
	for i, v in ipairs(p32:keys()) do
		local var47 = resolveField(p28, p29, p30, p32[v], addPath(p31, v, p29.name))
		
		if var47 ~= nil then
			t[v] = var47
			
			if isPromise(var47) then
				var46 = true
			end
		end
	end
	return if var46 then promiseForObject(t) else t
end

collectFields = function(p33, p34, p35, p36, p37) --[[ line: 555 | named "collectFields" ]]
	-- upvalues: kind (ref), shouldIncludeNode (write), getFieldEntryKey (write), doesFragmentConditionMatch (write), collectFields (write)
	for i, v in ipairs(p35.selections) do
		if v.kind == kind.FIELD then
			if shouldIncludeNode(p33, v) then
				local var48 = getFieldEntryKey(v)
				
				if not p36[var48] then
					p36[var48] = {}
				end
				table.insert(p36[var48], v)
			end
		elseif v.kind == kind.INLINE_FRAGMENT then
			if shouldIncludeNode(p33, v) and doesFragmentConditionMatch(p33, v, p34) then
				collectFields(p33, p34, v.selectionSet, p36, p37)
			end
		elseif v.kind == kind.FRAGMENT_SPREAD then
			local value = v.name.value
			
			if not p37[value] and shouldIncludeNode(p33, v) then
				p37[value] = true
				local var49 = p33.fragments[value]
				
				if var49 and doesFragmentConditionMatch(p33, var49, p34) then
					collectFields(p33, p34, var49.selectionSet, p36, p37)
				end
			end
		end
	end
	return p36
end

shouldIncludeNode = function(p38, p39) --[[ line: 616 | named "shouldIncludeNode" ]]
	-- upvalues: getDirectiveValues (ref), graphQLSkipDirective (ref), graphQLIncludeDirective (ref)
	local var50 = getDirectiveValues(graphQLSkipDirective, p39, p38.variableValues)
	
	if (var50 and var50["if"]) == true then
		return false
	end
	local var51 = getDirectiveValues(graphQLIncludeDirective, p39, p38.variableValues)
	
	return (var51 and var51["if"]) ~= false
end

doesFragmentConditionMatch = function(p40, p41, p42) --[[ line: 638 | named "doesFragmentConditionMatch" ]]
	-- upvalues: typeFromAST (ref), isAbstractType (ref)
	local typeCondition = p41.typeCondition
	
	if not typeCondition then
		return true
	end
	local var52 = typeFromAST(p40.schema, typeCondition)
	
	return var52 == p42 or (if isAbstractType(var52) then p40.schema:isSubType(var52, p42) else false)
end

getFieldEntryKey = function(p43) --[[ line: 670 | named "getFieldEntryKey" ]]
	return if p43.alias then p43.alias.value else p43.name.value
end

resolveField = function(p44, p45, p46, p47, p48) --[[ line: 680 | named "resolveField" ]]
	-- upvalues: var14 (write), buildResolveInfo (write), getArgumentValues (ref), isPromise (ref), completeValue (write), locatedError (ref), pathToArray (ref), handleFieldError (write)
	local var53 = var14(p44.schema, p45, p47[1].name.value)
	
	if not var53 then return end
	local type = var53.type
	local var54 = if var53.resolve then var53.resolve else p44.fieldResolver
	local var55 = buildResolveInfo(p44, var53, p47, p45, p48)
	local ok, status = pcall(function() --[[ line: 711 ]]
		-- upvalues: getArgumentValues (copy), var53 (ref), p47 (ref), p44 (ref), var54 (ref), p46 (ref), var55 (ref), isPromise (copy), completeValue (copy), type (ref), p48 (ref), locatedError (copy), pathToArray (copy), handleFieldError (copy)
		local var56 = var54(p46, getArgumentValues(var53, p47[1], p44.variableValues), p44.contextValue, var55)
		local var57 = if isPromise(var56) then var56:andThen(function(p49) --[[ line: 736 ]]
			-- upvalues: completeValue (copy), p44 (copy), type (copy), p47 (copy), var55 (copy), p48 (copy)
			return completeValue(p44, type, p47, var55, p48, p49)
		end) else completeValue(p44, type, p47, var55, p48, var56)
		
		return if isPromise(var57) then var57:andThen(nil, function(p50) --[[ line: 746 ]]
			-- upvalues: locatedError (copy), p47 (copy), pathToArray (copy), p48 (copy), handleFieldError (copy), type (copy), p44 (copy)
			return handleFieldError(locatedError(p50, p47, pathToArray(p48)), type, p44)
		end) else var57
	end)
	
	return if ok then status else handleFieldError(locatedError(status, p47, pathToArray(p48)), type, p44)
end

buildResolveInfo = function(p51, p52, p53, p54, p55) --[[ line: 766 | named "buildResolveInfo" ]]
	return {
		fieldName = p52.name,
		fieldNodes = p53,
		returnType = p52.type,
		parentType = p54,
		path = p55,
		schema = p51.schema,
		fragments = p51.fragments,
		rootValue = p51.rootValue,
		operation = p51.operation,
		variableValues = p51.variableValues
	}
end

handleFieldError = function(p56, p57, p58) --[[ line: 789 | named "handleFieldError" ]]
	-- upvalues: isNonNullType (ref), nullModule (ref)
	if isNonNullType(p57) then
		error(p56)
	end
	table.insert(p58.errors, p56)
	
	return nullModule
end

completeValue = function(p59, p60, p61, p62, p63, p64) --[[ line: 827 | named "completeValue" ]]
	-- upvalues: instanceof (ref), error_1 (ref), isNonNullType (ref), completeValue (write), isNillish (ref), nullModule (ref), isListType (ref), completeListValue (write), isLeafType (ref), completeLeafValue (write), isAbstractType (ref), completeAbstractValue (write), isObjectType (ref), completeObjectValue (write), invariant (ref), inspect (ref)
	if instanceof(p64, error_1) then
		error(p64)
	end
	if isNonNullType(p60) then
		local var58 = completeValue(p59, p60.ofType, p61, p62, p63, p64)
		
		if isNillish(var58) then
			error(error_1.new(("Cannot return null for non-nullable field %s.%s."):format(p62.parentType.name, p62.fieldName)))
		end
		return var58
	elseif isNillish(p64) then
		return nullModule
	elseif isListType(p60) then
		return completeListValue(p59, p60, p61, p62, p63, p64)
	elseif isLeafType(p60) then
		return completeLeafValue(p60, p64)
	elseif isAbstractType(p60) then
		return completeAbstractValue(p59, p60, p61, p62, p63, p64)
	elseif isObjectType(p60) then
		return completeObjectValue(p59, p60, p61, p62, p63, p64)
	end
	invariant(false, "Cannot complete value of unexpected output type: " .. inspect(p60))
	assert(false, "Cannot complete value of unexpected output type: " .. inspect(p60))
end

completeListValue = function(p65, p66, p67, p68, p69, p70) --[[ line: 932 | named "completeListValue" ]]
	-- upvalues: instanceof (ref), set (ref), isIteratableObject (ref), graphQLError (ref), array (ref), addPath (ref), isPromise (ref), completeValue (write), locatedError (ref), pathToArray (ref), handleFieldError (write), promiseModule (ref)
	if instanceof(p70, set) then
		local t = {}
		
		for i, v in p70 do
			table.insert(t, v)
		end
		p70 = t
	end
	if not isIteratableObject(p70) then
		error(graphQLError.new(("Expected Iterable, but did not find one for field \"%s.%s\"."):format(p68.parentType.name, p68.fieldName)))
	end
	local ofType = p66.ofType
	local var60 = false
	local var61 = false
	local var62 = array.from(p70, function(p71, p72) --[[ line: 967 ]]
		-- upvalues: addPath (copy), p69 (ref), isPromise (copy), completeValue (copy), p65 (ref), ofType (ref), p67 (ref), p68 (ref), var60 (write), locatedError (copy), pathToArray (copy), handleFieldError (copy), var61 (write)
		local var64 = addPath(p69, p72, nil)
		local ok, status = pcall(function() --[[ line: 972 ]]
			-- upvalues: isPromise (copy), p71 (ref), completeValue (copy), p65 (copy), ofType (copy), p67 (copy), p68 (copy), var64 (ref), var60 (copy), locatedError (copy), pathToArray (copy), handleFieldError (copy), var61 (copy)
			local var65 = if isPromise(p71) then p71:andThen(function(p73) --[[ line: 975 ]]
				-- upvalues: completeValue (copy), p65 (copy), ofType (copy), p67 (copy), p68 (copy), var64 (copy)
				return completeValue(p65, ofType, p67, p68, var64, p73)
			end) else completeValue(p65, ofType, p67, p68, var64, p71)
			
			if isPromise(var65) then
				var60 = true
				
				return var65:andThen(nil, function(p74) --[[ line: 993 ]]
					-- upvalues: locatedError (copy), p67 (copy), pathToArray (copy), var64 (copy), handleFieldError (copy), ofType (copy), p65 (copy)
					return handleFieldError(locatedError(p74, p67, pathToArray(var64)), ofType, p65)
				end)
			end
			var61 = true
			
			return var65
		end)
		
		return if ok then status else handleFieldError(locatedError(status, p67, pathToArray(var64)), ofType, p65)
	end)
	local var63 = var62
	return var63
end

completeLeafValue = function(p75, p76) --[[ line: 1028 | named "completeLeafValue" ]]
	-- upvalues: error_1 (ref), inspect (ref)
	local var66 = p75:serialize(p76)
	
	if var66 == nil then
		error(error_1.new(("Expected a value of type \"%s\" but "):format(inspect(p75)) .. ("received: %s"):format(inspect(p76))))
	end
	return var66
end

completeAbstractValue = function(value, p77, p78, p79, p80, p81) --[[ line: 1048 | named "completeAbstractValue" ]]
	-- upvalues: isPromise (ref), completeObjectValue (write), ensureValidRuntimeType (write)
	local var67 = (if p77.resolveType then p77.resolveType else value.typeResolver)(p81, value.contextValue, p79, p77)
	
	return if isPromise(var67) then var67:andThen(function(p82) --[[ line: 1066 ]]
		-- upvalues: completeObjectValue (copy), value (ref), ensureValidRuntimeType (copy), p77 (ref), p78 (ref), p79 (ref), p81 (ref), p80 (ref)
		return completeObjectValue(value, ensureValidRuntimeType(p82, value, p77, p78, p79, p81), p78, p79, p80, p81)
	end) else completeObjectValue(value, ensureValidRuntimeType(var67, value, p77, p78, p79, p81), p78, p79, p80, p81)
end

ensureValidRuntimeType = function(p83, p84, p85, p86, p87, p88) --[[ line: 1103 | named "ensureValidRuntimeType" ]]
	-- upvalues: graphQLError (ref), isObjectType (ref), inspect (ref)
	if p83 == nil then
		error(graphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\". Either the \"%s\" type should provide a \"resolveType\" function or each possible type should provide an \"isTypeOf\" function."):format(p85.name, p87.parentType.name, p87.fieldName, p85.name), p86))
	end
	if isObjectType(p83) then
		error(graphQLError.new("Support for returning GraphQLObjectType from resolveType was removed in graphql-js@16.0.0 please return type name instead."))
	end
	if typeof(p83) ~= "string" then
		error(graphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\" with "):format(p85.name, p87.parentType.name, p87.fieldName) .. ("value %s, received \"%s\"."):format(inspect(p88), inspect(p83))))
	end
	local var68 = p84.schema:getType(p83)
	
	if var68 == nil then
		error(graphQLError.new(("Abstract type \"%s\" was resolve to a type \"%s\" that does not exist inside schema."):format(p85.name, p83), p86))
	end
	if not isObjectType(var68) then
		error(graphQLError.new(("Abstract type \"%s\" was resolve to a non-object type \"%s\"."):format(p85.name, p83), p86))
	end
	if not p84.schema:isSubType(p85, var68) then
		error(graphQLError.new(("Runtime Object type \"%s\" is not a possible type for \"%s\"."):format(var68.name, p85.name), p86))
	end
	return var68
end

completeObjectValue = function(p89, p90, p91, p92, p93, p94) --[[ line: 1190 | named "completeObjectValue" ]]
	-- upvalues: isPromise (ref), invalidReturnTypeError (write), collectAndExecuteSubfields (write)
	if p90.isTypeOf ~= nil then
		local var69 = p90:isTypeOf(p94, p89.contextValue, p92)
		
		if isPromise(var69) then
			return var69:andThen(function(p95) --[[ line: 1206 ]]
				-- upvalues: invalidReturnTypeError (copy), p90 (ref), p94 (ref), p91 (ref), collectAndExecuteSubfields (copy), p89 (ref), p93 (ref)
				if not p95 then
					error(invalidReturnTypeError(p90, p94, p91))
				end
				return collectAndExecuteSubfields(p89, p90, p91, p93, p94)
			end)
		elseif not var69 then
			error(invalidReturnTypeError(p90, p94, p91))
		end
	end
	return collectAndExecuteSubfields(p89, p90, p91, p93, p94)
end

invalidReturnTypeError = function(p96, p97, p98) --[[ line: 1223 | named "invalidReturnTypeError" ]]
	-- upvalues: graphQLError (ref), inspect (ref)
	return graphQLError.new(("Expected value of type \"%s\" but got: %s."):format(p96.name, inspect(p97)), p98)
end

collectAndExecuteSubfields = function(p99, p100, p101, p102, p103) --[[ line: 1234 | named "collectAndExecuteSubfields" ]]
	-- upvalues: var32 (write), executeFields (write)
	return executeFields(p99, p100, p103, p102, var32(p99, p100, p101))
end

var32 = memoize3(function(p104, p105, p106) --[[ line: 1250 | named "_collectSubfields" ]]
	-- upvalues: map (ref), collectFields (write)
	local var70 = map.new()
	local t = {}
	
	for i, v in ipairs(p106) do
		if v.selectionSet then
			var70 = collectFields(p104, p105, v.selectionSet, var70, t)
		end
	end
	return var70
end)

return {
	execute = execute,
	executeSync = executeSync,
	assertValidExecutionArguments = assertValidExecutionArguments,
	buildExecutionContext = buildExecutionContext,
	collectFields = collectFields,
	buildResolveInfo = buildResolveInfo,
	getFieldDef = function(p107, p108, p109) --[[ line: 1358 ]]
		-- upvalues: schemaMetaFieldDef (ref), typeMetaFieldDef (ref), typeNameMetaFieldDef (ref)
		return if p109 == schemaMetaFieldDef.name and p107:getQueryType() == p108 then schemaMetaFieldDef elseif p109 == typeMetaFieldDef.name and p107:getQueryType() == p108 then typeMetaFieldDef elseif p109 == typeNameMetaFieldDef.name then typeNameMetaFieldDef else p108:getFields():get(p109)
	end,
	defaultFieldResolver = function(p110, p111, p112, p113) --[[ line: 1334 ]]
		-- upvalues: isObjectLike (ref)
		if not isObjectLike(p110) and typeof(p110) ~= "function" then
			return nil
		end
		local fieldName = p110[p113.fieldName]
		
		return if typeof(fieldName) == "function" then p110[p113.fieldName](p110, p111, p112, p113) else fieldName
	end,
	defaultTypeResolver = function(p114, p115, p116, p117) --[[ line: 1290 ]]
		-- upvalues: isObjectLike (ref), isPromise (ref), promiseModule (ref)
		if isObjectLike(p114) and typeof(p114.__typename) == "string" then
			return p114.__typename
		end
		local var72 = p116.schema:getPossibleTypes(p117)
		local t = {}
		
		for i = 1, #var72 do
			local var74 = var72[i]
			
			if not var74.isTypeOf then
				continue
			end
			local var75 = var74:isTypeOf(p114, p115, p116)
			
			if isPromise(var75) then
				t[i] = var75
			elseif not var75 then
				continue
			end
			return var74.name
		end
		return if #t > 0 then promiseModule.all(t):andThen(function(p118) --[[ line: 1315 ]]
			-- upvalues: var72 (ref)
			for i = 1, #p118 do
				if not p118[i] then
					continue
				end
				return var72[i].name
			end
			return nil
		end) else nil
	end
}