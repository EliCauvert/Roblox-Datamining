local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLEnumType = graphQLModule.GraphQLEnumType
local graphQLInputObjectType = graphQLModule.GraphQLInputObjectType
local graphQLInterfaceType = graphQLModule.GraphQLInterfaceType
local graphQLObjectType = graphQLModule.GraphQLObjectType
local graphQLScalarType = graphQLModule.GraphQLScalarType
local graphQLUnionType = graphQLModule.GraphQLUnionType
local isEnumType = graphQLModule.isEnumType
local isInterfaceType = graphQLModule.isInterfaceType
local isInputObjectType = graphQLModule.isInputObjectType
local isObjectType = graphQLModule.isObjectType
local isScalarType = graphQLModule.isScalarType
local isUnionType = graphQLModule.isUnionType

function t.renameType(p1, p2)
	-- upvalues: boolean (ref), isObjectType (ref), graphQLObjectType (ref), object (ref), array (ref), isInterfaceType (ref), graphQLInterfaceType (ref), isUnionType (ref), graphQLUnionType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), isEnumType (ref), graphQLEnumType (ref), isScalarType (ref), graphQLScalarType (ref), error (ref)
	if boolean.toJSBoolean(isObjectType(p1)) then
		return graphQLObjectType.new(object.assign({}, p1:toConfig(), {
			name = p2,
			astNode = if p1.astNode == nil then p1.astNode else object.assign({}, p1.astNode, {
				name = object.assign({}, p1.astNode.name, { value = p2 })
			}),
			extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else array.map(p1.extensionASTNodes, function(p3)
				-- upvalues: object (copy), p2 (ref)
				return object.assign({}, p3, { name = object.assign({}, p3.name, { value = p2 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isInterfaceType(p1)) then
		return graphQLInterfaceType.new(object.assign({}, p1:toConfig(), {
			name = p2,
			astNode = if p1.astNode == nil then p1.astNode else object.assign({}, p1.astNode, {
				name = object.assign({}, p1.astNode.name, { value = p2 })
			}),
			extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else array.map(p1.extensionASTNodes, function(p3)
				-- upvalues: object (copy), p2 (ref)
				return object.assign({}, p3, { name = object.assign({}, p3.name, { value = p2 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isUnionType(p1)) then
		return graphQLUnionType.new(object.assign({}, p1:toConfig(), {
			name = p2,
			astNode = if p1.astNode == nil then p1.astNode else object.assign({}, p1.astNode, {
				name = object.assign({}, p1.astNode.name, { value = p2 })
			}),
			extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else array.map(p1.extensionASTNodes, function(p3)
				-- upvalues: object (copy), p2 (ref)
				return object.assign({}, p3, { name = object.assign({}, p3.name, { value = p2 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isInputObjectType(p1)) then
		return graphQLInputObjectType.new(object.assign({}, p1:toConfig(), {
			name = p2,
			astNode = if p1.astNode == nil then p1.astNode else object.assign({}, p1.astNode, {
				name = object.assign({}, p1.astNode.name, { value = p2 })
			}),
			extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else array.map(p1.extensionASTNodes, function(p3)
				-- upvalues: object (copy), p2 (ref)
				return object.assign({}, p3, { name = object.assign({}, p3.name, { value = p2 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isEnumType(p1)) then
		return graphQLEnumType.new(object.assign({}, p1:toConfig(), {
			name = p2,
			astNode = if p1.astNode == nil then p1.astNode else object.assign({}, p1.astNode, {
				name = object.assign({}, p1.astNode.name, { value = p2 })
			}),
			extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else array.map(p1.extensionASTNodes, function(p3)
				-- upvalues: object (copy), p2 (ref)
				return object.assign({}, p3, { name = object.assign({}, p3.name, { value = p2 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isScalarType(p1)) then
		return graphQLScalarType.new(object.assign({}, p1:toConfig(), {
			name = p2,
			astNode = if p1.astNode == nil then p1.astNode else object.assign({}, p1.astNode, {
				name = object.assign({}, p1.astNode.name, { value = p2 })
			}),
			extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else array.map(p1.extensionASTNodes, function(p3)
				-- upvalues: object (copy), p2 (ref)
				return object.assign({}, p3, { name = object.assign({}, p3.name, { value = p2 }) })
			end)
		}))
	end
	error(error.new(("Unknown type %s."):format(tostring(p1))))
end

return t