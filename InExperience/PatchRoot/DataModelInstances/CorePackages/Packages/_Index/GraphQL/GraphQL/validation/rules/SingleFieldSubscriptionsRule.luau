local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local graphQLError = require(parent.error.GraphQLError).GraphQLError

return {
	SingleFieldSubscriptionsRule = function(p0) --[[ line: 23 ]]
		-- upvalues: graphQLError (ref), array (ref)
		return {
			OperationDefinition = function(_, p1) --[[ line: 25 ]]
				-- upvalues: p0 (ref), graphQLError (copy), array (copy)
				if p1.operation == "subscription" and #p1.selectionSet.selections ~= 1 then
					p0:reportError(graphQLError.new(p1.name and ("Subscription \"%s\" must select only one top level field."):format(p1.name.value) or "Anonymous Subscription must select only one top level field.", array.slice(p1.selectionSet.selections, 2)))
				end
			end
		}
	end
}