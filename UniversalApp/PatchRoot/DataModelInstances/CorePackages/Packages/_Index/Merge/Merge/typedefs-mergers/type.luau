local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local t = {}
local _ = require(script.Parent["merge-typedefs_types"])
local kind = require(parent.GraphQL).Kind
local mergeFields = require(script.Parent.fields).mergeFields
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local mergeNamedTypeArray = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray

function t.mergeType(p1, p2, p3)
	-- upvalues: boolean (ref), mergeFields (ref), mergeDirectives (ref), mergeNamedTypeArray (ref), error (ref), object (ref), kind (ref)
	if p2 then
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), boolean (copy), p2 (ref), p3 (ref), mergeFields (copy), mergeDirectives (copy), mergeNamedTypeArray (copy)
			return {
				name = p1.name,
				description = if boolean.toJSBoolean(p1.description) then p1.description else p2.description,
				kind = if p3 and boolean.toJSBoolean(p3.convertExtensions) or (p1.kind == "ObjectTypeDefinition" or p2.kind == "ObjectTypeDefinition") then "ObjectTypeDefinition" else "ObjectTypeExtension",
				loc = p1.loc,
				fields = mergeFields(p1, p1.fields, p2.fields, p3),
				directives = mergeDirectives(p1.directives, p2.directives, p3),
				interfaces = mergeNamedTypeArray(p1.interfaces, p2.interfaces, p3)
			}
		end)
		
		if not ok then
			error(error.new(("Unable to merge GraphQL type \"%s\": %s"):format(tostring(p1.name.value), tostring(status.message))))
		end
		return status
	else
		return if p3 and boolean.toJSBoolean(p3.convertExtensions) then object.assign({}, p1, { kind = kind.OBJECT_TYPE_DEFINITION }) else p1
	end
end

return t