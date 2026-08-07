local reactModule = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.React)
local httpRequestContextModule = require(script.Parent.HttpRequestContext)

return function() --[[ line: 7 ]]
	-- upvalues: reactModule (ref), httpRequestContextModule (ref)
	return reactModule.useContext(httpRequestContextModule)
end