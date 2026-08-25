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

return function(p0)
	-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), networkingFriends (ref), networkingContacts (ref), llama (ref), promise (ref), roduxContacts (ref)
	return {
		requestFriendship = function(p1)
			-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), p0 (ref), networkingFriends (copy)
			return if fFlagMigrateFriendshipStatusesRemainingActions then var1.RequestFriendship(p1.contactId, nil, { isContact = true }) else p0(networkingFriends.RequestFriendshipFromContactId.API(p1))
		end,
		findContacts = function()
			-- upvalues: p0 (ref), networkingContacts (copy)
			return p0(networkingContacts.FindContactFriends.API()):andThen(function(p2)
				return p2.responseBody.userContactIds
			end)
		end,
		getContactEntities = function(p3)
			-- upvalues: llama (copy), promise (copy), p0 (ref), networkingContacts (copy)
			return if llama.isEmpty(p3) or not p3 then promise.resolve() else p0(networkingContacts.GetContactEntitiesByContactId.API(p3))
		end,
		uploadContacts = function(p4)
			-- upvalues: p0 (ref), networkingContacts (copy)
			return p0(networkingContacts.UploadContactsByUser.API(p4))
		end,
		deviceContactsReceived = function(p5)
			-- upvalues: p0 (ref), roduxContacts (copy)
			return p0(roduxContacts.Actions.DeviceContactsReceived(p5))
		end,
		requestSent = function(p6)
			-- upvalues: p0 (ref), roduxContacts (copy)
			return p0(roduxContacts.Actions.RequestSent({ id = p6 }))
		end
	}
end