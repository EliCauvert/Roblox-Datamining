local RoduxUsers = script:FindFirstAncestor("RoduxUsers")
local Parent = RoduxUsers.Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local Actions = RoduxUsers.Actions
local UserRemovedModule = require(Actions.UserRemoved)
local UserUpdatedModule = require(Actions.UserUpdated)
local UserModelModule = require(RoduxUsers.Models.UserModel)
local t = {}

local function v9(p1, List) --[[ Line: 14 ]]
	-- upvalues: UserModelModule (copy), CryoModule (copy)
	local NewResults = {}
	
	for _, value in ipairs(List) do
		local Text = tostring(value.id)
		NewResults[Text] = UserModelModule.new({
			id = Text,
			username = value.name or "",
			displayName = value.displayName or "",
			hasVerifiedBadge = value.hasVerifiedBadge,
			created = value.created
		})
	end
	return CryoModule.Dictionary.join(p1, NewResults)
end

return function(p2) --[[ Line: 32 ]]
	-- upvalues: RoduxModule (copy), t (copy), v9 (copy), UserUpdatedModule (copy), UserModelModule (copy), CryoModule (copy), UserRemovedModule (copy)
	local UsersNetworking = p2.usersNetworking
	local FriendsNetworking = p2.friendsNetworking
	
	return RoduxModule.createReducer(t, {
		[UsersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p3, p4) --[[ Line: 37 ]]
			-- upvalues: v9 (upval)
			return v9(p3, { p4.responseBody })
		end,
		[UsersNetworking.GetSkinnyUsersFromUserIds.Succeeded.name] = function(p3, p4) --[[ Line: 41 ]]
			-- upvalues: v9 (upval)
			return v9(p3, p4.responseBody.data)
		end,
		[FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p3, p4) --[[ Line: 45 ]]
			-- upvalues: v9 (upval)
			return v9(p3, p4.responseBody.data)
		end,
		[FriendsNetworking.GetFriendRequests.Succeeded.name] = function(p3, p4) --[[ Line: 49 ]]
			-- upvalues: v9 (upval)
			return v9(p3, p4.responseBody.data)
		end,
		[FriendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p3, p4) --[[ Line: 53 ]]
			-- upvalues: v9 (upval)
			return v9(p3, p4.responseBody.data)
		end,
		[UserUpdatedModule.name] = function(p3, p4) --[[ Line: 57 ]]
			-- upvalues: UserModelModule (upval), CryoModule (upval)
			assert(UserModelModule.isValid(p4.payload))
			
			return CryoModule.Dictionary.join(p3, { [p4.payload.id] = p4.payload })
		end,
		[UserRemovedModule.name] = function(p3, p4) --[[ Line: 65 ]]
			-- upvalues: CryoModule (upval)
			assert(type(p4.payload.id) == "string", "Expected id to be a string")
			
			return CryoModule.Dictionary.join(p3, { [p4.payload.id] = CryoModule.None })
		end
	})
end