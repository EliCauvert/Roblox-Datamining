local IsTypeFunction = require(script.Parent.Parent.Parent.Parent.GraphQL).isType

return {
	removeTemporaryGlobals = function() --[[ Line: 26 ]]
		-- upvalues: IsTypeFunction (copy)
		IsTypeFunction(nil)
		
		return (function() --[[ Line: 33 | Named "remove" ]] end)()
	end
}