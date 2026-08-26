local t = {}
local parent = script.Parent.Parent.Parent
local _ = require(parent.Parent.GraphQL)
local _ = require(parent.jsutils.typedDocumentNode)
local _ = require(script.Parent.Parent.types.types)
local useBaseQuery = require(script.Parent.utils.useBaseQuery).useBaseQuery
local _ = require(parent.core)

function t.useQuery(p1, p2)
	-- upvalues: useBaseQuery (ref)
	return useBaseQuery(p1, p2, false)
end

return t