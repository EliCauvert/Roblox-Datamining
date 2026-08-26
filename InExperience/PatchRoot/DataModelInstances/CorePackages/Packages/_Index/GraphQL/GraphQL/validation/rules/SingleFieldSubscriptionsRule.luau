local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local graphQLError = require(parent.error.GraphQLError).GraphQLError

return {
	SingleFieldSubscriptionsRule = function(p1)
		-- upvalues: graphQLError (ref), array (ref)
		return {
			OperationDefinition = function(_, p2)
				-- upvalues: p1 (ref), graphQLError (copy), array (copy)
				if p2.operation == "subscription" and #p2.selectionSet.selections ~= 1 then
					p1:reportError(graphQLError.new(p2.name and ("Subscription \"%s\" must select only one top level field."):format(p2.name.value) or "Anonymous Subscription must select only one top level field.", array.slice(p2.selectionSet.selections, 2)))
				end
			end
		}
	end
}