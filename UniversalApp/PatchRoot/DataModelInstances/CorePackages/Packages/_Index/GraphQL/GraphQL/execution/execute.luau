local Parent = script.Parent.Parent
local Jsutils = Parent.jsutils
local Error1 = Parent.error
local Type = Parent.type
local Utilities = Parent.utilities
local LuaUtils = Parent.luaUtils
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error2 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local Set = LuauPolyfillModule.Set
local InstanceofFunction = LuauPolyfillModule.instanceof
local _ = require(Jsutils.ObjMap)
local _ = require(Jsutils.PromiseOrValue)
local PromiseModule = require(Parent.Parent.Promise)
local NullModule = require(LuaUtils.null)
local IsNillishFunction = require(LuaUtils.isNillish).isNillish
local InspectFunction = require(Jsutils.inspect).inspect
local Memoize3Function = require(Jsutils.memoize3).memoize3
local InvariantFunction = require(Jsutils.invariant).invariant
local DevAssertFunction = require(Jsutils.devAssert).devAssert
local IsPromiseFunction = require(Jsutils.isPromise).isPromise
local IsObjectLikeFunction = require(Jsutils.isObjectLike).isObjectLike
local PromiseReduceFunction = require(Jsutils.promiseReduce).promiseReduce
local PromiseForObjectFunction = require(Jsutils.promiseForObject).promiseForObject
local PathModule = require(Jsutils.Path)
local AddPathFunction = PathModule.addPath
local PathToArrayFunction = PathModule.pathToArray
local IsIteratableObjectFunction = require(Jsutils.isIteratableObject).isIteratableObject
local _ = require(Error1.formatError)
local GraphQLError = require(Error1.GraphQLError).GraphQLError
local LocatedErrorFunction = require(Error1.locatedError).locatedError
local _ = require(Parent.language.ast)
local Kind = require(Parent.language.kinds).Kind
local _ = require(Type.schema)
local DefinitionModule = require(Type.definition)
local AssertValidSchemaFunction = require(Type.validate).assertValidSchema
local IntrospectionModule = require(Type.introspection)
local SchemaMetaFieldDef = IntrospectionModule.SchemaMetaFieldDef
local TypeMetaFieldDef = IntrospectionModule.TypeMetaFieldDef
local TypeNameMetaFieldDef = IntrospectionModule.TypeNameMetaFieldDef
local DirectivesModule = require(Type.directives)
local GraphQLIncludeDirective = DirectivesModule.GraphQLIncludeDirective
local GraphQLSkipDirective = DirectivesModule.GraphQLSkipDirective
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsAbstractTypeFunction = DefinitionModule.isAbstractType
local IsLeafTypeFunction = DefinitionModule.isLeafType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local TypeFromASTFunction = require(Utilities.typeFromAST).typeFromAST
local GetOperationRootTypeFunction = require(Utilities.getOperationRootType).getOperationRootType
local ValuesModule = require(script.Parent.values)
local GetVariableValuesFunction = ValuesModule.getVariableValues
local GetArgumentValuesFunction = ValuesModule.getArgumentValues
local GetDirectiveValuesFunction = ValuesModule.getDirectiveValues
local execute = nil
local Callback1 = nil
local Callback2 = nil
local Callback4 = nil
local Callback10 = nil
local DefaultTypeResolver = nil
local DefaultFieldResolver = nil
local Callback9 = nil
local Callback3 = nil
local Callback = nil
local ExecuteFieldsSerially = nil
local ExecuteFields = nil
local Callback6 = nil
local Callback8 = nil
local Callback7 = nil
local Callback5 = nil
local Callback11 = nil
local Callback12 = nil
local Callback14 = nil
local Callback15 = nil
local Callback16 = nil
local Callback18 = nil
local Callback17 = nil
local Callback19 = nil
local Callback13 = nil
local Callback20 = nil

execute = function(p1) --[[ Line: 225 | Named "execute" ]]
	-- upvalues: Callback1 (ref), Callback2 (ref), Array (copy), Callback (ref), Callback3 (ref)
	local Schema = p1.schema
	local Document = p1.document
	local RootValue = p1.rootValue
	local ContextValue = p1.contextValue
	local VariableValues = p1.variableValues
	local OperationName = p1.operationName
	local FieldResolver = p1.fieldResolver
	local TypeResolver = p1.typeResolver
	Callback1(Schema, Document, VariableValues)
	local CallbackResult = Callback2(Schema, Document, RootValue, ContextValue, VariableValues, OperationName, FieldResolver, TypeResolver)
	
	return if Array.isArray(CallbackResult) or not CallbackResult.schema then { errors = CallbackResult } else Callback3(CallbackResult, (Callback(CallbackResult, CallbackResult.operation, RootValue)))
