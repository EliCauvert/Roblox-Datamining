local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local map = luauPolyfillModule.Map
local t = {
	schemaDefSymbol = "SCHEMA_DEF_SYMBOL",
	isNamedDefinitionNode = function(p1)
		-- upvalues: array (ref), object (ref)
		return array.indexOf(object.keys(p1), "name") ~= -1
	end
}
local _ = require(script.Parent["merge-typedefs_types"])
local kind = require(parent.GraphQL).Kind
local mergeType = require(script.Parent.type).mergeType
local mergeEnum = require(script.Parent.enum).mergeEnum
local mergeScalar = require(script.Parent.scalar).mergeScalar
local mergeUnion = require(script.Parent.union).mergeUnion
local mergeInputType = require(script.Parent["input-type"]).mergeInputType
local mergeInterface = require(script.Parent.interface).mergeInterface
local mergeDirective = require(script.Parent.directives).mergeDirective
local mergeSchemaDefs = require(script.Parent["schema-def"]).mergeSchemaDefs
local collectComment = require(parent.Utils).collectComment

function t.mergeGraphQLNodes(p1, p2)
	-- upvalues: map (ref), boolean (ref), array (ref), object (ref), collectComment (ref), kind (ref), mergeType (ref), mergeEnum (ref), mergeUnion (ref), mergeScalar (ref), mergeInputType (ref), mergeInterface (ref), mergeDirective (ref), mergeSchemaDefs (ref)
	local var1 = map.new()
	
	for i, v in p1 do
		if boolean.toJSBoolean(array.indexOf(object.keys(v), "name") ~= -1) then
			local var2 = if typeof(v.name) == "table" then v.name.value else nil
			
			if p2 and boolean.toJSBoolean(p2.commentDescriptions) then
				collectComment(v)
			end
			if var2 ~= nil then
				if p2 and typeof(p2.exclusions) == "table" and array.includes(p2.exclusions, var2 .. ".*") or p2 and typeof(p2.exclusions) == "table" and array.includes(p2.exclusions, var2) then
					var1:delete(var2)
				else
					local kind_1 = v.kind
					
					if kind_1 == kind.OBJECT_TYPE_DEFINITION or kind_1 == kind.OBJECT_TYPE_EXTENSION then
						var1:set(var2, mergeType(v, var1:get(var2), p2))
					elseif kind_1 == kind.ENUM_TYPE_DEFINITION or kind_1 == kind.ENUM_TYPE_EXTENSION then
						var1:set(var2, mergeEnum(v, var1:get(var2), p2))
					elseif kind_1 == kind.UNION_TYPE_DEFINITION or kind_1 == kind.UNION_TYPE_EXTENSION then
						var1:set(var2, mergeUnion(v, var1:get(var2), p2))
					elseif kind_1 == kind.SCALAR_TYPE_DEFINITION or kind_1 == kind.SCALAR_TYPE_EXTENSION then
						var1:set(var2, mergeScalar(v, var1:get(var2), p2))
					elseif kind_1 == kind.INPUT_OBJECT_TYPE_DEFINITION or kind_1 == kind.INPUT_OBJECT_TYPE_EXTENSION then
						var1:set(var2, mergeInputType(v, var1:get(var2), p2))
					elseif kind_1 == kind.INTERFACE_TYPE_DEFINITION or kind_1 == kind.INTERFACE_TYPE_EXTENSION then
						var1:set(var2, mergeInterface(v, var1:get(var2), p2))
					elseif kind_1 == kind.DIRECTIVE_DEFINITION then
						var1:set(var2, mergeDirective(v, var1:get(var2)))
					end
				end
			end
		elseif v.kind == kind.SCHEMA_DEFINITION or v.kind == kind.SCHEMA_EXTENSION then
			var1:set("SCHEMA_DEF_SYMBOL", mergeSchemaDefs(v, var1:get("SCHEMA_DEF_SYMBOL"), p2))
		end
	end
	return var1
end

return t