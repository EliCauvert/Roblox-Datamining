local ParseFunction = require(script.Parent.Parent.GraphQL).parse
local _ = require(script.Parent.Interfaces)

return {
	parseSelectionSet = function(p1, p2)
		-- upvalues: ParseFunction (copy)
		return ParseFunction(p1, p2).definitions[1].selectionSet
	end
}