end

local function executeSync(p1) --[[ Line: 278 ]]
	-- upvalues: execute (ref), IsPromiseFunction (copy), Error2 (copy)
	local ExecuteResult = execute(p1)
	
	if IsPromiseFunction(ExecuteResult) then
		error(Error2.new("GraphQL execution failed to complete synchronously."))
	end
	return ExecuteResult
end

Callback3 = function(Errors, Data) --[[ Line: 294 | Named "buildResponse" ]]
	-- upvalues: IsPromiseFunction (copy), Callback3 (ref)
	return if IsPromiseFunction(Data) then Data:andThen(function(Result) --[[ Line: 301 ]]
		-- upvalues: Callback3 (upval), Errors (copy)
		return Callback3(Errors, Result)
	end) elseif #Errors.errors == 0 then { data = Data } else { errors = Errors.errors, data = Data }
end

Callback1 = function(Schema, Document, VariableValues) --[[ Line: 320 | Named "assertValidExecutionArguments" ]]
	-- upvalues: DevAssertFunction (copy), AssertValidSchemaFunction (copy), IsObjectLikeFunction (copy)
	DevAssertFunction(Document, "Must provide document.")
	AssertValidSchemaFunction(Schema)
	DevAssertFunction(VariableValues == nil or IsObjectLikeFunction(VariableValues), "Variables must be provided as an Object where each property is a variable value. Perhaps look to see if an unparsed JSON string was provided.")
end

Callback2 = function(Schema, Document, RootValue, ContextValue, VariableValues, OperationName, FieldResolver, TypeResolver) --[[ Line: 345 | Named "buildExecutionContext" ]]
	-- upvalues: Kind (copy), GraphQLError (copy), GetVariableValuesFunction (copy), DefaultFieldResolver (ref), DefaultTypeResolver (ref)
	local Operation = nil
	local Fragments = {}
	
	for _, definition in ipairs(Document.definitions) do
		if definition.kind ~= Kind.OPERATION_DEFINITION then
			if definition.kind == Kind.FRAGMENT_DEFINITION then
				Fragments[definition.name.value] = definition
				continue
			end
			continue
		end
		if OperationName == nil then
			if Operation ~= nil then
				return {
					GraphQLError.new("Must provide operation name if query contains multiple operations.")
				}
			end
			Operation = definition
		elseif (definition.name and definition.name.value) == OperationName then
			Operation = definition
		end
	end
	if Operation then
		local VariableValues1 = GetVariableValuesFunction(Schema, Operation.variableDefinitions or {}, if VariableValues then VariableValues else {}, { maxErrors = 50 })
		
		return if VariableValues1.errors then VariableValues1.errors else {
			schema = Schema,
			fragments = Fragments,
			rootValue = RootValue,
			contextValue = ContextValue,
			operation = Operation,
			variableValues = VariableValues1.coerced,
			fieldResolver = FieldResolver or DefaultFieldResolver,
			typeResolver = TypeResolver or DefaultTypeResolver,
			errors = {}
		}
	else
		return if OperationName == nil then { GraphQLError.new("Must provide an operation.") } else {
			GraphQLError.new(("Unknown operation named \"%s\"."):format(OperationName))
		}
	end
end

Callback = function(Errors, Operation, RootValue) --[[ Line: 421 | Named "executeOperation" ]]
	-- upvalues: GetOperationRootTypeFunction (copy), Callback4 (ref), Map (copy), ExecuteFieldsSerially (ref), ExecuteFields (ref), IsPromiseFunction (copy), PromiseModule (copy), NullModule (copy)
	local OperationRootType = GetOperationRootTypeFunction(Errors.schema, Operation)
	local CallbackResult = Callback4(Errors, OperationRootType, Operation.selectionSet, Map.new(), {})
	local Success = nil
	local Result = nil
	
	if Operation.operation == "mutation" then
		Success, Result = pcall(ExecuteFieldsSerially, Errors, OperationRootType, RootValue, nil, CallbackResult)
	else
		Success, Result = pcall(ExecuteFields, Errors, OperationRootType, RootValue, nil, CallbackResult)
	end
	if IsPromiseFunction(Result) then
		return Result:andThen(nil, function(p1) --[[ Line: 450 ]]
			-- upvalues: Errors (copy), PromiseModule (upval), NullModule (upval)
			table.insert(Errors.errors, p1)
			
			return PromiseModule.resolve(NullModule)
		end)
	elseif Success then
		return Result
	else
		table.insert(Errors.errors, Result)
		
		return NullModule
	end
