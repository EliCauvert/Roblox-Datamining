local Parent = script.Parent.Parent.Parent
local _ = require(Parent.Parent.GraphQL)
local _ = require(Parent.jsutils.typedDocumentNode)
local _ = require(script.Parent.Parent.types.types)
local UseBaseQueryFunction = require(script.Parent.utils.useBaseQuery).useBaseQuery
local _ = require(Parent.core)

return {
	useQuery = function(p1, p2)
		-- upvalues: UseBaseQueryFunction (copy)
		return UseBaseQueryFunction(p1, p2, false)
	end
}