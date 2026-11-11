local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local ListContextModule = require(script.Parent.ListContext)

return function()
	-- upvalues: ReactModule (copy), ListContextModule (copy)
	return ReactModule.useContext(ListContextModule)
end