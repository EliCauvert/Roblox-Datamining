-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local _ = require(script.Parent.Parent.language.directiveLocation)

function getIntrospectionQuery(p0) --[[ line: 39 ]]
	-- upvalues: object (ref)
	local var0 = object.assign({
		descriptions = true,
		specifiedByUrl = false,
		directiveIsRepeatable = false,
		schemaDescription = false,
		inputValueDeprecation = false
	}, p0)
	local var1 = if var0.descriptions then "description" else ""
	
	local function _(p1) --[[ line: 55 | named "inputDeprecation" ]]
		-- upvalues: var0 (ref)
		return if var0.inputValueDeprecation then p1 else ""
	end
	
	return ("\n    query IntrospectionQuery {\n      __schema {\n        %s\n        queryType { name }\n        mutationType { name }\n        subscriptionType { name }\n        types {\n          ...FullType\n        }\n        directives {\n          name\n          %s\n          %s\n          locations\n          args%s {\n            ...InputValue\n          }\n        }\n      }\n    }\n\n    fragment FullType on __Type {\n      kind\n      name\n      %s\n      %s\n      fields(includeDeprecated: true) {\n        name\n        %s\n        args%s {\n          ...InputValue\n        }\n        type {\n          ...TypeRef\n        }\n        isDeprecated\n        deprecationReason\n      }\n      inputFields%s {\n        ...InputValue\n      }\n      interfaces {\n        ...TypeRef\n      }\n      enumValues(includeDeprecated: true) {\n        name\n        %s\n        isDeprecated\n        deprecationReason\n      }\n      possibleTypes {\n        ...TypeRef\n      }\n    }\n\n    fragment InputValue on __InputValue {\n      name\n      %s\n      type { ...TypeRef }\n      defaultValue\n      %s\n      %s\n    }\n\n    fragment TypeRef on __Type {\n      kind\n      name\n      ofType {\n        kind\n        name\n        ofType {\n          kind\n          name\n          ofType {\n            kind\n            name\n            ofType {\n              kind\n              name\n              ofType {\n                kind\n                name\n                ofType {\n                  kind\n                  name\n                  ofType {\n                    kind\n                    name\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  "):format(if var0.schemaDescription then var1 else "", var1, if var0.directiveIsRepeatable then "isRepeatable" else "", if var0.inputValueDeprecation then "(includeDeprecated: true)" else "", var1, if var0.specifiedByUrl then "specifiedByUrl" else "", var1, if var0.inputValueDeprecation then "(includeDeprecated: true)" else "", if var0.inputValueDeprecation then "(includeDeprecated: true)" else "", var1, var1, if var0.inputValueDeprecation then "isDeprecated" else "", if var0.inputValueDeprecation then "deprecationReason" else "")
end

return { getIntrospectionQuery = getIntrospectionQuery }