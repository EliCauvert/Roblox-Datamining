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

local function _(p0) --[[ line: 18 | named "mapFriendshipStatusToEnum" ]]
	return if p0 == "NotFriends" then Enum.FriendStatus.NotFriend elseif p0 == "Friends" then Enum.FriendStatus.Friend elseif p0 == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif p0 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
end

local function difference(p1, p2) --[[ line: 32 ]]
	local t = {}
	
	for i, v in pairs(p1) do
		t[v] = true
	end
	for i, v_1 in pairs(p2) do
		t[v_1] = nil
	end
	local t_1 = {}
	local var10 = 0
	
	for i_2, v_2 in pairs(p1) do
		if t[v_2] then
			var10 += 1
			t_1[var10] = v_2
		end
	end
	return t_1
end

return function(p3) --[[ line: 54 ]]
	-- upvalues: roduxModule (ref), t (ref), llamaModule (ref), difference (ref), friendshipDestroyedModule (ref), friendshipCreatedModule (ref), friendRequestCreatedModule (ref), friendRequestDeclinedModule (ref)
	local friendsNetworking = p3.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[friendsNetworking.GetFriendshipStatus.Succeeded.name] = function(p4, p5) --[[ line: 58 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p5.responseBody.data) do
				local status = v.status
				t[tostring(v.id)] = if status == "NotFriends" then Enum.FriendStatus.NotFriend elseif status == "Friends" then Enum.FriendStatus.Friend elseif status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
			end
			return llamaModule.Dictionary.join(p4, t)
		end,
		[friendsNetworking.GetExtendedFriendshipStatus.Succeeded.name] = function(p6, p7) --[[ line: 66 ]]
			-- upvalues: llamaModule (copy)
			local var12 = tostring(p7.ids[1])
			local join = llamaModule.Dictionary.join
			local t = {}
			local status = p7.responseBody.status
			t[var12] = if status == "NotFriends" then Enum.FriendStatus.NotFriend elseif status == "Friends" then Enum.FriendStatus.Friend elseif status == "RequestSent" then Enum.FriendStatus.FriendRequestSent elseif status == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown
			
			return join(p6, t)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p8, p9) --[[ line: 71 ]]
			-- upvalues: llamaModule (copy), difference (copy)
			local var14 = llamaModule.Dictionary.keys(llamaModule.Dictionary.filter(p8, function(p10) --[[ line: 72 ]]
				return p10 == Enum.FriendStatus.Friend
			end))
			local var15 = llamaModule.List.map(llamaModule.Dictionary.values(p9.responseBody.data), function(p11) --[[ line: 75 ]]
				return tostring(p11.id)
			end)
			local var16 = difference(var14, var15)
			
			for i, v in pairs(difference(var15, var14)) do
				p8 = llamaModule.Dictionary.join(p8, { [v] = Enum.FriendStatus.Friend })
			end
			for i, v_1 in pairs(var16) do
				p8 = llamaModule.Dictionary.join(p8, { [v_1] = Enum.FriendStatus.Unknown })
			end
			return p8
		end,
		[friendsNetworking.UnfriendTargetUserId.Succeeded.name] = function(p12, p13) --[[ line: 94 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p12, {
				[tostring(p13.namedIds.users)] = Enum.FriendStatus.NotFriend
			})
		end,
		[friendsNetworking.AcceptFriendRequestFromUserId.Succeeded.name] = function(p14, p15) --[[ line: 101 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p14, { [tostring(p15.ids[1])] = Enum.FriendStatus.Friend })
		end,
		[friendsNetworking.DeclineFriendRequestFromUserId.Succeeded.name] = function(p16, p17) --[[ line: 108 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p17.ids) do
				t[tostring(v)] = Enum.FriendStatus.NotFriend
			end
			return llamaModule.Dictionary.join(p16, t)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p18, p19) --[[ line: 117 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p19.responseBody.data) do
				t[tostring(v.id)] = Enum.FriendStatus.FriendRequestReceived
			end
			return llamaModule.Dictionary.join(p18, t)
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(p20) --[[ line: 126 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p20) do
				if v == Enum.FriendStatus.FriendRequestReceived then
					t[tostring(i)] = Enum.FriendStatus.NotFriend
				end
			end
			return llamaModule.Dictionary.join(p20, t)
		end,
		[friendsNetworking.RequestFriendshipFromUserId.Succeeded.name] = function(p21, p22) --[[ line: 136 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p21, {
				[tostring(p22.namedIds.users)] = Enum.FriendStatus.FriendRequestSent
			})
		end,
		[friendsNetworking.RequestFriendshipFromContactId.Succeeded.name] = function(p23, p24) --[[ line: 143 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p23, {
				[tostring(p24.namedIds.contacts)] = Enum.FriendStatus.FriendRequestSent
			})
		end,
		[friendshipDestroyedModule.name] = function(p25, p26) --[[ line: 150 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p25, {
				[tostring(p26.payload.userId1)] = Enum.FriendStatus.NotFriend
			})
		end,
		[friendshipCreatedModule.name] = function(p27, p28) --[[ line: 157 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p27, {
				[tostring(p28.payload.userId1)] = Enum.FriendStatus.Friend
			})
		end,
		[friendRequestCreatedModule.name] = function(p29, p30) --[[ line: 164 ]]
			-- upvalues: llamaModule (copy)
			return llamaModule.Dictionary.join(p29, {
				[tostring(p30.requesteeId)] = Enum.FriendStatus.FriendRequestReceived
			})
		end,
		[friendRequestDeclinedModule.name] = function(p31, p32) --[[ line: 171 ]]
			-- upvalues: llamaModule (copy)
			local t = {}
			
			for i, v in pairs(p32.ids) do
				t[tostring(v)] = Enum.FriendStatus.NotFriend
			end
			return llamaModule.Dictionary.join(p31, t)
		end
	})
end