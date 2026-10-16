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
	mergeInterface = function(p1, p2, p3) --[[ Line: 31 ]]
		-- upvalues: Boolean (copy), MergeFieldsFunction (copy), MergeDirectivesFunction (copy), MergeNamedTypeArrayFunction (copy), Error1 (copy), Object (copy), Kind (copy)
		if not Boolean.toJSBoolean(p2) then
			return if Boolean.toJSBoolean(if typeof(p3) == "table" then p3.convertExtensions else nil) then Object.assign({}, p1, { kind = Kind.INTERFACE_TYPE_DEFINITION }) else p1
		end
		local Success, Result = pcall(function() --[[ Line: 40 ]]
			-- upvalues: p1 (copy), Boolean (upval), p2 (copy), p3 (copy), MergeFieldsFunction (upval), MergeDirectivesFunction (upval), MergeNamedTypeArrayFunction (upval)
			local ToJSBooleanFunction = Boolean.toJSBoolean
			local ConvertExtensions = p3 and p3.convertExtensions
			
			return {
				name = p1.name,
				description = if Boolean.toJSBoolean(p1.description) then p1.description else p2.description,
				kind = if ToJSBooleanFunction(ConvertExtensions) or p1.kind == "InterfaceTypeDefinition" or p2.kind == "InterfaceTypeDefinition" then "InterfaceTypeDefinition" else "InterfaceTypeExtension",
				loc = p1.loc,
				fields = MergeFieldsFunction(p1, p1.fields, p2.fields, p3),
				directives = MergeDirectivesFunction(p1.directives, p2.directives, p3),
				interfaces = if Boolean.toJSBoolean(p1.interfaces) then MergeNamedTypeArrayFunction(p1.interfaces, p2.interfaces, p3) else nil
			}
		end)
		
		if not Success then
			error(Error1.new(("Unable to merge GraphQL interface \"%s\": %s"):format(tostring(p1.name.value), (tostring(Result.message)))))
		end
		return Result
	end
}