local t = {}
local isType = require(script.Parent.Parent.Parent.Parent.GraphQL).isType

function t.removeTemporaryGlobals() --[[ line: 26 ]]
	-- upvalues: isType (ref)
	isType(nil)
	
	return (function() --[[ line: 33 | named "remove" ]] end)()
end

return t