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

function t.mergeType(p0, p1, p2) --[[ line: 29 ]]
	-- upvalues: boolean (ref), mergeFields (ref), mergeDirectives (ref), mergeNamedTypeArray (ref), error (ref), object (ref), kind (ref)
	if p1 then
		local ok, status = pcall(function() --[[ line: 41 ]]
			-- upvalues: p0 (ref), boolean (copy), p1 (ref), p2 (ref), mergeFields (copy), mergeDirectives (copy), mergeNamedTypeArray (copy)
			return {
				name = p0.name,
				description = if boolean.toJSBoolean(p0.description) then p0.description else p1.description,
				kind = if p2 and boolean.toJSBoolean(p2.convertExtensions) or (p0.kind == "ObjectTypeDefinition" or p1.kind == "ObjectTypeDefinition") then "ObjectTypeDefinition" else "ObjectTypeExtension",
				loc = p0.loc,
				fields = mergeFields(p0, p0.fields, p1.fields, p2),
				directives = mergeDirectives(p0.directives, p1.directives, p2),
				interfaces = mergeNamedTypeArray(p0.interfaces, p1.interfaces, p2)
			}
		end)
		
		if not ok then
			error(error.new(("Unable to merge GraphQL type \"%s\": %s"):format(tostring(p0.name.value), tostring(status.message))))
		end
		return status
	else
		return if p2 and boolean.toJSBoolean(p2.convertExtensions) then object.assign({}, p0, { kind = kind.OBJECT_TYPE_DEFINITION }) else p0
	end
end

return t