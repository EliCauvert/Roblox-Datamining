local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local _ = require(script.Parent["merge-typedefs_types"])
local Kind = require(Parent.GraphQL).Kind
local MergeFieldsFunction = require(script.Parent.fields).mergeFields
local MergeDirectivesFunction = require(script.Parent.directives).mergeDirectives
local MergeNamedTypeArrayFunction = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray

return {
	mergeType = function(p1, p2, p3) --[[ Line: 29 ]]
		-- upvalues: Boolean (copy), MergeFieldsFunction (copy), MergeDirectivesFunction (copy), MergeNamedTypeArrayFunction (copy), Error1 (copy), Object (copy), Kind (copy)
		if not p2 then
			return if p3 and Boolean.toJSBoolean(p3.convertExtensions) then Object.assign({}, p1, { kind = Kind.OBJECT_TYPE_DEFINITION }) else p1
		end
		local Success, Result = pcall(function() --[[ Line: 41 ]]
			-- upvalues: p1 (copy), Boolean (upval), p2 (copy), p3 (copy), MergeFieldsFunction (upval), MergeDirectivesFunction (upval), MergeNamedTypeArrayFunction (upval)
			return {
				name = p1.name,
				description = if Boolean.toJSBoolean(p1.description) then p1.description else p2.description,
				kind = if p3 and Boolean.toJSBoolean(p3.convertExtensions) then "ObjectTypeDefinition" elseif p1.kind == "ObjectTypeDefinition" or p2.kind == "ObjectTypeDefinition" then "ObjectTypeDefinition" else "ObjectTypeExtension",
				loc = p1.loc,
				fields = MergeFieldsFunction(p1, p1.fields, p2.fields, p3),
				directives = MergeDirectivesFunction(p1.directives, p2.directives, p3),
				interfaces = MergeNamedTypeArrayFunction(p1.interfaces, p2.interfaces, p3)
			}
		end)
		
		if not Success then
			error(Error1.new(("Unable to merge GraphQL type \"%s\": %s"):format(tostring(p1.name.value), (tostring(Result.message)))))
		end
		return Result
	end
}