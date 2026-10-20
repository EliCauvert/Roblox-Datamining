local Parent = script.Parent.Parent
local Object = require(Parent.Parent.LuauPolyfill).Object
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local _ = require(Parent.type.schema)
local ParseFunction = require(Parent.language.parser).parse
local ExecuteSyncFunction = require(Parent.execution.execute).executeSync
local GetIntrospectionQueryFunction = require(script.Parent.getIntrospectionQuery).getIntrospectionQuery

return {
	introspectionFromSchema = function(Schema, p1)
		-- upvalues: Object (copy), ParseFunction (copy), GetIntrospectionQueryFunction (copy), ExecuteSyncFunction (copy), InvariantFunction (copy)
		local ExecuteSyncResult = ExecuteSyncFunction({
			schema = Schema,
			document = ParseFunction(GetIntrospectionQueryFunction((Object.assign({
				specifiedByUrl = true,
				directiveIsRepeatable = true,
				schemaDescription = true,
				inputValueDeprecation = true
			}, p1))))
		})
		InvariantFunction(not ExecuteSyncResult.errors and ExecuteSyncResult.data)
		
		return ExecuteSyncResult.data
	end
}