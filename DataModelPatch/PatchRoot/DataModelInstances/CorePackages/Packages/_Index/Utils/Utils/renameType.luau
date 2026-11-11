local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local GraphQLModule = require(Parent.GraphQL)
local GraphQLEnumType = GraphQLModule.GraphQLEnumType
local GraphQLInputObjectType = GraphQLModule.GraphQLInputObjectType
local GraphQLInterfaceType = GraphQLModule.GraphQLInterfaceType
local GraphQLObjectType = GraphQLModule.GraphQLObjectType
local GraphQLScalarType = GraphQLModule.GraphQLScalarType
local GraphQLUnionType = GraphQLModule.GraphQLUnionType
local IsEnumTypeFunction = GraphQLModule.isEnumType
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsScalarTypeFunction = GraphQLModule.isScalarType
local IsUnionTypeFunction = GraphQLModule.isUnionType

return {
	renameType = function(p1, Value)
		-- upvalues: Boolean (copy), IsObjectTypeFunction (copy), GraphQLObjectType (copy), Object (copy), Array (copy), IsInterfaceTypeFunction (copy), GraphQLInterfaceType (copy), IsUnionTypeFunction (copy), GraphQLUnionType (copy), IsInputObjectTypeFunction (copy), GraphQLInputObjectType (copy), IsEnumTypeFunction (copy), GraphQLEnumType (copy), IsScalarTypeFunction (copy), GraphQLScalarType (copy), Error1 (copy)
		if Boolean.toJSBoolean(IsObjectTypeFunction(p1)) then
			return GraphQLObjectType.new(Object.assign({}, p1:toConfig(), {
				name = Value,
				astNode = if p1.astNode == nil then p1.astNode else Object.assign({}, p1.astNode, {
					name = Object.assign({}, p1.astNode.name, { value = Value })
				}),
				extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else Array.map(p1.extensionASTNodes, function(p2)
					-- upvalues: Object (upval), Value (copy)
					return Object.assign({}, p2, { name = Object.assign({}, p2.name, { value = Value }) })
				end)
			}))
		elseif Boolean.toJSBoolean(IsInterfaceTypeFunction(p1)) then
			return GraphQLInterfaceType.new(Object.assign({}, p1:toConfig(), {
				name = Value,
				astNode = if p1.astNode == nil then p1.astNode else Object.assign({}, p1.astNode, {
					name = Object.assign({}, p1.astNode.name, { value = Value })
				}),
				extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else Array.map(p1.extensionASTNodes, function(p2)
					-- upvalues: Object (upval), Value (copy)
					return Object.assign({}, p2, { name = Object.assign({}, p2.name, { value = Value }) })
				end)
			}))
		elseif Boolean.toJSBoolean(IsUnionTypeFunction(p1)) then
			return GraphQLUnionType.new(Object.assign({}, p1:toConfig(), {
				name = Value,
				astNode = if p1.astNode == nil then p1.astNode else Object.assign({}, p1.astNode, {
					name = Object.assign({}, p1.astNode.name, { value = Value })
				}),
				extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else Array.map(p1.extensionASTNodes, function(p2)
					-- upvalues: Object (upval), Value (copy)
					return Object.assign({}, p2, { name = Object.assign({}, p2.name, { value = Value }) })
				end)
			}))
		elseif Boolean.toJSBoolean(IsInputObjectTypeFunction(p1)) then
			return GraphQLInputObjectType.new(Object.assign({}, p1:toConfig(), {
				name = Value,
				astNode = if p1.astNode == nil then p1.astNode else Object.assign({}, p1.astNode, {
					name = Object.assign({}, p1.astNode.name, { value = Value })
				}),
				extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else Array.map(p1.extensionASTNodes, function(p2)
					-- upvalues: Object (upval), Value (copy)
					return Object.assign({}, p2, { name = Object.assign({}, p2.name, { value = Value }) })
				end)
			}))
		elseif Boolean.toJSBoolean(IsEnumTypeFunction(p1)) then
			return GraphQLEnumType.new(Object.assign({}, p1:toConfig(), {
				name = Value,
				astNode = if p1.astNode == nil then p1.astNode else Object.assign({}, p1.astNode, {
					name = Object.assign({}, p1.astNode.name, { value = Value })
				}),
				extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else Array.map(p1.extensionASTNodes, function(p2)
					-- upvalues: Object (upval), Value (copy)
					return Object.assign({}, p2, { name = Object.assign({}, p2.name, { value = Value }) })
				end)
			}))
		elseif Boolean.toJSBoolean(IsScalarTypeFunction(p1)) then
			return GraphQLScalarType.new(Object.assign({}, p1:toConfig(), {
				name = Value,
				astNode = if p1.astNode == nil then p1.astNode else Object.assign({}, p1.astNode, {
					name = Object.assign({}, p1.astNode.name, { value = Value })
				}),
				extensionASTNodes = if p1.extensionASTNodes == nil then p1.extensionASTNodes else Array.map(p1.extensionASTNodes, function(p2)
					-- upvalues: Object (upval), Value (copy)
					return Object.assign({}, p2, { name = Object.assign({}, p2.name, { value = Value }) })
				end)
			}))
		else
			error(Error1.new(("Unknown type %s."):format((tostring(p1)))))
		end
	end
}