local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Kind = require(Parent.GraphQL).Kind
local MergeDirectivesFunction = require(script.Parent.directives).mergeDirectives
local MergeNamedTypeArrayFunction = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray
local _ = require(script.Parent["merge-typedefs_types"])

return {
	mergeUnion = function(p1, p2, p3)
		-- upvalues: Boolean (copy), MergeDirectivesFunction (copy), Kind (copy), MergeNamedTypeArrayFunction (copy), Object (copy)
		return if p2 then {
			name = p1.name,
			description = if Boolean.toJSBoolean(p1.description) then p1.description else p2.description,
			directives = MergeDirectivesFunction(p1.directives, p2.directives, p3),
			kind = if p3 and Boolean.toJSBoolean(p3.convertExtensions) then Kind.UNION_TYPE_DEFINITION elseif p1.kind == "UnionTypeDefinition" or p2.kind == "UnionTypeDefinition" then Kind.UNION_TYPE_DEFINITION else Kind.UNION_TYPE_EXTENSION,
			loc = p1.loc,
			types = MergeNamedTypeArrayFunction(p1.types, p2.types, p3)
		} elseif p3 and Boolean.toJSBoolean(p3.convertExtensions) then Object.assign({}, p1, { kind = Kind.UNION_TYPE_DEFINITION }) else p1
	end
}