local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local isNillishModule = require(parent.luaUtils.isNillish)
local isNillish = isNillishModule.isNillish
local isNotNillish = isNillishModule.isNotNillish

return {
	LoneSchemaDefinitionRule = function(p0)
		-- upvalues: isNillish (ref), isNotNillish (ref), graphQLError (ref)
		local schema = p0:getSchema()
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
		local var3 = 0
		
		return {
			SchemaDefinition = function(_, p1)
				-- upvalues: isNotNillish (copy), subscriptionType (write), p0 (ref), graphQLError (copy), var3 (write)
				if isNotNillish(subscriptionType) then
					p0:reportError(graphQLError.new("Cannot define a new schema within a schema extension.", p1))
					
					return
				elseif var3 > 0 then
					p0:reportError(graphQLError.new("Must provide only one schema definition.", p1))
				end
				var3 += 1
			end
		}
	end
}