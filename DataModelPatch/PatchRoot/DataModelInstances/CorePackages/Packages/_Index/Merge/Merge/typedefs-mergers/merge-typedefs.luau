local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local _ = require(script.Parent["merge-typedefs_types"])
local Callback = nil
local GraphQLModule = require(Parent.GraphQL)
local ParseFunction = GraphQLModule.parse
local Kind = GraphQLModule.Kind
local IsSchemaFunction = GraphQLModule.isSchema
local IsDefinitionNodeFunction = GraphQLModule.isDefinitionNode
local UtilsModule = require(script.Parent.utils)
local DefaultStringComparator = UtilsModule.defaultStringComparator
local IsSourceTypesFunction = UtilsModule.isSourceTypes
local IsStringTypesFunction = UtilsModule.isStringTypes
local MergeNodesModule = require(script.Parent["merge-nodes"])
local MergeGraphQLNodesFunction = MergeNodesModule.mergeGraphQLNodes
local SchemaDefSymbol = MergeNodesModule.schemaDefSymbol
local UtilsModule1 = require(Parent.Utils)
local GetDocumentNodeFromSchemaFunction = UtilsModule1.getDocumentNodeFromSchema
local IsDocumentNodeFunction = UtilsModule1.isDocumentNode
local ResetCommentsFunction = UtilsModule1.resetComments
local PrintWithCommentsFunction = UtilsModule1.printWithComments
local DEFAULTOPERATIONTYPENAMEMAP = require(script.Parent["schema-def"]).DEFAULT_OPERATION_TYPE_NAME_MAP

local function visitTypeSources(Callback, p1, p2, NewResult)
	-- upvalues: Set (copy), Boolean (copy), visitTypeSources (copy), Array (copy), IsSchemaFunction (copy), GetDocumentNodeFromSchemaFunction (copy), IsStringTypesFunction (copy), IsSourceTypesFunction (copy), ParseFunction (copy), IsDefinitionNodeFunction (copy), IsDocumentNodeFunction (copy), Error1 (copy)
	local T = if p2 == nil then {} else p2
	local NewSet = if NewResult == nil then Set.new() else NewResult
	
	if Boolean.toJSBoolean(if Boolean.toJSBoolean(Callback) then not Boolean.toJSBoolean(NewSet:has(Callback)) else Callback) then
		NewSet:add(Callback)
		
		if typeof(Callback) == "function" then
			visitTypeSources(Callback(), p1, T, NewSet)
			
			return T
		end
		if Boolean.toJSBoolean(Array.isArray(Callback)) then
			for _, value in Callback do
				visitTypeSources(value, p1, T, NewSet)
			end
			return T
		else
			if Boolean.toJSBoolean(IsSchemaFunction(Callback)) then
				visitTypeSources(GetDocumentNodeFromSchemaFunction(Callback, p1).definitions, p1, T, NewSet)
				
				return T
			end
			local ToJSBooleanFunction = Boolean.toJSBoolean
			local IsStringTypes = IsStringTypesFunction(Callback)
			
			if ToJSBooleanFunction(Boolean.toJSBoolean(IsStringTypes) and IsStringTypes or IsSourceTypesFunction(Callback)) then
				visitTypeSources(ParseFunction(Callback, p1).definitions, p1, T, NewSet)
				
				return T
			end
			if Boolean.toJSBoolean(typeof(Callback) == "table" and IsDefinitionNodeFunction(Callback)) then
				table.insert(T, Callback)
				
				return T
			end
			if IsDocumentNodeFunction(Callback) then
				visitTypeSources(Callback.definitions, p1, T, NewSet)
				
				return T
			end
			error(Error1.new(("typeDefs must contain only strings, documents, schemas, or functions, got %s"):format((tostring((typeof(Callback)))))))
		end
	end
	return T
end

