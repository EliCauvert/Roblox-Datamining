local promptFriendRequestModalContainerModule = require(script.Components.PromptFriendRequestModalContainer)
local launchUserRelationshipModalModule = require(script.InExperience.launchUserRelationshipModal)

return {
	["jest.config"] = script["jest.config"],
	launchPromptFriendRequestModal = function(p0)
		-- upvalues: launchUserRelationshipModalModule (ref), promptFriendRequestModalContainerModule (ref)
		launchUserRelationshipModalModule(promptFriendRequestModalContainerModule, { userId = p0 })
	end
}