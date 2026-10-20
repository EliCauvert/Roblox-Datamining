local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoduxModule = require(Parent1.Rodux)
local LlamaModule = require(Parent1.llama)
local Actions = Parent.Actions
local FriendshipCreatedModule = require(Actions.FriendshipCreated)
local FriendshipDestroyedModule = require(Actions.FriendshipDestroyed)
local FriendRequestCreatedModule = require(Actions.FriendRequestCreated)
local FriendRequestDeclinedModule = require(Actions.FriendRequestDeclined)
local _ = require(Parent.roduxFriendsTypes)
local t = {}

local function _(p1)
	return if p1 == "NotFriends" then Enum.FriendStatus.NotFriend elseif p1 == "Friends" then Enum.FriendStatus.Friend elseif p1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif p1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
end

local function difference(List, KeysResult)
	local t = {}
	
	for _, value in pairs(List) do
		t[value] = true
	end
	for _, value1 in pairs(KeysResult) do
		t[value1] = nil
	end
	local t1 = {}
	local Count = 0
	
	for _, value2 in pairs(List) do
		if t[value2] then
			Count += 1
			t1[Count] = value2
		end
	end
	return t1
end

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), LlamaModule (copy), difference (copy), FriendshipDestroyedModule (copy), FriendshipCreatedModule (copy), FriendRequestCreatedModule (copy), FriendRequestDeclinedModule (copy)
	local FriendsNetworking = p1.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[FriendsNetworking.GetFriendshipStatus.Succeeded.name] = function(p2, p3)
			-- upvalues: LlamaModule (upval)
			local NotFriends = {}
			
			for _, entry in pairs(p3.responseBody.data) do
				local Status = entry.status
				NotFriends[tostring(entry.id)] = if Status == "NotFriends" then Enum.FriendStatus.NotFriend elseif Status == "Friends" then Enum.FriendStatus.Friend elseif Status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif Status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
			end
			return LlamaModule.Dictionary.join(p2, NotFriends)
		end,
		[FriendsNetworking.GetExtendedFriendshipStatus.Succeeded.name] = function(p4, p5)
			-- upvalues: LlamaModule (upval)
			local Status = p5.responseBody.status
			
			return LlamaModule.Dictionary.join(p4, {
				[tostring(p5.ids[1])] = if Status == "NotFriends" then Enum.FriendStatus.NotFriend elseif Status == "Friends" then Enum.FriendStatus.Friend elseif Status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif Status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
			})
		end,
		[FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(JoinResult, p4)
			-- upvalues: LlamaModule (upval), difference (upval)
			local KeysResult = LlamaModule.Dictionary.keys(LlamaModule.Dictionary.filter(JoinResult, function(FriendStatus): boolean
				return FriendStatus == Enum.FriendStatus.Friend
			end))
			local MapResult = LlamaModule.List.map(LlamaModule.Dictionary.values(p4.responseBody.data), function(p5): string
				return (tostring(p5.id))
			end)
			local DifferenceResult = difference(MapResult, KeysResult)
			local DifferenceResult1 = difference(KeysResult, MapResult)
			
			for _, value in pairs(DifferenceResult) do
				JoinResult = LlamaModule.Dictionary.join(JoinResult, { [value] = Enum.FriendStatus.Friend })
			end
			for _, value1 in pairs(DifferenceResult1) do
				JoinResult = LlamaModule.Dictionary.join(JoinResult, { [value1] = Enum.FriendStatus.Unknown })
			end
			return JoinResult
		end,
		[FriendsNetworking.UnfriendTargetUserId.Succeeded.name] = function(p5, p6)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p5, {
				[tostring(p6.namedIds.users)] = Enum.FriendStatus.NotFriend
			})
		end,
		[FriendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p5, p6)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p5, { [tostring(p6.ids[1])] = Enum.FriendStatus.Friend })
		end,
		[FriendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p5, p6)
			-- upvalues: LlamaModule (upval)
			local NotFriends = {}
			
			for _, id in pairs(p6.ids) do
				NotFriends[tostring(id)] = Enum.FriendStatus.NotFriend
			end
			return LlamaModule.Dictionary.join(p5, NotFriends)
		end,
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(p7, p8)
			-- upvalues: LlamaModule (upval)
			local t = {}
			
			for _, entry in pairs(p8.responseBody.data) do
				t[tostring(entry.id)] = Enum.FriendStatus.FriendRequestReceived
			end
			return LlamaModule.Dictionary.join(p7, t)
		end,
		[FriendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(FriendStatuses)
			-- upvalues: LlamaModule (upval)
			local NotFriends = {}
			
			for i, friendStatus in pairs(FriendStatuses) do
				if friendStatus == Enum.FriendStatus.FriendRequestReceived then
					NotFriends[tostring(i)] = Enum.FriendStatus.NotFriend
				end
			end
			return LlamaModule.Dictionary.join(FriendStatuses, NotFriends)
		end,
		[FriendsNetworking.RequestFriendshipFromUserId.Succeeded.name] = function(p9, p10)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p9, {
				[tostring(p10.namedIds.users)] = Enum.FriendStatus.FriendRequestSent
			})
		end,
		[FriendsNetworking.RequestFriendshipFromContactId.Succeeded.name] = function(p9, p10)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p9, {
				[tostring(p10.namedIds.contacts)] = Enum.FriendStatus.FriendRequestSent
			})
		end,
		[FriendshipDestroyedModule.name] = function(p9, p10)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p9, {
				[tostring(p10.payload.userId1)] = Enum.FriendStatus.NotFriend
			})
		end,
		[FriendshipCreatedModule.name] = function(p9, p10)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p9, {
				[tostring(p10.payload.userId1)] = Enum.FriendStatus.Friend
			})
		end,
		[FriendRequestCreatedModule.name] = function(p9, p10)
			-- upvalues: LlamaModule (upval)
			return LlamaModule.Dictionary.join(p9, {
				[tostring(p10.requesteeId)] = Enum.FriendStatus.FriendRequestReceived
			})
		end,
		[FriendRequestDeclinedModule.name] = function(p9, p10)
			-- upvalues: LlamaModule (upval)
			local NotFriends = {}
			
			for _, id in pairs(p10.ids) do
				NotFriends[tostring(id)] = Enum.FriendStatus.NotFriend
			end
			return LlamaModule.Dictionary.join(p9, NotFriends)
		end
	})
end