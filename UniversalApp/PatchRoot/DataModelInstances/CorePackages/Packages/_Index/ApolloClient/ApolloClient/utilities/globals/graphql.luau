local IsTypeFunction = require(script.Parent.Parent.Parent.Parent.GraphQL).isType

return {
	removeTemporaryGlobals = function()
		-- upvalues: IsTypeFunction (copy)
		IsTypeFunction(nil)
		
		return (function() end)()
	end
}