end

ExecuteFieldsSerially = function(p1, p2, p3, p4, p5) --[[ Line: 467 | Named "executeFieldsSerially" ]]
	-- upvalues: PromiseReduceFunction (copy), AddPathFunction (copy), Callback5 (ref), IsPromiseFunction (copy)
	return PromiseReduceFunction(p5:keys(), function(Promises, Key) --[[ Line: 477 ]]
		-- upvalues: p5 (copy), AddPathFunction (upval), p4 (copy), p2 (copy), Callback5 (upval), p1 (copy), p3 (copy), IsPromiseFunction (upval)
		local CallbackResult = Callback5(p1, p2, p3, p5[Key], (AddPathFunction(p4, Key, p2.name)))
		
		if CallbackResult == nil then
			return Promises
		elseif IsPromiseFunction(CallbackResult) then
			return CallbackResult:andThen(function(Result) --[[ Line: 489 ]]
				-- upvalues: Promises (copy), Key (copy)
				Promises[Key] = Result
				
				return Promises
			end)
		else
			Promises[Key] = CallbackResult
			
			return Promises
		end
	end, {})
end

ExecuteFields = function(p1, p2, p3, p4, p5) --[[ Line: 508 | Named "executeFields" ]]
	-- upvalues: AddPathFunction (copy), Callback5 (ref), IsPromiseFunction (copy), PromiseForObjectFunction (copy)
	local t = {}
	local Flag = false
	
	for _, value in ipairs(p5:keys()) do
		local CallbackResult = Callback5(p1, p2, p3, p5[value], (AddPathFunction(p4, value, p2.name)))
		
		if CallbackResult ~= nil then
			t[value] = CallbackResult
			
			if IsPromiseFunction(CallbackResult) then
				Flag = true
			end
		end
	end
	return if Flag then PromiseForObjectFunction(t) else t
end

Callback4 = function(p6, p7, SelectionSet, NewResult, p8) --[[ Line: 555 | Named "collectFields" ]]
	-- upvalues: Kind (copy), Callback6 (ref), Callback7 (ref), Callback8 (ref), Callback4 (ref)
	for _, selection in ipairs(SelectionSet.selections) do
		if selection.kind == Kind.FIELD then
			if Callback6(p6, selection) then
				local CallbackResult = Callback7(selection)
				
				if not NewResult[CallbackResult] then
					NewResult[CallbackResult] = {}
				end
				table.insert(NewResult[CallbackResult], selection)
			end
		elseif selection.kind == Kind.INLINE_FRAGMENT then
			if Callback6(p6, selection) and Callback8(p6, selection, p7) then
				Callback4(p6, p7, selection.selectionSet, NewResult, p8)
			end
		elseif selection.kind == Kind.FRAGMENT_SPREAD then
			local Value = selection.name.value
			
			if not p8[Value] and Callback6(p6, selection) then
				p8[Value] = true
				local Fragment = p6.fragments[Value]
				
				if Fragment and Callback8(p6, Fragment, p7) then
					Callback4(p6, p7, Fragment.selectionSet, NewResult, p8)
				end
			end
		end
	end
	return NewResult
end

Callback6 = function(p9, p10): boolean --[[ Line: 616 | Named "shouldIncludeNode" ]]
	-- upvalues: GetDirectiveValuesFunction (copy), GraphQLSkipDirective (copy), GraphQLIncludeDirective (copy)
	local DirectiveValues = GetDirectiveValuesFunction(GraphQLSkipDirective, p10, p9.variableValues)
	
	if (DirectiveValues and DirectiveValues["if"]) == true then
		return false
	else
		local DirectiveValues1 = GetDirectiveValuesFunction(GraphQLIncludeDirective, p10, p9.variableValues)
		
		return (DirectiveValues1 and DirectiveValues1["if"]) ~= false
	end
