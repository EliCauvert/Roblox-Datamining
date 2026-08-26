local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local mergeEnumValues = require(script.Parent["enum-values"]).mergeEnumValues
local _ = require(script.Parent["merge-typedefs_types"])

function t.mergeEnum(p1, p2, p3)
	-- upvalues: boolean (ref), mergeDirectives (ref), mergeEnumValues (ref), object (ref), kind (ref)
	return if boolean.toJSBoolean(p2) then {
		name = p1.name,
		description = if boolean.toJSBoolean(p1.description) then p1.description else p2.description,
		kind = if p3 and boolean.toJSBoolean(p3.convertExtensions) or (p1.kind == "EnumTypeDefinition" or p2.kind == "EnumTypeDefinition") then "EnumTypeDefinition" else "EnumTypeExtension",
		loc = p1.loc,
		directives = mergeDirectives(p1.directives, p2.directives, p3),
		values = mergeEnumValues(p1.values, p2.values, p3)
	} elseif p3 and boolean.toJSBoolean(p3.convertExtensions) then object.assign({}, p1, { kind = kind.ENUM_TYPE_DEFINITION }) else p1
end

return t