Callback = function(p3, AssignResult)
	-- upvalues: ResetCommentsFunction (copy), visitTypeSources (copy), MergeGraphQLNodesFunction (copy), Boolean (copy), SchemaDefSymbol (copy), Kind (copy), DEFAULTOPERATIONTYPENAMEMAP (copy), Array (copy), DefaultStringComparator (copy)
	ResetCommentsFunction()
	local MergeGraphQLNodesResult = MergeGraphQLNodesFunction(visitTypeSources(p3, AssignResult), AssignResult)
	
	if AssignResult and Boolean.toJSBoolean(AssignResult.useSchemaDefinition) then
		local GetResult = Boolean.toJSBoolean(MergeGraphQLNodesResult:get(SchemaDefSymbol)) and MergeGraphQLNodesResult:get(SchemaDefSymbol) or { kind = Kind.SCHEMA_DEFINITION, operationTypes = {} }
		local OperationTypes = GetResult.operationTypes
		
		for Operation in DEFAULTOPERATIONTYPENAMEMAP do
			local JSBoolean = Boolean.toJSBoolean((Array.find(OperationTypes, function(p4): boolean
				-- upvalues: Operation (copy)
				return p4.operation == Operation
			end)))
			local GetResult1 = nil
			
			if not JSBoolean then
				GetResult1 = MergeGraphQLNodesResult:get(DEFAULTOPERATIONTYPENAMEMAP[tostring(Operation)])
				JSBoolean = GetResult1 == nil or GetResult1.name == nil
			end
			if not JSBoolean then
				table.insert(OperationTypes, {
					kind = Kind.OPERATION_TYPE_DEFINITION,
					type = { kind = Kind.NAMED_TYPE, name = GetResult1.name },
					operation = Operation
				})
			end
		end
		if typeof(GetResult) == "table" and typeof(GetResult.operationTypes) == "table" and #GetResult.operationTypes > 0 then
			MergeGraphQLNodesResult:set(SchemaDefSymbol, GetResult)
		end
	end
	if AssignResult and Boolean.toJSBoolean(AssignResult.forceSchemaDefinition) and (typeof(MergeGraphQLNodesResult:get(SchemaDefSymbol)) ~= "table" or typeof(MergeGraphQLNodesResult:get(SchemaDefSymbol).operationTypes) ~= "table" or #MergeGraphQLNodesResult:get(SchemaDefSymbol).operationTypes <= 0) then
		MergeGraphQLNodesResult:set(SchemaDefSymbol, {
			kind = Kind.SCHEMA_DEFINITION,
			operationTypes = {
				{
					operation = "query",
					kind = Kind.OPERATION_TYPE_DEFINITION,
					type = {
						kind = Kind.NAMED_TYPE,
						name = { value = "Query", kind = Kind.NAME }
					}
				}
			}
		})
	end
	local ValuesResult = MergeGraphQLNodesResult:values()
	
	if AssignResult and Boolean.toJSBoolean(AssignResult.sort) then
		local Sort = if typeof(AssignResult.sort) == "function" then AssignResult.sort else DefaultStringComparator
		Array.sort(ValuesResult, function(p4, p5)
			-- upvalues: Sort (copy)
			return Sort(if typeof(p4.name) == "table" then p4.name.value else nil, if typeof(p5.name) == "table" then p5.name.value else nil)
		end)
	end
	return ValuesResult
end

return {
	mergeTypeDefs = function(p4, p5)
		-- upvalues: ResetCommentsFunction (copy), Kind (copy), Callback (ref), Object (copy), PrintWithCommentsFunction (copy)
		ResetCommentsFunction()
		local config = {
			kind = Kind.DOCUMENT,
			definitions = Callback(p4, Object.assign({}, {
				useSchemaDefinition = true,
				forceSchemaDefinition = false,
				throwOnConflict = false,
				commentDescriptions = false
			}, p5))
		}
		local PrintWithCommentsResult = if p5 and p5.commentDescriptions then PrintWithCommentsFunction(config) else config
		ResetCommentsFunction()
		
		return PrintWithCommentsResult
	end,
	mergeGraphQLTypes = Callback
}