end

Callback8 = function(p9, Fragment, p10) --[[ Line: 638 | Named "doesFragmentConditionMatch" ]]
	-- upvalues: TypeFromASTFunction (copy), IsAbstractTypeFunction (copy)
	local TypeCondition = Fragment.typeCondition
	
	if TypeCondition then
		local TypeFromASTResult = TypeFromASTFunction(p9.schema, TypeCondition)
		
		return TypeFromASTResult == p10 or (if IsAbstractTypeFunction(TypeFromASTResult) then p9.schema:isSubType(TypeFromASTResult, p10) else false)
	else
		return true
	end
end

Callback7 = function(p9) --[[ Line: 670 | Named "getFieldEntryKey" ]]
	return if p9.alias then p9.alias.value else p9.name.value
end

Callback5 = function(ResolveInfo, ParentType, p9, Entry, Path) --[[ Line: 680 | Named "resolveField" ]]
	-- upvalues: Callback9 (ref), Callback10 (ref), GetArgumentValuesFunction (copy), IsPromiseFunction (copy), Callback12 (ref), LocatedErrorFunction (copy), PathToArrayFunction (copy), Callback11 (ref)
	local CallbackResult = Callback9(ResolveInfo.schema, ParentType, Entry[1].name.value)
	
	if not CallbackResult then return end
	local Type = CallbackResult.type
	local Resolve = if CallbackResult.resolve then CallbackResult.resolve else ResolveInfo.fieldResolver
	local CallbackResult1 = Callback10(ResolveInfo, CallbackResult, Entry, ParentType, Path)
	local Success, Result = pcall(function() --[[ Line: 711 ]]
		-- upvalues: GetArgumentValuesFunction (upval), CallbackResult (copy), Entry (copy), ResolveInfo (copy), Resolve (copy), p9 (copy), CallbackResult1 (copy), IsPromiseFunction (upval), Callback12 (upval), Type (copy), Path (copy), LocatedErrorFunction (upval), PathToArrayFunction (upval), Callback11 (upval)
		local ResolveResult = Resolve(p9, GetArgumentValuesFunction(CallbackResult, Entry[1], ResolveInfo.variableValues), ResolveInfo.contextValue, CallbackResult1)
		local CallbackResult2 = if IsPromiseFunction(ResolveResult) then ResolveResult:andThen(function(Result) --[[ Line: 736 ]]
			-- upvalues: Callback12 (upval), ResolveInfo (upval), Type (upval), Entry (upval), CallbackResult1 (upval), Path (upval)
			return Callback12(ResolveInfo, Type, Entry, CallbackResult1, Path, Result)
		end) else Callback12(ResolveInfo, Type, Entry, CallbackResult1, Path, ResolveResult)
		
		return if IsPromiseFunction(CallbackResult2) then CallbackResult2:andThen(nil, function(p10) --[[ Line: 746 ]]
			-- upvalues: LocatedErrorFunction (upval), Entry (upval), PathToArrayFunction (upval), Path (upval), Callback11 (upval), Type (upval), ResolveInfo (upval)
			return Callback11(LocatedErrorFunction(p10, Entry, PathToArrayFunction(Path)), Type, ResolveInfo)
		end) else CallbackResult2
	end)
	
	return if Success then Result else Callback11(LocatedErrorFunction(Result, Entry, PathToArrayFunction(Path)), Type, ResolveInfo)
end

Callback10 = function(ResolveInfo, p9, FieldNodes, ParentType, Path) --[[ Line: 766 | Named "buildResolveInfo" ]]
	return {
		fieldName = p9.name,
		fieldNodes = FieldNodes,
		returnType = p9.type,
		parentType = ParentType,
		path = Path,
		schema = ResolveInfo.schema,
		fragments = ResolveInfo.fragments,
		rootValue = ResolveInfo.rootValue,
		operation = ResolveInfo.operation,
		variableValues = ResolveInfo.variableValues
	}
end

Callback11 = function(p9, OfType, p10) --[[ Line: 789 | Named "handleFieldError" ]]
	-- upvalues: IsNonNullTypeFunction (copy), NullModule (copy)
	if IsNonNullTypeFunction(OfType) then
		error(p9)
	end
	table.insert(p10.errors, p9)
	
	return NullModule
end

