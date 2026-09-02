local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local listContextModule = require(script.Parent.ListContext)

return function()
	-- upvalues: reactModule (ref), listContextModule (ref)
	return reactModule.useContext(listContextModule)
end