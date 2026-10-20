local AddFriendsState = script:FindFirstAncestor("AddFriendsState")
local Parent = AddFriendsState.Parent
local DashModule = require(Parent.Dash)
local LlamaModule = require(Parent.llama)
local Constants = require(Parent.ContactImporter).Constants
local FriendsNetworkingModule = require(AddFriendsState.Networking.FriendsNetworking)

local function v6(p1, Ids)
	-- upvalues: LlamaModule (copy), DashModule (copy)
	return {
		seenContactImporterFriendRequest = p1.seenContactImporterFriendRequest,
		contactImporterFriendRequests = LlamaModule.Dictionary.filter(p1.contactImporterFriendRequests, function(_, p2): boolean
			-- upvalues: DashModule (upval), Ids (copy)
			return not DashModule.includes(Ids, p2)
		end)
	}
end

return require(Parent.Rodux).createReducer({
	seenContactImporterFriendRequest = false,
	contactImporterFriendRequests = {}
}, {
	[FriendsNetworkingModule.AcceptFriendRequestFromUserId.Succeeded.name] = function(p1, p2)
		-- upvalues: v6 (copy)
		return (v6(p1, p2.ids))
	end,
	[FriendsNetworkingModule.DeclineFriendRequestFromUserId.Succeeded.name] = function(p1, p2)
		-- upvalues: v6 (copy)
		return (v6(p1, p2.ids))
	end,
	[require(AddFriendsState.RoduxFriends).Actions.FriendRequestCreated.name] = function(p1, p2)
		-- upvalues: Constants (copy), LlamaModule (copy)
		local Id = p2.id
		
		return if p2.originSourceType == Constants.PHONE_CONTACT_IMPORTER then LlamaModule.Dictionary.join(p1, {
			contactImporterFriendRequests = LlamaModule.Dictionary.join(p1.contactImporterFriendRequests, { [tostring(Id)] = true })
		}) else p1
	end,
	[FriendsNetworkingModule.GetFriendRequests.Succeeded.name] = function(p1, p2)
		-- upvalues: Constants (copy), LlamaModule (copy)
		local t = {}
		
		for _, entry in pairs(p2.responseBody.data) do
			if entry.friendRequest.originSourceType == Constants.PHONE_CONTACT_IMPORTER then
				t[tostring(entry.id)] = true
			end
		end
		return LlamaModule.Dictionary.join(p1, {
			contactImporterFriendRequests = LlamaModule.Dictionary.join(p1.contactImporterFriendRequests, t)
		})
	end,
	[require(AddFriendsState.Actions.ContactImporterWarningSeen).name] = function(p3, _)
		-- upvalues: LlamaModule (copy)
		return if LlamaModule.isEmpty(p3.contactImporterFriendRequests) then p3 else LlamaModule.Dictionary.join(p3, { seenContactImporterFriendRequest = true })
	end
})