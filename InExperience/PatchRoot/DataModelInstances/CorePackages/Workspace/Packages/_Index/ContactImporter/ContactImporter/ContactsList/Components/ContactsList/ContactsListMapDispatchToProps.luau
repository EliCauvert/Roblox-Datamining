local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local networkingFriends = dependenciesModule.NetworkingFriends
local _ = require(parent.Common.LocalTypes)
local networkingContacts = dependenciesModule.NetworkingContacts
local roduxContacts = dependenciesModule.RoduxContacts
local promise = dependenciesModule.Promise
local llama = dependenciesModule.llama
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent_1.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var1 = require(parent_1.DataHydration).Friends.FriendsStore.get()

return function(p1)
	-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriends (ref), networkingContacts (ref), llama (ref), promise (ref), roduxContacts (ref)
	return {
		requestFriendship = function(p2)
			-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), p1 (ref), networkingFriends (copy)
			return if fFlagMigrateFriendshipStatusesRemainingActions then var1.RequestFriendship(p2.contactId, nil, { isContact = true }) else p1(networkingFriends.RequestFriendshipFromContactId.API(p2))
		end,
		findContacts = function()
			-- upvalues: p1 (ref), networkingContacts (copy)
			return p1(networkingContacts.FindContactFriends.API()):andThen(function(p2)
				return p2.responseBody.userContactIds
			end)
		end,
		getContactEntities = function(p2)
			-- upvalues: llama (copy), promise (copy), p1 (ref), networkingContacts (copy)
			return if llama.isEmpty(p2) or not p2 then promise.resolve() else p1(networkingContacts.GetContactEntitiesByContactId.API(p2))
		end,
		uploadContacts = function(p2)
			-- upvalues: p1 (ref), networkingContacts (copy)
			return p1(networkingContacts.UploadContactsByUser.API(p2))
		end,
		deviceContactsReceived = function(p2)
			-- upvalues: p1 (ref), roduxContacts (copy)
			return p1(roduxContacts.Actions.DeviceContactsReceived(p2))
		end,
		requestSent = function(p2)
			-- upvalues: p1 (ref), roduxContacts (copy)
			return p1(roduxContacts.Actions.RequestSent({ id = p2 }))
		end
	}
end