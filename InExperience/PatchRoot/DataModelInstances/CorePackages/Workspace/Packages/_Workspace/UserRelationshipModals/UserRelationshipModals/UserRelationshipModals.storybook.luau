local userRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local parent = userRelationshipModals.Parent

return {
	name = "UserRelationshipModals",
	storyRoots = { userRelationshipModals.Stories },
	roact = require(parent.React),
	reactRoblox = require(parent.ReactRoblox)
}