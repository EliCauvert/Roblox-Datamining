local parent = script:FindFirstAncestor("UserProfiles").Parent
local _ = require(parent.ApolloClient)
local _ = require(parent.React)
local useUserProfilesFetch = require(script.Parent.Hooks).useUserProfilesFetch

return function(p0)
	-- upvalues: useUserProfilesFetch (ref)
	return p0.renderComponent(useUserProfilesFetch({ userIds = p0.userIds, query = p0.query }))
end