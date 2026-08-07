local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local listContextModule = require(script.Parent.ListContext)

return function() --[[ line: 8 ]]
	-- upvalues: reactModule (ref), listContextModule (ref)
	return reactModule.useContext(listContextModule)
end