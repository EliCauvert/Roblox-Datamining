local graphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local _ = require(script.Parent.Parent.language.ast)
local _ = require(script.Parent.Parent.type.definition)
local _ = require(script.Parent.Parent.type.schema)

return {
	getOperationRootType = function(p1, p2)
		-- upvalues: graphQLError (ref)
		if p2.operation == "query" then
			local queryType = p1:getQueryType()
			
			if not queryType then
				error(graphQLError.new("Schema does not define the required query root type.", p2))
			end
			return queryType
		elseif p2.operation == "mutation" then
			local mutationType = p1:getMutationType()
			
			if not mutationType then
				error(graphQLError.new("Schema is not configured for mutations.", p2))
			end
			return mutationType
		elseif p2.operation ~= "subscription" then
			error(graphQLError.new("Can only have query, mutation and subscription operations.", p2))
			
			return
		end
		local subscriptionType = p1:getSubscriptionType()
		
		if not subscriptionType then
			error(graphQLError.new("Schema is not configured for subscriptions.", p2))
		end
		return subscriptionType
	end
}