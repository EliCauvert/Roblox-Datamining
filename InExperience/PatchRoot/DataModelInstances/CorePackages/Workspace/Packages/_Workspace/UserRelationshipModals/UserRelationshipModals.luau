local promptFriendRequestModalContainerModule = require(script.Components.PromptFriendRequestModalContainer)
local launchUserRelationshipModalModule = require(script.InExperience.launchUserRelationshipModal)

return {
	["jest.config"] = script["jest.config"],
	launchPromptFriendRequestModal = function(p1)
		-- upvalues: launchUserRelationshipModalModule (ref), promptFriendRequestModalContainerModule (ref)
		launchUserRelationshipModalModule(promptFriendRequestModalContainerModule, { userId = p1 })
	end
}