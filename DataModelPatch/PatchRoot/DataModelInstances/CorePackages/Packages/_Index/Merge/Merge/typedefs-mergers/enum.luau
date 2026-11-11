local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Kind = require(Parent.GraphQL).Kind
local MergeDirectivesFunction = require(script.Parent.directives).mergeDirectives
local MergeEnumValuesFunction = require(script.Parent["enum-values"]).mergeEnumValues
local _ = require(script.Parent["merge-typedefs_types"])

return {
	mergeEnum = function(p1, p2, p3)
		-- upvalues: Boolean (copy), MergeDirectivesFunction (copy), MergeEnumValuesFunction (copy), Object (copy), Kind (copy)
		return if Boolean.toJSBoolean(p2) then {
			name = p1.name,
			description = if Boolean.toJSBoolean(p1.description) then p1.description else p2.description,
			kind = if p3 and Boolean.toJSBoolean(p3.convertExtensions) then "EnumTypeDefinition" elseif p1.kind == "EnumTypeDefinition" or p2.kind == "EnumTypeDefinition" then "EnumTypeDefinition" else "EnumTypeExtension",
			loc = p1.loc,
			directives = MergeDirectivesFunction(p1.directives, p2.directives, p3),
			values = MergeEnumValuesFunction(p1.values, p2.values, p3)
		} elseif p3 and Boolean.toJSBoolean(p3.convertExtensions) then Object.assign({}, p1, { kind = Kind.ENUM_TYPE_DEFINITION }) else p1
	end
}