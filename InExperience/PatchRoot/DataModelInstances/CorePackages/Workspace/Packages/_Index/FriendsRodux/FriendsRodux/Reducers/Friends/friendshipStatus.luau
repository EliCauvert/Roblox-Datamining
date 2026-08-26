local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roduxModule = require(parent_1.Rodux)
local llamaModule = require(parent_1.llama)
local actions = parent.Actions
local friendshipCreatedModule = require(actions.FriendshipCreated)
local friendshipDestroyedModule = require(actions.FriendshipDestroyed)
local friendRequestCreatedModule = require(actions.FriendRequestCreated)
local friendRequestDeclinedModule = require(actions.FriendRequestDeclined)
local _ = require(parent.roduxFriendsTypes)
local t = {}

local function _(p1)
	return if p1 == "NotFriends" then Enum.FriendStatus.NotFriend elseif p1 == "Friends" then Enum.FriendStatus.Friend elseif p1 == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif p1 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
end

local function difference(p1, p2)
	local t = {}
	
	for i, v in pairs(p1) do
		t[v] = true
	end
	for i, v_1 in pairs(p2) do
		t[v_1] = nil
	end
	local t_1 = {}
	local var1 = 0
	
	for i_2, v_2 in pairs(p1) do
		if t[v_2] then
			var1 += 1
			t_1[var1] = v_2
		end
	end
	return t_1
end

return function(p3)
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), difference (ref), friendshipDestroyedModule (ref), friendshipCreatedModule (ref), friendRequestCreatedModule (ref), friendRequestDeclinedModule (ref)
	local friendsNetworking = p3.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.GetFriendshipStatus.Succeeded.name] = function(p4, p5)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p5.responseBody.data) do
				local status = v.status
				t[tostring(v.id)] = if status == "NotFriends" then Enum.FriendStatus.NotFriend elseif status == "Friends" then Enum.FriendStatus.Friend elseif status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
			end
			return llamaModule.Dictionary.join(p4, t)
		end,
		[friendsNetworking.GetFriendshipStatuses.Succeeded.name] = function(p6, p7)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p7.responseBody.data) do
				local status = v.status
				t[tostring(v.id)] = if status == "NotFriends" then Enum.FriendStatus.NotFriend elseif status == "Friends" then Enum.FriendStatus.Friend elseif status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
			end
			return llamaModule.Dictionary.join(p6, t)
		end,
		[friendsNetworking.GetExtendedFriendshipStatus.Succeeded.name] = function(p8, p9)
			-- upvalues: llamaModule (copy)
			local var2 = tostring(p9.ids[1])
			local join = llamaModule.Dictionary.join
			local t = {}
			local status = p9.responseBody.status
			t[var2] = if status == "NotFriends" then Enum.FriendStatus.NotFriend elseif status == "Friends" then Enum.FriendStatus.Friend elseif status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
			
			return join(p8, t)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p8, p9)
			-- upvalues: llamaModule (copy), difference (copy)
			local var2 = llamaModule.Dictionary.keys(llamaModule.Dictionary.filter(p8, function(p10)
				return p10 == Enum.FriendStatus.Friend
			end))
			local var3 = llamaModule.List.map(llamaModule.Dictionary.values(p9.responseBody.data), function(p10)
				return tostring(p10.id)
			end)
			local var4 = difference(var2, var3)
			
			for i, v in pairs(difference(var3, var2)) do
				p8 = llamaModule.Dictionary.join(p8, { [v] = Enum.FriendStatus.Friend })
			end
			for i, v_1 in pairs(var4) do
				p8 = llamaModule.Dictionary.join(p8, { [v_1] = Enum.FriendStatus.Unknown })
			end
			return p8
		end,
		[friendsNetworking.UnfriendTargetUserId.Succeeded.name] = function(p10, p11)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p10, {
				[tostring(p11.namedIds.users)] = Enum.FriendStatus.NotFriend
			})
		end,
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p10, p11)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p10, { [tostring(p11.ids[1])] = Enum.FriendStatus.Friend })
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p10, p11)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p11.ids) do
				t[tostring(v)] = Enum.FriendStatus.NotFriend
			end
			return llamaModule.Dictionary.join(p10, t)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p12, p13)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p13.responseBody.data) do
				t[tostring(v.id)] = Enum.FriendStatus.FriendRequestReceived
			end
			return llamaModule.Dictionary.join(p12, t)
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(p14)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p14) do
				if v == Enum.FriendStatus.FriendRequestReceived then
					t[tostring(i)] = Enum.FriendStatus.NotFriend
				end
			end
			return llamaModule.Dictionary.join(p14, t)
		end,
		[friendsNetworking.RequestFriendshipFromUserId.Succeeded.name] = function(p15, p16)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p15, {
				[tostring(p16.namedIds.users)] = Enum.FriendStatus.FriendRequestSent
			})
		end,
		[friendsNetworking.RequestFriendshipFromContactId.Succeeded.name] = function(p15, p16)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p15, {
				[tostring(p16.namedIds.contacts)] = Enum.FriendStatus.FriendRequestSent
			})
		end,
		[friendshipDestroyedModule.name] = function(p15, p16)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p15, {
				[tostring(p16.payload.userId1)] = Enum.FriendStatus.NotFriend
			})
		end,
		[friendshipCreatedModule.name] = function(p15, p16)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p15, {
				[tostring(p16.payload.userId1)] = Enum.FriendStatus.Friend
			})
		end,
		[friendRequestCreatedModule.name] = function(p15, p16)
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p15, {
				[tostring(p16.requesteeId)] = Enum.FriendStatus.FriendRequestReceived
			})
		end,
		[friendRequestDeclinedModule.name] = function(p15, p16)
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p16.ids) do
				t[tostring(v)] = Enum.FriendStatus.NotFriend
			end
			return llamaModule.Dictionary.join(p15, t)
		end
	})
end