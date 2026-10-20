local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local NetworkingFriends = DependenciesModule.NetworkingFriends
local _ = require(Parent.Common.LocalTypes)
local NetworkingContacts = DependenciesModule.NetworkingContacts
local RoduxContacts = DependenciesModule.RoduxContacts
local Promise = DependenciesModule.Promise
local Llama = DependenciesModule.llama
local FFlagMigrateFriendshipStatusesRemainingActions = require(Parent1.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local FriendsStoreChallengeNetworkModule = require(Parent.Networking.friendsStoreChallengeNetwork)
local FFlagEnableFriendsStoreChallengeInterceptor = require(Parent1.SharedFlags).FFlagEnableFriendsStoreChallengeInterceptor
local GetResult = require(Parent1.DataHydration).Friends.FriendsStore.get()

return function(Callback)
	-- upvalues: FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FriendsStoreChallengeNetworkModule (copy), NetworkingFriends (copy), NetworkingContacts (copy), Llama (copy), Promise (copy), RoduxContacts (copy)
	return {
		requestFriendship = function(p1)
			-- upvalues: FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), FFlagEnableFriendsStoreChallengeInterceptor (upval), FriendsStoreChallengeNetworkModule (upval), Callback (copy), NetworkingFriends (upval)
			return if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.RequestFriendship(p1.contactId, nil, { isContact = true }, if FFlagEnableFriendsStoreChallengeInterceptor then FriendsStoreChallengeNetworkModule else nil) else Callback(NetworkingFriends.RequestFriendshipFromContactId.API(p1))
		end,
		findContacts = function()
			-- upvalues: Callback (copy), NetworkingContacts (upval)
			return Callback(NetworkingContacts.FindContactFriends.API()):andThen(function(Result)
				return Result.responseBody.userContactIds
			end)
		end,
		getContactEntities = function(p1)
			-- upvalues: Llama (upval), Promise (upval), Callback (copy), NetworkingContacts (upval)
			return if Llama.isEmpty(p1) or not p1 then Promise.resolve() else Callback(NetworkingContacts.GetContactEntitiesByContactId.API(p1))
		end,
		uploadContacts = function(p1)
			-- upvalues: Callback (copy), NetworkingContacts (upval)
			return Callback(NetworkingContacts.UploadContactsByUser.API(p1))
		end,
		deviceContactsReceived = function(p1)
			-- upvalues: Callback (copy), RoduxContacts (upval)
			return Callback(RoduxContacts.Actions.DeviceContactsReceived(p1))
		end,
		requestSent = function(Id)
			-- upvalues: Callback (copy), RoduxContacts (upval)
			return Callback(RoduxContacts.Actions.RequestSent({ id = Id }))
		end
	}
end