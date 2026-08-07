local parent = script.Parent.Parent
local object = require(parent.Parent.LuauPolyfill).Object
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.type.schema)
local parse = require(parent.language.parser).parse
local executeSync = require(parent.execution.execute).executeSync
local getIntrospectionQuery = require(script.Parent.getIntrospectionQuery).getIntrospectionQuery

return {
	introspectionFromSchema = function(p0, p1) --[[ line: 37 ]]
		-- upvalues: object (ref), parse (ref), getIntrospectionQuery (ref), executeSync (ref), invariant (ref)
		local var0 = executeSync({
			schema = p0,
			document = parse(getIntrospectionQuery(object.assign({
				specifiedByUrl = true,
				directiveIsRepeatable = true,
				schemaDescription = true,
				inputValueDeprecation = true
			}, p1)))
		})
		invariant(not var0.errors and var0.data)
		
		return var0.data
	end
}