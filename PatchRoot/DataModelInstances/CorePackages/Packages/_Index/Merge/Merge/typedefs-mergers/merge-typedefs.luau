-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local t = {}
local _ = require(script.Parent["merge-typedefs_types"])
local var2 = nil
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

function t.mergeTypeDefs(p0, p1) --[[ line: 159 ]]
	-- upvalues: resetComments (ref), kind (ref), var2 (write), object (ref), printWithComments (ref)
	resetComments()
	local t = {
		kind = kind.DOCUMENT,
		definitions = var2(p0, object.assign({}, {
			useSchemaDefinition = true,
			forceSchemaDefinition = false,
			throwOnConflict = false,
			commentDescriptions = false
		}, p1))
	}
	local _ = nil
	local var9 = if p1 and p1.commentDescriptions then printWithComments(t) else t
	resetComments()
	
	return var9
end

local function visitTypeSources(p2, p3, p4, p5) --[[ line: 188 ]]
	-- upvalues: set (ref), boolean (ref), visitTypeSources (ref), array (ref), isSchema (ref), getDocumentNodeFromSchema (ref), isStringTypes (ref), isSourceTypes (ref), parse (ref), isDefinitionNode (ref), isDocumentNode (ref), error (ref)
	local var10 = if p4 ~= nil then {} else p4
	local var11 = if p5 ~= nil then set.new() else p5
	
	if boolean.toJSBoolean(if boolean.toJSBoolean(p2) then not boolean.toJSBoolean(var11:has(p2)) else p2) then
		var11:add(p2)
		
		if typeof(p2) == "function" then
			visitTypeSources(p2(), p3, var10, var11)
			
			return var10
		elseif boolean.toJSBoolean(array.isArray(p2)) then
			for i, v in p2 do
				visitTypeSources(v, p3, var10, var11)
			end
			return var10
		elseif boolean.toJSBoolean(isSchema(p2)) then
			visitTypeSources(getDocumentNodeFromSchema(p2, p3).definitions, p3, var10, var11)
			
			return var10
		end
		local var12 = isStringTypes(p2)
		
		if boolean.toJSBoolean(if boolean.toJSBoolean(var12) then var12 else isSourceTypes(p2)) then
			visitTypeSources(parse(p2, p3).definitions, p3, var10, var11)
			
			return var10
		elseif boolean.toJSBoolean(typeof(p2) == "table" and isDefinitionNode(p2)) then
			table.insert(var10, p2)
			
			return var10
		elseif isDocumentNode(p2) then
			visitTypeSources(p2.definitions, p3, var10, var11)
			
			return var10
		end
		error(error.new(("typeDefs must contain only strings, documents, schemas, or functions, got %s"):format(tostring(typeof(p2)))))
	end
	return var10
end

function t.mergeGraphQLTypes(p6, p7) --[[ line: 262 ]]
	-- upvalues: resetComments (ref), visitTypeSources (ref), mergeGraphQLNodes (ref), boolean (ref), schemaDefSymbol (ref), kind (ref), DEFAULT_OPERATION_TYPE_NAME_MAP (ref), array (ref), defaultStringComparator (ref)
	resetComments()
	local var13 = mergeGraphQLNodes(visitTypeSources(p6, p7), p7)
	
	if p7 and boolean.toJSBoolean(p7.useSchemaDefinition) then
		local var14 = boolean.toJSBoolean(var13:get(schemaDefSymbol)) and var13:get(schemaDefSymbol) or { kind = kind.SCHEMA_DEFINITION, operationTypes = {} }
		local operationTypes = var14.operationTypes
		
		for i in DEFAULT_OPERATION_TYPE_NAME_MAP do
			if not boolean.toJSBoolean(array.find(operationTypes, function(p8) --[[ line: 288 ]]
				-- upvalues: i (ref)
				return p8.operation == i
			end)) then
				local var15 = var13:get(DEFAULT_OPERATION_TYPE_NAME_MAP[tostring(i)])
				
				if var15 ~= nil and var15.name ~= nil then
					table.insert(operationTypes, {
						kind = kind.OPERATION_TYPE_DEFINITION,
						type = { kind = kind.NAMED_TYPE, name = var15.name },
						operation = i
					})
				end
			end
		end
		if typeof(var14) == "table" and typeof(var14.operationTypes) == "table" and #var14.operationTypes > 0 then
			var13:set(schemaDefSymbol, var14)
		end
	end
	if p7 and boolean.toJSBoolean(p7.forceSchemaDefinition) and (typeof(var13:get(schemaDefSymbol)) ~= "table" or typeof(var13:get(schemaDefSymbol).operationTypes) ~= "table" or #var13:get(schemaDefSymbol).operationTypes <= 0) then
		var13:set(schemaDefSymbol, {
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
	local var16 = var13:values()
	
	if p7 and boolean.toJSBoolean(p7.sort) then
		local var17 = if typeof(p7.sort) == "function" then p7.sort else defaultStringComparator
		array.sort(var16, function(p9, p10) --[[ line: 392 ]]
			-- upvalues: var17 (ref)
			return var17(if typeof(p9.name) == "table" then p9.name.value else nil, if typeof(p10.name) == "table" then p10.name.value else nil)
		end)
	end
	return var16
end

return t