local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local contextModule = require(script.Parent.Context)

return function()
	-- upvalues: reactModule (ref), contextModule (ref)
	return reactModule.useContext(contextModule)
end