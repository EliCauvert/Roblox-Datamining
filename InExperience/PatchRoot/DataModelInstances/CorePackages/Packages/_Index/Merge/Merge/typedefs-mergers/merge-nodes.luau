local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Map = LuauPolyfillModule.Map
local _ = require(script.Parent["merge-typedefs_types"])
local Kind = require(Parent.GraphQL).Kind
local MergeTypeFunction = require(script.Parent.type).mergeType
local MergeEnumFunction = require(script.Parent.enum).mergeEnum
local MergeScalarFunction = require(script.Parent.scalar).mergeScalar
local MergeUnionFunction = require(script.Parent.union).mergeUnion
local MergeInputTypeFunction = require(script.Parent["input-type"]).mergeInputType
local MergeInterfaceFunction = require(script.Parent.interface).mergeInterface
local MergeDirectiveFunction = require(script.Parent.directives).mergeDirective
local MergeSchemaDefsFunction = require(script.Parent["schema-def"]).mergeSchemaDefs
local CollectCommentFunction = require(Parent.Utils).collectComment

return {
	schemaDefSymbol = "SCHEMA_DEF_SYMBOL",
	isNamedDefinitionNode = function(p1): boolean --[[ Line: 71 ]]
		-- upvalues: Array (copy), Object (copy)
		return Array.indexOf(Object.keys(p1), "name") ~= -1
	end,
	mergeGraphQLNodes = function(List, p1) --[[ Line: 77 ]]
		-- upvalues: Map (copy), Boolean (copy), Array (copy), Object (copy), CollectCommentFunction (copy), Kind (copy), MergeTypeFunction (copy), MergeEnumFunction (copy), MergeUnionFunction (copy), MergeScalarFunction (copy), MergeInputTypeFunction (copy), MergeInterfaceFunction (copy), MergeDirectiveFunction (copy), MergeSchemaDefsFunction (copy)
		local NewMap = Map.new()
		
		for _, value in List do
			if not Boolean.toJSBoolean(Array.indexOf(Object.keys(value), "name") ~= -1) then
				if value.kind == Kind.SCHEMA_DEFINITION or value.kind == Kind.SCHEMA_EXTENSION then
					NewMap:set("SCHEMA_DEF_SYMBOL", MergeSchemaDefsFunction(value, NewMap:get("SCHEMA_DEF_SYMBOL"), p1))
					continue
				end
				continue
			end
			local Value = if typeof(value.name) == "table" then value.name.value else nil
			
			if p1 and Boolean.toJSBoolean(p1.commentDescriptions) then
				CollectCommentFunction(value)
			end
			if Value ~= nil then
				if p1 and typeof(p1.exclusions) == "table" and Array.includes(p1.exclusions, Value .. ".*") or p1 and typeof(p1.exclusions) == "table" and Array.includes(p1.exclusions, Value) then
					NewMap:delete(Value)
				else
					local Kind1 = value.kind
					
					if Kind1 == Kind.OBJECT_TYPE_DEFINITION or Kind1 == Kind.OBJECT_TYPE_EXTENSION then
						NewMap:set(Value, MergeTypeFunction(value, NewMap:get(Value), p1))
					elseif Kind1 == Kind.ENUM_TYPE_DEFINITION or Kind1 == Kind.ENUM_TYPE_EXTENSION then
						NewMap:set(Value, MergeEnumFunction(value, NewMap:get(Value), p1))
					elseif Kind1 == Kind.UNION_TYPE_DEFINITION or Kind1 == Kind.UNION_TYPE_EXTENSION then
						NewMap:set(Value, MergeUnionFunction(value, NewMap:get(Value), p1))
					elseif Kind1 == Kind.SCALAR_TYPE_DEFINITION or Kind1 == Kind.SCALAR_TYPE_EXTENSION then
						NewMap:set(Value, MergeScalarFunction(value, NewMap:get(Value), p1))
					elseif Kind1 == Kind.INPUT_OBJECT_TYPE_DEFINITION or Kind1 == Kind.INPUT_OBJECT_TYPE_EXTENSION then
						NewMap:set(Value, MergeInputTypeFunction(value, NewMap:get(Value), p1))
					elseif Kind1 == Kind.INTERFACE_TYPE_DEFINITION or Kind1 == Kind.INTERFACE_TYPE_EXTENSION then
						NewMap:set(Value, MergeInterfaceFunction(value, NewMap:get(Value), p1))
					elseif Kind1 == Kind.DIRECTIVE_DEFINITION then
						NewMap:set(Value, MergeDirectiveFunction(value, (NewMap:get(Value))))
					end
				end
			end
		end
		return NewMap
	end
}