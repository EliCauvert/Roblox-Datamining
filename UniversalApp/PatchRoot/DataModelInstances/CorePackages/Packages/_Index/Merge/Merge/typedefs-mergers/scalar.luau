local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local _ = require(script.Parent["merge-typedefs_types"])

function t.mergeScalar(p1, p2, p3)
	-- upvalues: boolean (ref), mergeDirectives (ref), object (ref), kind (ref)
	return if p2 then {
		name = p1.name,
		description = if boolean.toJSBoolean(p1.description) then p1.description else p2.description,
		kind = if p3 and boolean.toJSBoolean(p3.convertExtensions) or (p1.kind == "ScalarTypeDefinition" or p2.kind == "ScalarTypeDefinition") then "ScalarTypeDefinition" else "ScalarTypeExtension",
		loc = p1.loc,
		directives = mergeDirectives(p1.directives, p2.directives, p3)
	} elseif p3 and boolean.toJSBoolean(p3.convertExtensions) then object.assign({}, p1, { kind = kind.SCALAR_TYPE_DEFINITION }) else p1
end

return t