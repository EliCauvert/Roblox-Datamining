-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

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

local var7 = function(p0, p1) --[[ line: 14 ]]
	-- upvalues: userModelModule (ref), cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		local var9 = tostring(v.id)
		t[var9] = userModelModule.new({
			id = var9,
			username = v.name or "",
			displayName = v.displayName or "",
			hasVerifiedBadge = v.hasVerifiedBadge,
			created = v.created
		})
	end
	return cryoModule.Dictionary.join(p0, t)
end

return function(p2) --[[ line: 32 ]]
	-- upvalues: roduxModule (ref), t (ref), var7 (ref), userUpdatedModule (ref), userModelModule (ref), cryoModule (ref), userRemovedModule (ref)
	local usersNetworking = p2.usersNetworking
	local friendsNetworking = p2.friendsNetworking
	
	return roduxModule.createReducer(t, {
		[usersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p3, p4) --[[ line: 37 ]]
			-- upvalues: var7 (copy)
			return var7(p3, { p4.responseBody })
		end,
		[usersNetworking.GetSkinnyUsersFromUserIds.Succeeded.name] = function(p5, p6) --[[ line: 41 ]]
			-- upvalues: var7 (copy)
			return var7(p5, p6.responseBody.data)
		end,
		[friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p7, p8) --[[ line: 45 ]]
			-- upvalues: var7 (copy)
			return var7(p7, p8.responseBody.data)
		end,
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(p9, p10) --[[ line: 49 ]]
			-- upvalues: var7 (copy)
			return var7(p9, p10.responseBody.data)
		end,
		[friendsNetworking.GetFriendRecommendationsFromUserId.Succeeded.name] = function(p11, p12) --[[ line: 53 ]]
			-- upvalues: var7 (copy)
			return var7(p11, p12.responseBody.data)
		end,
		[userUpdatedModule.name] = function(p13, p14) --[[ line: 57 ]]
			-- upvalues: userModelModule (copy), cryoModule (copy)
			assert(userModelModule.isValid(p14.payload))
			
			return cryoModule.Dictionary.join(p13, { [p14.payload.id] = p14.payload })
		end,
		[userRemovedModule.name] = function(p15, p16) --[[ line: 65 ]]
			-- upvalues: cryoModule (copy)
			assert(type(p16.payload.id) == "string", "Expected id to be a string")
			
			return cryoModule.Dictionary.join(p15, { [p16.payload.id] = cryoModule.None })
		end
	})
end