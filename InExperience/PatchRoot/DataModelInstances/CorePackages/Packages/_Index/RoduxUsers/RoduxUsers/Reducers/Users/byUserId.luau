local roduxUsers = script:FindFirstAncestor("RoduxUsers")
local parent = roduxUsers.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local actions = roduxUsers.Actions
local models = roduxUsers.Models
local userRemovedModule = require(actions.UserRemoved)
local userUpdatedModule = require(actions.UserUpdated)
local userModelModule = require(models.UserModel)
local t = {}

local var1 = function(p1, p2)
	-- upvalues: userModelModule (ref), cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p2) do
		local var2 = tostring(v.id)
		t[var2] = userModelModule.new({
			id = var2,
			username = v.name or "",
			displayName = v.displayName or "",
			hasVerifiedBadge = v.hasVerifiedBadge,
			created = v.created
		})
	end
	return cryoModule.Dictionary.join(p1, t)
end

return function(p3)
	-- upvalues: roduxModule (ref), t (ref), var1 (ref), userUpdatedModule (ref), userModelModule (ref), cryoModule (ref), userRemovedModule (ref)
	local usersNetworking = p3.usersNetworking
	local friendsNetworking = p3.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[usersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p4, p5)
			-- upvalues: var1 (copy)
			return var1(p4, { p5.responseBody })
		end,
		[usersNetworking.GetSkinnyUsersFromUserIds.Succeeded.name] = function(p4, p5)
			-- upvalues: var1 (copy)
			return var1(p4, p5.responseBody.data)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p4, p5)
			-- upvalues: var1 (copy)
			return var1(p4, p5.responseBody.data)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p4, p5)
			-- upvalues: var1 (copy)
			return var1(p4, p5.responseBody.data)
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p4, p5)
			-- upvalues: var1 (copy)
			return var1(p4, p5.responseBody.data)
		end,
		[userUpdatedModule.name] = function(p4, p5)
			-- upvalues: userModelModule (copy), cryoModule (copy)
			assert(userModelModule.isValid(p5.payload))
			
			return cryoModule.Dictionary.join(p4, { [p5.payload.id] = p5.payload })
		end,
		[userRemovedModule.name] = function(p4, p5)
			-- upvalues: cryoModule (copy)
			assert(type(p5.payload.id) == "string", "Expected id to be a string")
			
			return cryoModule.Dictionary.join(p4, { [p5.payload.id] = cryoModule.None })
		end
	})
end