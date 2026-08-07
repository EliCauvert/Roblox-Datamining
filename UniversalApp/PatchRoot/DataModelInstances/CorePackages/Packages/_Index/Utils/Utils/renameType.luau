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

function t.renameType(p0, p1) --[[ line: 52 ]]
	-- upvalues: boolean (ref), isObjectType (ref), graphQLObjectType (ref), object (ref), array (ref), isInterfaceType (ref), graphQLInterfaceType (ref), isUnionType (ref), graphQLUnionType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), isEnumType (ref), graphQLEnumType (ref), isScalarType (ref), graphQLScalarType (ref), error (ref)
	if boolean.toJSBoolean(isObjectType(p0)) then
		return graphQLObjectType.new(object.assign({}, p0:toConfig(), {
			name = p1,
			astNode = if p0.astNode == nil then p0.astNode else object.assign({}, p0.astNode, {
				name = object.assign({}, p0.astNode.name, { value = p1 })
			}),
			extensionASTNodes = if p0.extensionASTNodes == nil then p0.extensionASTNodes else array.map(p0.extensionASTNodes, function(p2) --[[ line: 68 ]]
				-- upvalues: object (copy), p1 (ref)
				return object.assign({}, p2, { name = object.assign({}, p2.name, { value = p1 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isInterfaceType(p0)) then
		return graphQLInterfaceType.new(object.assign({}, p0:toConfig(), {
			name = p1,
			astNode = if p0.astNode == nil then p0.astNode else object.assign({}, p0.astNode, {
				name = object.assign({}, p0.astNode.name, { value = p1 })
			}),
			extensionASTNodes = if p0.extensionASTNodes == nil then p0.extensionASTNodes else array.map(p0.extensionASTNodes, function(p3) --[[ line: 88 ]]
				-- upvalues: object (copy), p1 (ref)
				return object.assign({}, p3, { name = object.assign({}, p3.name, { value = p1 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isUnionType(p0)) then
		return graphQLUnionType.new(object.assign({}, p0:toConfig(), {
			name = p1,
			astNode = if p0.astNode == nil then p0.astNode else object.assign({}, p0.astNode, {
				name = object.assign({}, p0.astNode.name, { value = p1 })
			}),
			extensionASTNodes = if p0.extensionASTNodes == nil then p0.extensionASTNodes else array.map(p0.extensionASTNodes, function(p4) --[[ line: 108 ]]
				-- upvalues: object (copy), p1 (ref)
				return object.assign({}, p4, { name = object.assign({}, p4.name, { value = p1 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isInputObjectType(p0)) then
		return graphQLInputObjectType.new(object.assign({}, p0:toConfig(), {
			name = p1,
			astNode = if p0.astNode == nil then p0.astNode else object.assign({}, p0.astNode, {
				name = object.assign({}, p0.astNode.name, { value = p1 })
			}),
			extensionASTNodes = if p0.extensionASTNodes == nil then p0.extensionASTNodes else array.map(p0.extensionASTNodes, function(p5) --[[ line: 128 ]]
				-- upvalues: object (copy), p1 (ref)
				return object.assign({}, p5, { name = object.assign({}, p5.name, { value = p1 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isEnumType(p0)) then
		return graphQLEnumType.new(object.assign({}, p0:toConfig(), {
			name = p1,
			astNode = if p0.astNode == nil then p0.astNode else object.assign({}, p0.astNode, {
				name = object.assign({}, p0.astNode.name, { value = p1 })
			}),
			extensionASTNodes = if p0.extensionASTNodes == nil then p0.extensionASTNodes else array.map(p0.extensionASTNodes, function(p6) --[[ line: 148 ]]
				-- upvalues: object (copy), p1 (ref)
				return object.assign({}, p6, { name = object.assign({}, p6.name, { value = p1 }) })
			end)
		}))
	elseif boolean.toJSBoolean(isScalarType(p0)) then
		return graphQLScalarType.new(object.assign({}, p0:toConfig(), {
			name = p1,
			astNode = if p0.astNode == nil then p0.astNode else object.assign({}, p0.astNode, {
				name = object.assign({}, p0.astNode.name, { value = p1 })
			}),
			extensionASTNodes = if p0.extensionASTNodes == nil then p0.extensionASTNodes else array.map(p0.extensionASTNodes, function(p7) --[[ line: 168 ]]
				-- upvalues: object (copy), p1 (ref)
				return object.assign({}, p7, { name = object.assign({}, p7.name, { value = p1 }) })
			end)
		}))
	end
	error(error.new(("Unknown type %s."):format(tostring(p0))))
end

return t