Callback12 = function(p9, OfType, FieldNodes, ResolveInfo, Path, Promise) --[[ Line: 827 | Named "completeValue" ]]
	-- upvalues: InstanceofFunction (copy), Error2 (copy), IsNonNullTypeFunction (copy), Callback12 (ref), IsNillishFunction (copy), NullModule (copy), IsListTypeFunction (copy), Callback14 (ref), IsLeafTypeFunction (copy), Callback15 (ref), IsAbstractTypeFunction (copy), Callback16 (ref), IsObjectTypeFunction (copy), Callback17 (ref), InvariantFunction (copy), InspectFunction (copy)
	if InstanceofFunction(Promise, Error2) then
		error(Promise)
	end
	if IsNonNullTypeFunction(OfType) then
		local CallbackResult = Callback12(p9, OfType.ofType, FieldNodes, ResolveInfo, Path, Promise)
		
		if IsNillishFunction(CallbackResult) then
			error(Error2.new(("Cannot return null for non-nullable field %s.%s."):format(ResolveInfo.parentType.name, ResolveInfo.fieldName)))
		end
		return CallbackResult
	elseif IsNillishFunction(Promise) then
		return NullModule
	elseif IsListTypeFunction(OfType) then
		return Callback14(p9, OfType, FieldNodes, ResolveInfo, Path, Promise)
	elseif IsLeafTypeFunction(OfType) then
		return Callback15(OfType, Promise)
	elseif IsAbstractTypeFunction(OfType) then
		return Callback16(p9, OfType, FieldNodes, ResolveInfo, Path, Promise)
	elseif IsObjectTypeFunction(OfType) then
		return Callback17(p9, OfType, FieldNodes, ResolveInfo, Path, Promise)
	else
		InvariantFunction(false, "Cannot complete value of unexpected output type: " .. InspectFunction(OfType))
		assert(false, "Cannot complete value of unexpected output type: " .. InspectFunction(OfType))
	end
end

Callback14 = function(p9, p10, p11, ResolveInfo, p12, List) --[[ Line: 932 | Named "completeListValue" ]]
	-- upvalues: InstanceofFunction (copy), Set (copy), IsIteratableObjectFunction (copy), GraphQLError (copy), Array (copy), AddPathFunction (copy), IsPromiseFunction (copy), Callback12 (ref), LocatedErrorFunction (copy), PathToArrayFunction (copy), Callback11 (ref), PromiseModule (copy)
	if InstanceofFunction(List, Set) then
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, value)
		end
		List = List1
	end
	if not IsIteratableObjectFunction(List) then
		error(GraphQLError.new(("Expected Iterable, but did not find one for field \"%s.%s\"."):format(ResolveInfo.parentType.name, ResolveInfo.fieldName)))
	end
	local OfType = p10.ofType
	local Flag = false
	local Flag1 = false
	local FromResult = Array.from(List, function(Promise, p13) --[[ Line: 967 ]]
		-- upvalues: AddPathFunction (upval), p12 (copy), IsPromiseFunction (upval), Callback12 (upval), p9 (copy), OfType (copy), p11 (copy), ResolveInfo (copy), Flag (ref), LocatedErrorFunction (upval), PathToArrayFunction (upval), Callback11 (upval), Flag1 (ref)
		local AddPathResult = AddPathFunction(p12, p13, nil)
		local Success, Result = pcall(function() --[[ Line: 972 ]]
			-- upvalues: IsPromiseFunction (upval), Promise (copy), Callback12 (upval), p9 (upval), OfType (upval), p11 (upval), ResolveInfo (upval), AddPathResult (copy), Flag (upval), LocatedErrorFunction (upval), PathToArrayFunction (upval), Callback11 (upval), Flag1 (upval)
			local CallbackResult = if IsPromiseFunction(Promise) then Promise:andThen(function(Result) --[[ Line: 975 ]]
				-- upvalues: Callback12 (upval), p9 (upval), OfType (upval), p11 (upval), ResolveInfo (upval), AddPathResult (upval)
				return Callback12(p9, OfType, p11, ResolveInfo, AddPathResult, Result)
			end) else Callback12(p9, OfType, p11, ResolveInfo, AddPathResult, Promise)
			
			if IsPromiseFunction(CallbackResult) then
				Flag = true
				
				return CallbackResult:andThen(nil, function(p14) --[[ Line: 993 ]]
					-- upvalues: LocatedErrorFunction (upval), p11 (upval), PathToArrayFunction (upval), AddPathResult (upval), Callback11 (upval), OfType (upval), p9 (upval)
					return Callback11(LocatedErrorFunction(p14, p11, PathToArrayFunction(AddPathResult)), OfType, p9)
				end)
			else
				Flag1 = true
				
				return CallbackResult
			end
		end)
		
		return if Success then Result else Callback11(LocatedErrorFunction(Result, p11, PathToArrayFunction(AddPathResult)), OfType, p9)
	end)
	
	if Flag1 and Flag then
		FromResult = Array.map(FromResult, function(p13) --[[ Line: 1015 ]]
			-- upvalues: IsPromiseFunction (upval), PromiseModule (upval)
			return if IsPromiseFunction(p13) then p13 else PromiseModule.resolve(p13)
		end)
	end
	return if Flag then PromiseModule.all(FromResult) else FromResult
