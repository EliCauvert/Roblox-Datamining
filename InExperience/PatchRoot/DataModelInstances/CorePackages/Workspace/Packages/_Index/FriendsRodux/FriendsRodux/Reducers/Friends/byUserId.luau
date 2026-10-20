local FriendsRodux = script:FindFirstAncestor("FriendsRodux")
local Parent = FriendsRodux.Parent
local RoduxModule = require(Parent.Rodux)
local LlamaModule = require(Parent.llama)
local Actions = FriendsRodux.Actions
local FriendshipCreatedModule = require(Actions.FriendshipCreated)
local FriendshipDestroyedModule = require(Actions.FriendshipDestroyed)
local _ = require(FriendsRodux.roduxFriendsTypes)
local AddUserModule = require(script.Parent.utils.addUser)
local RemoveUserModule = require(script.Parent.utils.removeUser)
local SetFriendshipsInStoreModule = require(script.Parent.utils.setFriendshipsInStore)
local RemoveTargetUserFriendshipInStoreModule = require(script.Parent.utils.removeTargetUserFriendshipInStore)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), FriendshipCreatedModule (copy), LlamaModule (copy), AddUserModule (copy), FriendshipDestroyedModule (copy), RemoveUserModule (copy), SetFriendshipsInStoreModule (copy), RemoveTargetUserFriendshipInStoreModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[FriendshipCreatedModule.name] = function(p2, p3)
			-- upvalues: LlamaModule (upval), AddUserModule (upval)
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return LlamaModule.Dictionary.join(p2, {
				[p3.payload.userId1] = AddUserModule(p2[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = AddUserModule(p2[p3.payload.userId2], p3.payload.userId1)
			})
		end,
		[FriendshipDestroyedModule.name] = function(p2, p3)
			-- upvalues: LlamaModule (upval), RemoveUserModule (upval)
			assert(type(p3.payload.userId1) == "string", "Expected userId1 to be a string")
			assert(type(p3.payload.userId2) == "string", "Expected userId2 to be a string")
			
			return LlamaModule.Dictionary.join(p2, {
				[p3.payload.userId1] = RemoveUserModule(p2[p3.payload.userId1], p3.payload.userId2),
				[p3.payload.userId2] = RemoveUserModule(p2[p3.payload.userId2], p3.payload.userId1)
			})
		end,
		[FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: SetFriendshipsInStoreModule (upval)
			return SetFriendshipsInStoreModule(p2, p3)
		end,
		[FriendsNetworking.UnfriendTargetUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: RemoveTargetUserFriendshipInStoreModule (upval)
			return RemoveTargetUserFriendshipInStoreModule(p2, p3)
		end,
		[FriendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p2, p3)
			-- upvalues: LlamaModule (upval), AddUserModule (upval)
			local Text = tostring(p3.ids[1])
			local Text1 = tostring(p3.additionalData.currentUserId)
			
			return LlamaModule.Dictionary.join(p2, {
				[Text] = AddUserModule(p2[Text], Text1),
				[Text1] = AddUserModule(p2[Text1], Text)
			})
		end
	})
end