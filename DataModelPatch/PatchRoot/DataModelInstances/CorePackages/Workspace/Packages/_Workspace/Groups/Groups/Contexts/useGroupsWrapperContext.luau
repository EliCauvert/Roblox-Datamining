local GroupsWrapperContextModule = require(script.Parent.GroupsWrapperContext)
local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)

return function()
	-- upvalues: ReactModule (copy), GroupsWrapperContextModule (copy)
	return ReactModule.useContext(GroupsWrapperContextModule)
end