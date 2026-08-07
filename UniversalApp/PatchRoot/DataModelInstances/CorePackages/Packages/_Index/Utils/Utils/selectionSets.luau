local t = {}
local parse = require(script.Parent.Parent.GraphQL).parse
local _ = require(script.Parent.Interfaces)

function t.parseSelectionSet(value, p0) --[[ line: 17 ]]
	-- upvalues: parse (ref)
	return parse(value, p0).definitions[1].selectionSet
end

return t