local groupsWrapperContextModule = require(script.Parent.GroupsWrapperContext)
local reactModule = require(script:FindFirstAncestor("Groups").Parent.React)

return function()
	-- upvalues: reactModule (ref), groupsWrapperContextModule (ref)
	return reactModule.useContext(groupsWrapperContextModule)
end