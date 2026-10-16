local PromptFriendRequestModalContainerModule = require(script.Components.PromptFriendRequestModalContainer)
local LaunchUserRelationshipModalModule = require(script.InExperience.launchUserRelationshipModal)

return {
	["jest.config"] = script["jest.config"],
	launchPromptFriendRequestModal = function(UserId) --[[ Line: 6 ]]
		-- upvalues: LaunchUserRelationshipModalModule (copy), PromptFriendRequestModalContainerModule (copy)
		LaunchUserRelationshipModalModule(PromptFriendRequestModalContainerModule, { userId = UserId })
	end
}