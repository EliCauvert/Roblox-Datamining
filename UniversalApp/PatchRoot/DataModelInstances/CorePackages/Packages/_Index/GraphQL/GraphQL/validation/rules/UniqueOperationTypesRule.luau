local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueOperationTypesRule = function(p0) --[[ line: 19 ]]
		-- upvalues: graphQLError (ref)
		local var2
		local schema = p0:getSchema()
		local t = {}
		
		if schema then
			var2 = {
				query = schema:getQueryType(),
				mutation = schema:getMutationType(),
				subscription = schema:getSubscriptionType()
			} or {}
		end
		local function checkOperationTypes(_, p1) --[[ line: 32 ]]
			-- upvalues: t (ref), var2 (ref), p0 (ref), graphQLError (copy)
			for i, v in ipairs(p1.operationTypes or {}) do
				local operation = v.operation
				local var4 = t[operation]
				
				if var2[operation] then
					p0:reportError(graphQLError.new(("Type for %s already defined in the schema. It cannot be redefined."):format(operation), v))
				elseif var4 then
					p0:reportError(graphQLError.new(("There can be only one %s type in schema."):format(operation), { var4, v }))
				else
					t[operation] = v
				end
			end
			return false
		end
		
		return {
			SchemaDefinition = checkOperationTypes,
			SchemaExtension = checkOperationTypes
		}
	end
}