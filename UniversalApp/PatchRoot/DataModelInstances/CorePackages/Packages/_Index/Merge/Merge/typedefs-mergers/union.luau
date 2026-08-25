local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local mergeNamedTypeArray = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray
local _ = require(script.Parent["merge-typedefs_types"])

function t.mergeUnion(p0, p1, p2)
	-- upvalues: boolean (ref), mergeDirectives (ref), kind (ref), mergeNamedTypeArray (ref), object (ref)
	return if p1 then {
		name = p0.name,
		description = if boolean.toJSBoolean(p0.description) then p0.description else p1.description,
		directives = mergeDirectives(p0.directives, p1.directives, p2),
		kind = if p2 and boolean.toJSBoolean(p2.convertExtensions) or (p0.kind == "UnionTypeDefinition" or p1.kind == "UnionTypeDefinition") then kind.UNION_TYPE_DEFINITION else kind.UNION_TYPE_EXTENSION,
		loc = p0.loc,
		types = mergeNamedTypeArray(p0.types, p1.types, p2)
	} elseif p2 and boolean.toJSBoolean(p2.convertExtensions) then object.assign({}, p0, { kind = kind.UNION_TYPE_DEFINITION }) else p0
end

return t