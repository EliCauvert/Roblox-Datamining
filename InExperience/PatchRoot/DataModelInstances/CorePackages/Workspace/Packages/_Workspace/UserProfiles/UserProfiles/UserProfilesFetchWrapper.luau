local Parent = script:FindFirstAncestor("UserProfiles").Parent
local _ = require(Parent.ApolloClient)
local _ = require(Parent.React)
local UseUserProfilesFetchFunction = require(script.Parent.Hooks).useUserProfilesFetch

return function(p1) --[[ Line: 15 ]]
	-- upvalues: UseUserProfilesFetchFunction (copy)
	return p1.renderComponent((UseUserProfilesFetchFunction({ userIds = p1.userIds, query = p1.query })))
end