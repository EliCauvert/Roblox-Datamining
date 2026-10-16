local GraphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueOperationTypesRule = function(p1) --[[ Line: 19 ]]
		-- upvalues: GraphQLError (copy)
		local Schema = p1:getSchema()
		local t = {}
		local Config = Schema and {
			query = Schema:getQueryType(),
			mutation = Schema:getMutationType(),
			subscription = Schema:getSubscriptionType()
		} or {}
		
		local function checkOperationTypes(_, p2): boolean --[[ Line: 32 ]]
			-- upvalues: t (copy), Config (copy), p1 (copy), GraphQLError (upval)
			local OperationTypes = p2.operationTypes or {}
			for _, operationType in ipairs(OperationTypes) do
				local Operation = operationType.operation
				local Entry = t[Operation]
				
				if Config[Operation] then
					p1:reportError(GraphQLError.new(("Type for %s already defined in the schema. It cannot be redefined."):format(Operation), operationType))
				elseif Entry then
					p1:reportError(GraphQLError.new(("There can be only one %s type in schema."):format(Operation), { Entry, operationType }))
				else
					t[Operation] = operationType
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