local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local t = {}
local _ = require(script.Parent["merge-typedefs_types"])
local var1 = nil
local graphQLModule = require(parent.GraphQL)
local parse = graphQLModule.parse
local kind = graphQLModule.Kind
local isSchema = graphQLModule.isSchema
local isDefinitionNode = graphQLModule.isDefinitionNode
local utilsModule = require(script.Parent.utils)
local defaultStringComparator = utilsModule.defaultStringComparator
local isSourceTypes = utilsModule.isSourceTypes
local isStringTypes = utilsModule.isStringTypes
local unknownModule = require(script.Parent["merge-nodes"])
local mergeGraphQLNodes = unknownModule.mergeGraphQLNodes
local schemaDefSymbol = unknownModule.schemaDefSymbol
local utilsModule_1 = require(parent.Utils)
local getDocumentNodeFromSchema = utilsModule_1.getDocumentNodeFromSchema
local isDocumentNode = utilsModule_1.isDocumentNode
local resetComments = utilsModule_1.resetComments
local printWithComments = utilsModule_1.printWithComments
local DEFAULT_OPERATION_TYPE_NAME_MAP = require(script.Parent["schema-def"]).DEFAULT_OPERATION_TYPE_NAME_MAP

function t.mergeTypeDefs(p1, p2)
	-- upvalues: resetComments (ref), kind (ref), var1 (write), object (ref), printWithComments (ref)
	resetComments()
	local t = {
		kind = kind.DOCUMENT,
		definitions = var1(p1, object.assign({}, {
			useSchemaDefinition = true,
			forceSchemaDefinition = false,
			throwOnConflict = false,
			commentDescriptions = false
		}, p2))
	}
	local _ = nil
	local var2 = if p2 and p2.commentDescriptions then printWithComments(t) else t
	resetComments()
	
	return var2
end

local function visitTypeSources(p1, p2, p3, p4)
	-- upvalues: set (ref), boolean (ref), visitTypeSources (ref), array (ref), isSchema (ref), getDocumentNodeFromSchema (ref), isStringTypes (ref), isSourceTypes (ref), parse (ref), isDefinitionNode (ref), isDocumentNode (ref), error (ref)
	local var2 = if p3 ~= nil then {} else p3
	local var3 = if p4 ~= nil then set.new() else p4
	
	if boolean.toJSBoolean(if boolean.toJSBoolean(p1) then not boolean.toJSBoolean(var3:has(p1)) else p1) then
		var3:add(p1)
		
		if typeof(p1) == "function" then
			visitTypeSources(p1(), p2, var2, var3)
			
			return var2
		elseif boolean.toJSBoolean(array.isArray(p1)) then
			for i, v in p1 do
				visitTypeSources(v, p2, var2, var3)
			end
			return var2
		elseif boolean.toJSBoolean(isSchema(p1)) then
			visitTypeSources(getDocumentNodeFromSchema(p1, p2).definitions, p2, var2, var3)
			
			return var2
		end
		local var4 = isStringTypes(p1)
		
		if boolean.toJSBoolean(if boolean.toJSBoolean(var4) then var4 else isSourceTypes(p1)) then
			visitTypeSources(parse(p1, p2).definitions, p2, var2, var3)
			
			return var2
		elseif boolean.toJSBoolean(typeof(p1) == "table" and isDefinitionNode(p1)) then
			table.insert(var2, p1)
			
			return var2
		elseif isDocumentNode(p1) then
			visitTypeSources(p1.definitions, p2, var2, var3)
			
			return var2
		end
		error(error.new(("typeDefs must contain only strings, documents, schemas, or functions, got %s"):format(tostring(typeof(p1)))))
	end
	return var2
end

function t.mergeGraphQLTypes(p5, p6)
	-- upvalues: resetComments (ref), visitTypeSources (ref), mergeGraphQLNodes (ref), boolean (ref), schemaDefSymbol (ref), kind (ref), DEFAULT_OPERATION_TYPE_NAME_MAP (ref), array (ref), defaultStringComparator (ref)
	resetComments()
	local var5 = mergeGraphQLNodes(visitTypeSources(p5, p6), p6)
	
	if p6 and boolean.toJSBoolean(p6.useSchemaDefinition) then
		local var6 = boolean.toJSBoolean(var5:get(schemaDefSymbol)) and var5:get(schemaDefSymbol) or { kind = kind.SCHEMA_DEFINITION, operationTypes = {} }
		local operationTypes = var6.operationTypes
		
		for i in DEFAULT_OPERATION_TYPE_NAME_MAP do
			if not boolean.toJSBoolean(array.find(operationTypes, function(p7)
				-- upvalues: i (ref)
				return p7.operation == i
			end)) then
				local var7 = var5:get(DEFAULT_OPERATION_TYPE_NAME_MAP[tostring(i)])
				
				if var7 ~= nil and var7.name ~= nil then
					table.insert(operationTypes, {
						kind = kind.OPERATION_TYPE_DEFINITION,
						type = { kind = kind.NAMED_TYPE, name = var7.name },
						operation = i
					})
				end
			end
		end
		if typeof(var6) == "table" and typeof(var6.operationTypes) == "table" and #var6.operationTypes > 0 then
			var5:set(schemaDefSymbol, var6)
		end
	end
	if p6 and boolean.toJSBoolean(p6.forceSchemaDefinition) and (typeof(var5:get(schemaDefSymbol)) ~= "table" or typeof(var5:get(schemaDefSymbol).operationTypes) ~= "table" or #var5:get(schemaDefSymbol).operationTypes <= 0) then
		var5:set(schemaDefSymbol, {
			kind = kind.SCHEMA_DEFINITION,
			operationTypes = {
				{
					operation = "query",
					kind = kind.OPERATION_TYPE_DEFINITION,
					type = {
						kind = kind.NAMED_TYPE,
						name = { value = "Query", kind = kind.NAME }
					}
				}
			}
		})
	end
	local var8 = var5:values()
	
	if p6 and boolean.toJSBoolean(p6.sort) then
		local var9 = if typeof(p6.sort) == "function" then p6.sort else defaultStringComparator
		array.sort(var8, function(p7, p8)
			-- upvalues: var9 (ref)
			return var9(if typeof(p7.name) == "table" then p7.name.value else nil, if typeof(p8.name) == "table" then p8.name.value else nil)
		end)
	end
	return var8
end

return t