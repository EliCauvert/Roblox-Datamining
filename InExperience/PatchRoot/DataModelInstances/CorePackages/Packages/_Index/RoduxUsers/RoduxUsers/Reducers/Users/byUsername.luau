local roduxUsers = script:FindFirstAncestor("RoduxUsers")
local parent = roduxUsers.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local actions = roduxUsers.Actions
local models = roduxUsers.Models
local userRemovedModule = require(actions.UserRemoved)
local userUpdatedModule = require(actions.UserUpdated)
local userModelModule = require(models.UserModel)

local _ = function(p0, p1)
	local var8 = nil
	
	for i, v in pairs(p1) do
		if v == p0 then
			var8 = i
			
			return var8
		end
	end
	return var8
end

local var6 = function(p2, p3)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p3) do
		if v.name then
			t[v.name] = tostring(v.id)
		end
	end
	return cryoModule.Dictionary.join(p2, t)
end

local t = {}

return function(p4)
	-- upvalues: roduxModule (ref), t (ref), var6 (ref), userUpdatedModule (ref), userModelModule (ref), cryoModule (ref), userRemovedModule (ref)
	local usersNetworking = p4.usersNetworking
	local friendsNetworking = p4.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[usersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p5, p6)
			-- upvalues: var6 (copy)
			return var6(p5, { p6.responseBody })
		end,
		[usersNetworking.GetSkinnyUsersFromUserIds.Succeeded.name] = function(p7, p8)
			-- upvalues: var6 (copy)
			return var6(p7, p8.responseBody.data)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p9, p10)
			-- upvalues: var6 (copy)
			return var6(p9, p10.responseBody.data)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p11, p12)
			-- upvalues: var6 (copy)
			return var6(p11, p12.responseBody.data)
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p13, p14)
			-- upvalues: var6 (copy)
			return var6(p13, p14.responseBody.data)
		end,
		[userUpdatedModule.name] = function(p15, p16)
			-- upvalues: userModelModule (copy), cryoModule (copy)
			assert(userModelModule.isValid(p16.payload))
			
			return cryoModule.Dictionary.join(p15, { [p16.payload.username] = p16.payload.id })
		end,
		[userRemovedModule.name] = function(p17, p18)
			-- upvalues: cryoModule (copy)
			assert(type(p18.payload.id) == "string", "Expected id to be a string")
			local id = p18.payload.id
			local var10 = nil
			
			for i, v in pairs(p17) do
				if v == id then
					var10 = i
					break
				end
			end
			return if var10 then cryoModule.Dictionary.join(p17, { [var10] = cryoModule.None }) else p17
		end
	})
end