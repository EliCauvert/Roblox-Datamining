local t = {}
local isType = require(script.Parent.Parent.Parent.Parent.GraphQL).isType

function t.removeTemporaryGlobals()
	-- upvalues: isType (ref)
	isType(nil)
	
	return (function() end)()
end

return t