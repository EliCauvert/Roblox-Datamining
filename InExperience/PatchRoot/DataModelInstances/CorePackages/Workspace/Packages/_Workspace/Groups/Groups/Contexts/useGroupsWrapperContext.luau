local GroupsWrapperContextModule = require(script.Parent.GroupsWrapperContext)
local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)

return function() --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy), GroupsWrapperContextModule (copy)
	return ReactModule.useContext(GroupsWrapperContextModule)
end