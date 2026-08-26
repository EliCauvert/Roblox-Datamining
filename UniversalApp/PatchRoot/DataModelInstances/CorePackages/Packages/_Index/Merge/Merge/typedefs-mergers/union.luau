local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local mergeNamedTypeArray = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray
local _ = require(script.Parent["merge-typedefs_types"])

function t.mergeUnion(p1, p2, p3)
	-- upvalues: boolean (ref), mergeDirectives (ref), kind (ref), mergeNamedTypeArray (ref), object (ref)
	return if p2 then {
		name = p1.name,
		description = if boolean.toJSBoolean(p1.description) then p1.description else p2.description,
		directives = mergeDirectives(p1.directives, p2.directives, p3),
		kind = if p3 and boolean.toJSBoolean(p3.convertExtensions) or (p1.kind == "UnionTypeDefinition" or p2.kind == "UnionTypeDefinition") then kind.UNION_TYPE_DEFINITION else kind.UNION_TYPE_EXTENSION,
		loc = p1.loc,
		types = mergeNamedTypeArray(p1.types, p2.types, p3)
	} elseif p3 and boolean.toJSBoolean(p3.convertExtensions) then object.assign({}, p1, { kind = kind.UNION_TYPE_DEFINITION }) else p1
end

return t