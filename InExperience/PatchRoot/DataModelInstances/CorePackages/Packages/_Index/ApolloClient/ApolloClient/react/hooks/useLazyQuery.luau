local Parent = script.Parent.Parent.Parent
local _ = require(Parent.Parent.GraphQL)
local _ = require(Parent.jsutils.typedDocumentNode)
local _ = require(Parent.react.types.types)
local UseBaseQueryFunction = require(script.Parent.utils.useBaseQuery).useBaseQuery
local _ = require(Parent.core)

return {
	useLazyQuery = function(p1, p2) --[[ Line: 26 ]]
		-- upvalues: UseBaseQueryFunction (copy)
		return UseBaseQueryFunction(p1, p2, true)
	end
}