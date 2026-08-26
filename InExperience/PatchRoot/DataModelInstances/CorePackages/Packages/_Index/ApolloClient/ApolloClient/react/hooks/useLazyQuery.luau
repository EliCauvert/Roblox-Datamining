local parent = script.Parent.Parent.Parent
local _ = require(parent.Parent.GraphQL)
local _ = require(parent.jsutils.typedDocumentNode)
local _ = require(parent.react.types.types)
local useBaseQuery = require(script.Parent.utils.useBaseQuery).useBaseQuery
local _ = require(parent.core)

return {
	useLazyQuery = function(p1, p2)
		-- upvalues: useBaseQuery (ref)
		return useBaseQuery(p1, p2, true)
	end
}