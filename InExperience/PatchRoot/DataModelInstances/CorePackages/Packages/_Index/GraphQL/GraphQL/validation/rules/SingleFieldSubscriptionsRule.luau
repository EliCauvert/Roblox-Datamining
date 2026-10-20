local Parent = script.Parent.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError

return {
	SingleFieldSubscriptionsRule = function(p1)
		-- upvalues: GraphQLError (copy), Array (copy)
		return {
			OperationDefinition = function(_, p2)
				-- upvalues: p1 (copy), GraphQLError (upval), Array (upval)
				if p2.operation == "subscription" and #p2.selectionSet.selections ~= 1 then
					p1:reportError(GraphQLError.new(p2.name and ("Subscription \"%s\" must select only one top level field."):format(p2.name.value) or "Anonymous Subscription must select only one top level field.", Array.slice(p2.selectionSet.selections, 2)))
				end
			end
		}
	end
}