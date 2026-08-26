local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueOperationTypesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local var1
		local schema = p1:getSchema()
		local t = {}
		
		if schema then
			var1 = {
				query = schema:getQueryType(),
				mutation = schema:getMutationType(),
				subscription = schema:getSubscriptionType()
			} or {}
		end
		local function checkOperationTypes(_, p2)
			-- upvalues: t (ref), var1 (ref), p1 (ref), graphQLError (copy)
			for i, v in ipairs(p2.operationTypes or {}) do
				local operation = v.operation
				local var2 = t[operation]
				
				if var1[operation] then
					p1:reportError(graphQLError.new(("Type for %s already defined in the schema. It cannot be redefined."):format(operation), v))
				elseif var2 then
					p1:reportError(graphQLError.new(("There can be only one %s type in schema."):format(operation), { var2, v }))
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