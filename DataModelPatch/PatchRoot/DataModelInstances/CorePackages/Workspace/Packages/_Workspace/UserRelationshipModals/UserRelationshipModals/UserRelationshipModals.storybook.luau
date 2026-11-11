local UserRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local Parent = UserRelationshipModals.Parent

return {
	name = "UserRelationshipModals",
	storyRoots = { UserRelationshipModals.Stories },
	roact = require(Parent.React),
	reactRoblox = require(Parent.ReactRoblox)
}