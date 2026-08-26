local parent = script.Parent.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.type.schema)
local parse = require(parent.language.parser).parse
local executeSync = require(parent.execution.execute).executeSync
local getIntrospectionQuery = require(script.Parent.getIntrospectionQuery).getIntrospectionQuery

return {
	introspectionFromSchema = function(p1, p2)
		-- upvalues: object (ref), parse (ref), getIntrospectionQuery (ref), executeSync (ref), invariant (ref)
		local var1 = executeSync({
			schema = p1,
			document = parse(getIntrospectionQuery(object.assign({
				specifiedByUrl = true,
				directiveIsRepeatable = true,
				schemaDescription = true,
				inputValueDeprecation = true
			}, p2)))
		})
		invariant(not var1.errors and var1.data)
		
		return var1.data
	end
}