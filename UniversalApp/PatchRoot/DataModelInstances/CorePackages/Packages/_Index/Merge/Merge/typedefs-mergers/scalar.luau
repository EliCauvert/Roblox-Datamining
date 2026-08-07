local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local _ = require(script.Parent["merge-typedefs_types"])

function t.mergeScalar(p0, p1, p2) --[[ line: 24 ]]
	-- upvalues: boolean (ref), mergeDirectives (ref), object (ref), kind (ref)
	return if p1 then {
		name = p0.name,
		description = if boolean.toJSBoolean(p0.description) then p0.description else p1.description,
		kind = if p2 and boolean.toJSBoolean(p2.convertExtensions) or (p0.kind == "ScalarTypeDefinition" or p1.kind == "ScalarTypeDefinition") then "ScalarTypeDefinition" else "ScalarTypeExtension",
		loc = p0.loc,
		directives = mergeDirectives(p0.directives, p1.directives, p2)
	} elseif p2 and boolean.toJSBoolean(p2.convertExtensions) then object.assign({}, p0, { kind = kind.SCALAR_TYPE_DEFINITION }) else p0
end

return t