end

Callback15 = function(p13, p14) --[[ Line: 1028 | Named "completeLeafValue" ]]
	-- upvalues: Error2 (copy), InspectFunction (copy)
	local SerializeResult = p13:serialize(p14)
	
	if SerializeResult == nil then
		error(Error2.new(("Expected a value of type \"%s\" but "):format(InspectFunction(p13)) .. ("received: %s"):format(InspectFunction(p14))))
	end
	return SerializeResult
end

Callback16 = function(p13, p14, p15, p16, p17, p18) --[[ Line: 1048 | Named "completeAbstractValue" ]]
	-- upvalues: IsPromiseFunction (copy), Callback17 (ref), Callback18 (ref)
	local Promise = (if p14.resolveType then p14.resolveType else p13.typeResolver)(p18, p13.contextValue, p16, p14)
	
	return if IsPromiseFunction(Promise) then Promise:andThen(function(Result) --[[ Line: 1066 ]]
		-- upvalues: Callback17 (upval), p13 (copy), Callback18 (upval), p14 (copy), p15 (copy), p16 (copy), p18 (copy), p17 (copy)
		return Callback17(p13, Callback18(Result, p13, p14, p15, p16, p18), p15, p16, p17, p18)
	end) else Callback17(p13, Callback18(Promise, p13, p14, p15, p16, p18), p15, p16, p17, p18)
end

Callback18 = function(Promise, p13, p14, p15, ResolveInfo, p16) --[[ Line: 1103 | Named "ensureValidRuntimeType" ]]
	-- upvalues: GraphQLError (copy), IsObjectTypeFunction (copy), InspectFunction (copy)
	if Promise == nil then
		error(GraphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\". Either the \"%s\" type should provide a \"resolveType\" function or each possible type should provide an \"isTypeOf\" function."):format(p14.name, ResolveInfo.parentType.name, ResolveInfo.fieldName, p14.name), p15))
	end
	if IsObjectTypeFunction(Promise) then
		error(GraphQLError.new("Support for returning GraphQLObjectType from resolveType was removed in graphql-js@16.0.0 please return type name instead."))
	end
	if typeof(Promise) ~= "string" then
		error(GraphQLError.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\" with "):format(p14.name, ResolveInfo.parentType.name, ResolveInfo.fieldName) .. ("value %s, received \"%s\"."):format(InspectFunction(p16), InspectFunction(Promise))))
	end
	local Type = p13.schema:getType(Promise)
	
	if Type == nil then
		error(GraphQLError.new(("Abstract type \"%s\" was resolve to a type \"%s\" that does not exist inside schema."):format(p14.name, Promise), p15))
	end
	if not IsObjectTypeFunction(Type) then
		error(GraphQLError.new(("Abstract type \"%s\" was resolve to a non-object type \"%s\"."):format(p14.name, Promise), p15))
	end
	if not p13.schema:isSubType(p14, Type) then
		error(GraphQLError.new(("Runtime Object type \"%s\" is not a possible type for \"%s\"."):format(Type.name, p14.name), p15))
	end
	return Type
end

