local GraphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local _ = require(script.Parent.Parent.language.ast)
local _ = require(script.Parent.Parent.type.definition)
local _ = require(script.Parent.Parent.type.schema)

return {
	getOperationRootType = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: GraphQLError (copy)
		if p2.operation == "query" then
			local QueryType = p1:getQueryType()
			
			if not QueryType then
				error(GraphQLError.new("Schema does not define the required query root type.", p2))
			end
			return QueryType
		elseif p2.operation == "mutation" then
			local MutationType = p1:getMutationType()
			
			if not MutationType then
				error(GraphQLError.new("Schema is not configured for mutations.", p2))
			end
			return MutationType
		else
			if p2.operation ~= "subscription" then
				error(GraphQLError.new("Can only have query, mutation and subscription operations.", p2))
				
				return
			end
			local SubscriptionType = p1:getSubscriptionType()
			
			if not SubscriptionType then
				error(GraphQLError.new("Schema is not configured for subscriptions.", p2))
			end
			return SubscriptionType
		end
	end
}