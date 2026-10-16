local Object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local _ = require(script.Parent.Parent.language.directiveLocation)

function getIntrospectionQuery(p1): string --[[ Line: 39 ]]
	-- upvalues: Object (copy)
	local AssignResult = Object.assign({
		descriptions = true,
		specifiedByUrl = false,
		directiveIsRepeatable = false,
		schemaDescription = false,
		inputValueDeprecation = false
	}, p1)
	local Description: string = if AssignResult.descriptions then "description" else ""
	
	local function _(p2) --[[ Line: 55 | Named "inputDeprecation" ]]
		-- upvalues: AssignResult (copy)
		return if AssignResult.inputValueDeprecation then p2 else ""
	end
	
	return ("\n    query IntrospectionQuery {\n      __schema {\n        %s\n        queryType { name }\n        mutationType { name }\n        subscriptionType { name }\n        types {\n          ...FullType\n        }\n        directives {\n          name\n          %s\n          %s\n          locations\n          args%s {\n            ...InputValue\n          }\n        }\n      }\n    }\n\n    fragment FullType on __Type {\n      kind\n      name\n      %s\n      %s\n      fields(includeDeprecated: true) {\n        name\n        %s\n        args%s {\n          ...InputValue\n        }\n        type {\n          ...TypeRef\n        }\n        isDeprecated\n        deprecationReason\n      }\n      inputFields%s {\n        ...InputValue\n      }\n      interfaces {\n        ...TypeRef\n      }\n      enumValues(includeDeprecated: true) {\n        name\n        %s\n        isDeprecated\n        deprecationReason\n      }\n      possibleTypes {\n        ...TypeRef\n      }\n    }\n\n    fragment InputValue on __InputValue {\n      name\n      %s\n      type { ...TypeRef }\n      defaultValue\n      %s\n      %s\n    }\n\n    fragment TypeRef on __Type {\n      kind\n      name\n      ofType {\n        kind\n        name\n        ofType {\n          kind\n          name\n          ofType {\n            kind\n            name\n            ofType {\n              kind\n              name\n              ofType {\n                kind\n                name\n                ofType {\n                  kind\n                  name\n                  ofType {\n                    kind\n                    name\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  "):format(if AssignResult.schemaDescription then Description else "", Description, if AssignResult.directiveIsRepeatable then "isRepeatable" else "", if AssignResult.inputValueDeprecation then "(includeDeprecated: true)" else "", Description, if AssignResult.specifiedByUrl then "specifiedByUrl" else "", Description, if AssignResult.inputValueDeprecation then "(includeDeprecated: true)" else "", if AssignResult.inputValueDeprecation then "(includeDeprecated: true)" else "", Description, Description, if AssignResult.inputValueDeprecation then "isDeprecated" else "", if AssignResult.inputValueDeprecation then "deprecationReason" else "")
end

return { getIntrospectionQuery = getIntrospectionQuery }