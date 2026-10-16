local ReactModule = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.React)
local HttpRequestContextModule = require(script.Parent.HttpRequestContext)

return function() --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), HttpRequestContextModule (copy)
	return ReactModule.useContext(HttpRequestContextModule)
end