Callback17 = function(p13, p14, p15, p16, p17, p18) --[[ Line: 1190 | Named "completeObjectValue" ]]
	-- upvalues: IsPromiseFunction (copy), Callback19 (ref), Callback13 (ref)
	if p14.isTypeOf ~= nil then
		local IsTypeOf = p14.isTypeOf(p14, p18, p13.contextValue, p16)
		
		if IsPromiseFunction(IsTypeOf) then
			return IsTypeOf:andThen(function(Result) --[[ Line: 1206 ]]
				-- upvalues: Callback19 (upval), p14 (copy), p18 (copy), p15 (copy), Callback13 (upval), p13 (copy), p17 (copy)
				if not Result then
					error(Callback19(p14, p18, p15))
				end
				return Callback13(p13, p14, p15, p17, p18)
			end)
		end
		if not IsTypeOf then
			error(Callback19(p14, p18, p15))
		end
	end
	return Callback13(p13, p14, p15, p17, p18)
end

Callback19 = function(p13, p14, p15) --[[ Line: 1223 | Named "invalidReturnTypeError" ]]
	-- upvalues: GraphQLError (copy), InspectFunction (copy)
	return GraphQLError.new(("Expected value of type \"%s\" but got: %s."):format(p13.name, InspectFunction(p14)), p15)
end

Callback13 = function(p13, p14, p15, p16, p17) --[[ Line: 1234 | Named "collectAndExecuteSubfields" ]]
	-- upvalues: Callback20 (ref), ExecuteFields (ref)
	return ExecuteFields(p13, p14, p17, p16, (Callback20(p13, p14, p15)))
end

Callback20 = Memoize3Function(function(p13, p14, List) --[[ Line: 1250 | Named "_collectSubfields" ]]
	-- upvalues: Map (copy), Callback4 (ref)
	local NewMap = Map.new()
	local t = {}
	
	for _, value in ipairs(List) do
		if value.selectionSet then
			NewMap = Callback4(p13, p14, value.selectionSet, NewMap, t)
		end
	end
	return NewMap
end)

DefaultTypeResolver = function(p15, p16, p17, p18) --[[ Line: 1290 ]]
	-- upvalues: IsObjectLikeFunction (copy), IsPromiseFunction (copy), PromiseModule (copy)
	if IsObjectLikeFunction(p15) and typeof(p15.__typename) == "string" then
		return p15.__typename
	end
	local PossibleTypes = p17.schema:getPossibleTypes(p18)
	local t = {}
	local PossibleType = nil
	
	for i = 1, #PossibleTypes do
		PossibleType = PossibleTypes[i]
		
		if PossibleType.isTypeOf then
			local IsTypeOf = PossibleType:isTypeOf(p15, p16, p17)
			
			if IsPromiseFunction(IsTypeOf) then
				t[i] = IsTypeOf
			elseif IsTypeOf then
				return PossibleType.name
			end
		end
	end
	return if #t > 0 then PromiseModule.all(t):andThen(function(Result) --[[ Line: 1315 ]]
		-- upvalues: PossibleTypes (copy)
		for i = 1, #Result do
			if Result[i] then
				return PossibleTypes[i].name
			end
		end
		return nil
	end) else nil
end

DefaultFieldResolver = function(p19, p20, p21, p22) --[[ Line: 1334 ]]
	-- upvalues: IsObjectLikeFunction (copy)
	if IsObjectLikeFunction(p19) or typeof(p19) == "function" then
		local v1 = p19[p22.fieldName]
		
		return if typeof(v1) == "function" then p19[p22.fieldName](p19, p20, p21, p22) else v1
	else
		return nil
	end
end

Callback9 = function(Schema, QueryType, Name) --[[ Line: 1358 | Named "getFieldDef" ]]
	-- upvalues: SchemaMetaFieldDef (copy), TypeMetaFieldDef (copy), TypeNameMetaFieldDef (copy)
	return if Name == SchemaMetaFieldDef.name and Schema:getQueryType() == QueryType then SchemaMetaFieldDef elseif Name == TypeMetaFieldDef.name and Schema:getQueryType() == QueryType then TypeMetaFieldDef elseif Name == TypeNameMetaFieldDef.name then TypeNameMetaFieldDef else QueryType:getFields():get(Name)
end

return {
	execute = execute,
	executeSync = executeSync,
	assertValidExecutionArguments = Callback1,
	buildExecutionContext = Callback2,
	collectFields = Callback4,
	buildResolveInfo = Callback10,
	getFieldDef = Callback9,
	defaultFieldResolver = DefaultFieldResolver,
	defaultTypeResolver = DefaultTypeResolver
}