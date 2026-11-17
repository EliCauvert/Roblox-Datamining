local DataHydrationModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.DataHydration)

return function()
	-- upvalues: DataHydrationModule (copy)
	DataHydrationModule.Group.getGroupInfoStore(false).notifyMembershipChanged()
end