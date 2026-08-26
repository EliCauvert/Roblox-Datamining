local parent = script:FindFirstAncestor("UserProfiles").Parent
local _ = require(parent.ApolloClient)
local _ = require(parent.React)
local useUserProfilesFetch = require(script.Parent.Hooks).useUserProfilesFetch

return function(p1)
	-- upvalues: useUserProfilesFetch (ref)
	return p1.renderComponent(useUserProfilesFetch({ userIds = p1.userIds, query = p1.query }))
end