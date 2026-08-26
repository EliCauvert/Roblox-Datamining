local roduxUsers = script:FindFirstAncestor("RoduxUsers")
local parent = roduxUsers.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local actions = roduxUsers.Actions
local models = roduxUsers.Models
local userRemovedModule = require(actions.UserRemoved)
local userUpdatedModule = require(actions.UserUpdated)
local userModelModule = require(models.UserModel)

local _ = function(p1, p2)
	local var1 = nil
	
	for i, v in pairs(p2) do
		if v == p1 then
			var1 = i
			
			return var1
		end
	end
	return var1
end

local var2 = function(p3, p4)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p4) do
		if v.name then
			t[v.name] = tostring(v.id)
		end
	end
	return cryoModule.Dictionary.join(p3, t)
end

local t = {}

return function(p5)
	-- upvalues: roduxModule (ref), t (ref), var2 (ref), userUpdatedModule (ref), userModelModule (ref), cryoModule (ref), userRemovedModule (ref)
	local usersNetworking = p5.usersNetworking
	local friendsNetworking = p5.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[usersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p6, p7)
			-- upvalues: var2 (copy)
			return var2(p6, { p7.responseBody })
		end,
		[usersNetworking.GetSkinnyUsersFromUserIds.Succeeded.name] = function(p6, p7)
			-- upvalues: var2 (copy)
			return var2(p6, p7.responseBody.data)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p6, p7)
			-- upvalues: var2 (copy)
			return var2(p6, p7.responseBody.data)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p6, p7)
			-- upvalues: var2 (copy)
			return var2(p6, p7.responseBody.data)
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p6, p7)
			-- upvalues: var2 (copy)
			return var2(p6, p7.responseBody.data)
		end,
		[userUpdatedModule.name] = function(p6, p7)
			-- upvalues: userModelModule (copy), cryoModule (copy)
			assert(userModelModule.isValid(p7.payload))
			
			return cryoModule.Dictionary.join(p6, { [p7.payload.username] = p7.payload.id })
		end,
		[userRemovedModule.name] = function(p6, p7)
			-- upvalues: cryoModule (copy)
			assert(type(p7.payload.id) == "string", "Expected id to be a string")
			local id = p7.payload.id
			local var3 = nil
			
			for i, v in pairs(p6) do
				if v == id then
					var3 = i
					break
				end
			end
			return if var3 then cryoModule.Dictionary.join(p6, { [var3] = cryoModule.None }) else p6
		end
	})
end