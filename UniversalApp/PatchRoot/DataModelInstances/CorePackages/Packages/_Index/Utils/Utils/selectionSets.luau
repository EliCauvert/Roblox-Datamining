local t = {}
local parse = require(script.Parent.Parent.GraphQL).parse
local _ = require(script.Parent.Interfaces)

function t.parseSelectionSet(value, p1)
	-- upvalues: parse (ref)
	return parse(value, p1).definitions[1].selectionSet
end

return t