local RoduxUsers = script:FindFirstAncestor("RoduxUsers")
local Parent = RoduxUsers.Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local Actions = RoduxUsers.Actions
local UserRemovedModule = require(Actions.UserRemoved)
local UserUpdatedModule = require(Actions.UserUpdated)
local UserModelModule = require(RoduxUsers.Models.UserModel)

local function _(p1, List) --[[ Line: 13 ]]
	local v1 = nil
	
	for i, value in pairs(List) do
		if value == p1 then
			v1 = i
			
			return v1
		end
	end
	return v1
end

local function v9(p2, List) --[[ Line: 25 ]]
	-- upvalues: CryoModule (copy)
	local t = {}
	
	for _, value in ipairs(List) do
		if value.name then
			t[value.name] = tostring(value.id)
		end
	end
	return CryoModule.Dictionary.join(p2, t)
end

local t = {}

return function(p3) --[[ Line: 37 ]]
	-- upvalues: RoduxModule (copy), t (copy), v9 (copy), UserUpdatedModule (copy), UserModelModule (copy), CryoModule (copy), UserRemovedModule (copy)
	local UsersNetworking = p3.usersNetworking
	local FriendsNetworking = p3.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[UsersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p4, p5) --[[ Line: 42 ]]
			-- upvalues: v9 (upval)
			return v9(p4, { p5.responseBody })
		end,
		[UsersNetworking.GetSkinnyUsersFromUserIds.Succeeded.name] = function(p4, p5) --[[ Line: 46 ]]
			-- upvalues: v9 (upval)
			return v9(p4, p5.responseBody.data)
		end,
		[FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p4, p5) --[[ Line: 50 ]]
			-- upvalues: v9 (upval)
			return v9(p4, p5.responseBody.data)
		end,
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(p4, p5) --[[ Line: 54 ]]
			-- upvalues: v9 (upval)
			return v9(p4, p5.responseBody.data)
		end,
		[FriendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p4, p5) --[[ Line: 58 ]]
			-- upvalues: v9 (upval)
			return v9(p4, p5.responseBody.data)
		end,
		[UserUpdatedModule.name] = function(p4, p5) --[[ Line: 62 ]]
			-- upvalues: UserModelModule (upval), CryoModule (upval)
			assert(UserModelModule.isValid(p5.payload))
			
			return CryoModule.Dictionary.join(p4, { [p5.payload.username] = p5.payload.id })
		end,
		[UserRemovedModule.name] = function(Ids, p4) --[[ Line: 70 ]]
			-- upvalues: CryoModule (upval)
			assert(type(p4.payload.id) == "string", "Expected id to be a string")
			local Id = p4.payload.id
			local v2 = nil
			
			for i, id in pairs(Ids) do
				if id == Id then
					v2 = i
					break
				end
			end
			return if v2 then CryoModule.Dictionary.join(Ids, { [v2] = CryoModule.None }) else Ids
		end
	})
end