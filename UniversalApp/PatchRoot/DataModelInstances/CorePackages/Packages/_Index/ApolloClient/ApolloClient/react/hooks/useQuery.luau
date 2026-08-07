local t = {}
local parent = script.Parent.Parent.Parent
local _ = require(parent.Parent.GraphQL)
local _ = require(parent.jsutils.typedDocumentNode)
local _ = require(script.Parent.Parent.types.types)
local useBaseQuery = require(script.Parent.utils.useBaseQuery).useBaseQuery
local _ = require(parent.core)

function t.useQuery(p0, p1) --[[ line: 27 ]]
	-- upvalues: useBaseQuery (ref)
	return useBaseQuery(p0, p1, false)
end

return t