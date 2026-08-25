local graphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local _ = require(script.Parent.Parent.language.ast)
local _ = require(script.Parent.Parent.type.definition)
local _ = require(script.Parent.Parent.type.schema)

return {
	getOperationRootType = function(p0, p1)
		-- upvalues: graphQLError (ref)
		if p1.operation == "query" then
			local queryType = p0:getQueryType()
			
			if not queryType then
				error(graphQLError.new("Schema does not define the required query root type.", p1))
			end
			return queryType
		elseif p1.operation == "mutation" then
			local mutationType = p0:getMutationType()
			
			if not mutationType then
				error(graphQLError.new("Schema is not configured for mutations.", p1))
			end
			return mutationType
		elseif p1.operation ~= "subscription" then
			error(graphQLError.new("Can only have query, mutation and subscription operations.", p1))
			
			return
		end
		local subscriptionType = p0:getSubscriptionType()
		
		if not subscriptionType then
			error(graphQLError.new("Schema is not configured for subscriptions.", p1))
		end
		return subscriptionType
	end
}