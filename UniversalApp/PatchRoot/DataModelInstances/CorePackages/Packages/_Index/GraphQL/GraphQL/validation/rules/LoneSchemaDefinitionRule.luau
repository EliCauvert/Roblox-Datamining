local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local isNillishModule = require(parent.luaUtils.isNillish)
local isNillish = isNillishModule.isNillish
local isNotNillish = isNillishModule.isNotNillish

return {
	LoneSchemaDefinitionRule = function(p1)
		-- upvalues: isNillish (ref), isNotNillish (ref), graphQLError (ref)
		local schema = p1:getSchema()
		local subscriptionType = nil
		
		if schema then
			subscriptionType = schema.astNode
			
			if isNillish(subscriptionType) then
				subscriptionType = schema:getQueryType()
			end
			if isNillish(subscriptionType) then
				subscriptionType = schema:getMutationType()
			end
			if isNillish(subscriptionType) then
				subscriptionType = schema:getSubscriptionType()
			end
		end
		local var1 = 0
		
		return {
			SchemaDefinition = function(_, p2)
				-- upvalues: isNotNillish (copy), subscriptionType (write), p1 (ref), graphQLError (copy), var1 (write)
				if isNotNillish(subscriptionType) then
					p1:reportError(graphQLError.new("Cannot define a new schema within a schema extension.", p2))
					
					return
				elseif var1 > 0 then
					p1:reportError(graphQLError.new("Must provide only one schema definition.", p2))
				end
				var1 += 1
			end
		}
	end
}