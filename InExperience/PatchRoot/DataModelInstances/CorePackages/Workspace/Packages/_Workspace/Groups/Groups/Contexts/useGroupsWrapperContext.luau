local groupsWrapperContextModule = require(script.Parent.GroupsWrapperContext)
local reactModule = require(script:FindFirstAncestor("Groups").Parent.React)

return function() --[[ line: 6 ]]
	-- upvalues: reactModule (ref), groupsWrapperContextModule (ref)
	return reactModule.useContext(groupsWrapperContextModule)
end