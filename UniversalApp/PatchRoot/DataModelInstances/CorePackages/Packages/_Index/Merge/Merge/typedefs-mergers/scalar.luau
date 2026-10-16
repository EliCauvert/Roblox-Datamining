local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Kind = require(Parent.GraphQL).Kind
local MergeDirectivesFunction = require(script.Parent.directives).mergeDirectives
local _ = require(script.Parent["merge-typedefs_types"])

return {
	mergeScalar = function(p1, p2, p3) --[[ Line: 24 ]]
		-- upvalues: Boolean (copy), MergeDirectivesFunction (copy), Object (copy), Kind (copy)
		return if p2 then {
			name = p1.name,
			description = if Boolean.toJSBoolean(p1.description) then p1.description else p2.description,
			kind = if p3 and Boolean.toJSBoolean(p3.convertExtensions) then "ScalarTypeDefinition" elseif p1.kind == "ScalarTypeDefinition" or p2.kind == "ScalarTypeDefinition" then "ScalarTypeDefinition" else "ScalarTypeExtension",
			loc = p1.loc,
			directives = MergeDirectivesFunction(p1.directives, p2.directives, p3)
		} elseif p3 and Boolean.toJSBoolean(p3.convertExtensions) then Object.assign({}, p1, { kind = Kind.SCALAR_TYPE_DEFINITION }) else p1
	end
}